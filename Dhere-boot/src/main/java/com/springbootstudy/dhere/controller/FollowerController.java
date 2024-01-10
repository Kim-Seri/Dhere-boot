package com.springbootstudy.dhere.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springbootstudy.dhere.domain.Follower;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Notice;
import com.springbootstudy.dhere.service.AnswerService;
import com.springbootstudy.dhere.service.FollowerService;
import com.springbootstudy.dhere.service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FollowerController {
    
    @Autowired
    private FollowerService followerService;
    
    // 팔로우하기
    @PostMapping("/insertFollow")
    public String insertFollow(HttpSession session, 
    		@RequestParam("followingEmail") String followingEmail,
    		@RequestParam("storyNo") String storyNo) {
    	
        Member member = (Member) session.getAttribute("member");
        
        if (member == null) {
            
            return "redirect:/login";
        }

        String followerEmail = member.getEmail();
        Follower follower = new Follower();
        
        follower.setFollower_email(followerEmail);
        follower.setFollowing_email(followingEmail);

        followerService.insertFollow(follower);

        return "redirect:/storyDetail?storyNo=" + storyNo;
    }
    
    
    
    
	 // 언팔로우하기
	    @PostMapping("/deleteFollow")
	    public String deleteFollow(HttpSession session, 
	                               @RequestParam("followingEmail") String followingEmail,
	                               @RequestParam("storyNo") int storyNo) { // storyNo 파라미터 유지
	                
	        // 세션에서 현재 로그인된 사용자 정보를 가져옵니다.
	        Member member = (Member) session.getAttribute("member");
	        
	        // 로그인되어 있지 않다면 로그인 페이지로 리다이렉트합니다.
	        if (member == null) {
	            return "redirect:/login";
	        }
	
	        // 세션에서 가져온 사용자의 이메일 주소를 사용합니다.
	        String sessionFollowerEmail = member.getEmail();
	
	        // 언팔로우 처리를 수행합니다.
	        followerService.deleteFollow(sessionFollowerEmail, followingEmail);
	
	        // 처리 후 게시물 상세 페이지로 리다이렉트합니다.
	        return "redirect:/storyDetail?storyNo=" + storyNo;
	    }
}




/*
@Controller
public class FollowerController {
	
	

	@Autowired
	private FollowerService followerService;
	
	@Autowired
	private MemberService memberService;
	
	public void setFollowerService(FollowerService followService) {
		this.followerService = followService;
	}
	
	private static final String DEFAULT_PATH = "/resources/images/profile/";
	
	// 팔로우 리스트 출력
	@GetMapping("/scrap")
	public String following( Model model, 
			HttpSession session) {
		
		Member member = (Member)session.getAttribute("member");
		System.out.println("email" + member.getEmail());
		
		List<Follower> followerList = followerService.followerList(member.getEmail());
		model.addAttribute("followerList", followerList);
		
			return "scrap";
		
	}
			
}
*/