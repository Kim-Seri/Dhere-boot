package com.springbootstudy.dhere.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Scrap;
import com.springbootstudy.dhere.service.MemberService;
import com.springbootstudy.dhere.service.ScrapService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ScrapController {
	
	private static final String DEFAULT_PATH = "/resources/images/profile";
	
	@Autowired
	private ScrapService scrapService;
	
	public void setScrapService(ScrapService scrapService) {
		this.scrapService = scrapService;
	}
	
	@Autowired
	private MemberService memberService;	
	
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
				@RequestParam("pass1") String pass1, 
				@RequestParam("pass2") String pass2,
				@RequestParam("phone") String phone,  
				@RequestParam("nickname") String nickname, 
				@RequestParam("zipcode") String zipcode,
				@RequestParam("address1") String address1, 
				@RequestParam("address2")String address2, 
				@RequestParam("job") String job,
				@RequestParam(value="picture1", required=false) MultipartFile multipartFile, 
				HttpSession session, HttpServletRequest request) throws IOException {
			
				 
				
			
				Member member = new Member();
				member.setEmail(email);
				member.setPass(pass1);
				member.setPhone(phone);
				member.setNickname(nickname);
				member.setZipcode(zipcode);
				member.setAddress1(address1);
				member.setAddress2(address2);
				member.setJob(job);
				
				
			
			if (multipartFile != null && !multipartFile.isEmpty()) {
	            
	            // Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
	            String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
	            
	            UUID uid = UUID.randomUUID();
	            String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
	            
	            File file = new File(filePath, saveName);         
	            
	            // 업로드 되는 파일을 upload 폴더로 저장한다.
	            multipartFile.transferTo(file);
	            member.setPicture(saveName);
	            
	        } else {
	            // Handle the case when no file is uploaded
	            System.out.println("No file uploaded");
	            
	        }
			
			memberService.updateMember(member);
			System.out.println("memberUpdateResult : " + member.getEmail());
				
				
				session.setAttribute("member", member);
			
				return "redirect:scrap";
				
		}
}