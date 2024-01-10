package com.springbootstudy.dhere.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.springbootstudy.dhere.domain.Follower;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.service.FollowerService;
import com.springbootstudy.dhere.service.MemberService;

import jakarta.servlet.http.HttpSession;

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
