package com.springbootstudy.dhere.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.springbootstudy.dhere.domain.Follower;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Scrap;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.service.FollowerService;
import com.springbootstudy.dhere.service.MemberService;
import com.springbootstudy.dhere.service.ScrapService;
import com.springbootstudy.dhere.service.StoryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ScrapController {
	
	private static final String DEFAULT_PATH = "src/main/resources/static/resources/images/profile/";
	
	@Autowired
	private ScrapService scrapService;
	
	public void setScrapService(ScrapService scrapService) {
		this.scrapService = scrapService;
	}
	
	@Autowired
	private MemberService memberService;	
	
	@Autowired
	private StoryService storyService;
	
	@Autowired
	private FollowerService followerService;
	
	 @GetMapping("/myScraps")
	    public String showMyScraps(Model model, HttpSession session) {
	        Member member = (Member) session.getAttribute("member");

	        if (member != null) {
	            // 로그인한 멤버의 이메일을 가져와서 해당 멤버의 스크랩 목록을 조회
	            String email = member.getEmail();
	            List<Scrap> myScraps = scrapService.scrapList(email);

	            // 조회된 스크랩 목록을 모델에 추가
	            model.addAttribute("myScraps", myScraps);

	            // 여기서 "myScraps"는 뷰 페이지에서 참조할 수 있는 속성 이름입니다.
	            return "myScraps"; // 뷰 페이지 이름 (myScraps.jsp 또는 myScraps.html 등)
	        } else {
	            // 로그인되지 않은 경우 로그인 페이지로 리다이렉트 또는 다른 처리
	            return "redirect:/login"; // 예시로 로그인 페이지로 리다이렉트
	        }
	    }
	
	 @GetMapping("/scrap")
	 public String getMyPosts(Model model, HttpSession session) {
	     Member member = (Member) session.getAttribute("member");
	     String userEmail = member.getEmail();

	     List<Story> sList = storyService.sList(member.getEmail());
	     model.addAttribute("sList", sList);

	     List<Follower> fList = followerService.followList(member.getEmail());
	     model.addAttribute("fList", fList);
	     
	     List<Scrap> scList = scrapService.scList(member.getEmail());
	     model.addAttribute("scList", scList);
	     
         int totalThanks = storyService.getTotalThanksByEmail(userEmail);
         model.addAttribute("totalThanks", totalThanks);
	     
	     return "scrap";
	 }
	
	// 회원정보 받기
	@GetMapping(value="/mypage")
	public String email (Model model,
			HttpSession session ,
			@RequestParam(value="email", defaultValue="test") String email) {
		
		// 세션 객체 안에 있는 이메일 정보 저장
		Scrap scrap = scrapService.getScrap(email);

		// 정보 저장 후 페이지 이동
		model.addAttribute("scrap", scrap);
		
		return "scrap";
	}
	
	//	스크랩하기(syj)
	@PostMapping("/insertScrap")
	public String insertScrap(Scrap s, HttpSession session,
			@RequestParam("storyNo") String storyNo) {
	    Member member = (Member) session.getAttribute("member");

	    // Member 객체에서 이메일을 추출하여 Scrap 객체에 설정
	    if (member != null) {
	        s.setEmail(member.getEmail());
	        scrapService.insertScrap(s);
	    }

	    return "redirect:/storyDetail?storyNo=" + storyNo;
	}
	
	// 언스크랩 하기(syj)
	@PostMapping("/deleteScrap")
	public String deleteScrap(
			@RequestParam("storyNo") int storyNo) {
		
	    scrapService.deleteScrap(storyNo);
	    
	    return "redirect:/storyDetail?storyNo=" + storyNo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
   @GetMapping("/mypageUpdateProcess")
    public String mypageUpdateProcess() {
        return "member/mypageUpdateProcess";
    }
  
   @GetMapping("/mypageUpdateForm")
   public String updateForm(Model model, HttpSession session) {
	   return "member/mypageUpdateForm"; 
   }

		// 회원 정보 수정하는 ajax 요청을 처리하는 컨트롤러
		@PostMapping("/passCheck.ajax")
		@ResponseBody
		public Map<String, Boolean> memberPassCheck(
				@RequestParam("email") String email, 
				@RequestParam("pass") String pass) {
			
			System.out.println("passcheckk" + email);
			System.out.println(pass);
			boolean result = memberService.memberPassCheck(email, pass);
			Map<String, Boolean> map = new HashMap<String, Boolean>();
			map.put("result", result);
			
			return map;
		}
		
		  //회원수정 폼에서 들어오는 요청을 처리하는 메서드
	      @PostMapping("/mypageUpdateResult")
	      public String mypageUpdageInfo(Model model,
	            @RequestParam("email") String email,
	            @RequestParam("newPass1") String pass1, 
	            @RequestParam("newPass2") String pass2,
	            @RequestParam("phone") String phone,  
	            @RequestParam("nickname") String nickname, 
	            @RequestParam("zipcode") String zipcode,
	            @RequestParam("address1") String address1, 
	            @RequestParam("address2")String address2, 
	            @RequestParam("job") String job,
	            @RequestParam(value="picture1", required=false) MultipartFile multipartFile, 
	            HttpSession session, HttpServletRequest request) throws IOException {
	            
	            // 로그인 할 때 세션에 저장된 회원정보를 읽어와서
	            Member member = (Member) session.getAttribute("member");            
	            member.setEmail(email);
	            member.setPass(pass1);
	            member.setPhone(phone);
	            member.setNickname(nickname);
	            member.setZipcode(zipcode);
	            member.setAddress1(address1);
	            member.setAddress2(address2);
	            member.setJob(job);
	         
	         if (multipartFile != null && !multipartFile.isEmpty()) {
	               
	        	 	File parent = new File(DEFAULT_PATH);
	        	 	log.info("parent abs path : " + parent.getAbsolutePath());
	            	log.info("parent path : " + parent.getPath());
	            	log.info("exist : " + parent.exists() + ", dir : " + parent.isDirectory());
	               
	            	// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
	            	if (!parent.exists()) {
	            		parent.mkdirs();
	            	}
	               
	               UUID uid = UUID.randomUUID();
	               String extension = StringUtils.getFilenameExtension(multipartFile.getOriginalFilename());
	           	String saveName = uid.toString() + "." + extension;
	           	File file = new File(parent.getAbsolutePath(), saveName);
	           	log.info("file abs path : " + file.getAbsolutePath());
	           	log.info("file path : " + file.getPath());
	           	
	           	multipartFile.transferTo(file);
	           	
	           	// 업로드된 이미지를 프로필 이미지로 설정 한다.
	           	member.setPicture(saveName);
	           	
	           } else {
	           	// 프로필 이미지가 업로드 되지 않으면 이전 프로필 이미지를 그대로 사용하도록 아무 값도 설정 하지 않는다.
	           	System.out.println("No file uploaded - 프로필 정보 수정하지 않음");
	           	
	           }
	   		
	   		// DB에 회원 정보를 업데이트 하기
	   		memberService.updateMember(member);
	   		System.out.println("mypageUpdateResult : " + member.getEmail());
	   		
	   		// 업데이트된 회원정보를 다시 읽어와 세션에 저장한다. - 이미 세션에서 가져왔기 때문에 세션을 업데이트 할 필요 없음
	   		//session.setAttribute("member", member);
	   		log.info("회원정보 수정 후 : " + member.getPicture());
	   		return "redirect:scrap";
	   	}	
	   	
	   	//	언스크랩 하기(syj)
	   	@PostMapping("/deleteScrap")
	   	public String deleteScrap(
	   			@RequestParam("storyNo") int storyNo) {
	   		
	   	    scrapService.deleteScrap(storyNo);
	   	    
	   	    return "redirect:/storyDetail?storyNo=" + storyNo;
	   	}
	   }