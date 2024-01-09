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
	
	@GetMapping("/myPosts")
    public String getMyPosts(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
        
        List<Story> sList = storyService.sList(member.getEmail());
        
        // 가져온 게시물을 모델에 추가합니다.
        model.addAttribute("sList", sList);

        // myPosts 탭으로 이동합니다.
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