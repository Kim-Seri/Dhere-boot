package com.springbootstudy.dhere.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Scrap;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.service.MemberService;
import com.springbootstudy.dhere.service.ScrapService;
import com.springbootstudy.dhere.service.StoryService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ScrapController {
	
	@Autowired
	private ScrapService scrapService;
	
	public void setScrapService(ScrapService scrapService) {
		this.scrapService = scrapService;
	}
	
	@Autowired
	private MemberService memberService;	
	
	@Autowired
	private StoryService storyService;
	
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
		
        
        List<Story> sList = storyService.sList(member.getEmail());
        
        model.addAttribute("sList", sList);

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
	
	   @GetMapping("/mypageUpdateProcess")
	    public String mypageUpdateProcess() {
	        return "member/mypageUpdateProcess";
	    }
	  
	   @GetMapping("/mypageUpdateForm")
	   public String updateForm() {
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
	  
}