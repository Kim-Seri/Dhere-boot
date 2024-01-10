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
	
	//	팔로우하기(syj)
	@PostMapping("/insertFollow")
	public String insertFollow(Model model, HttpServletRequest request, HttpSession session,
	                          @RequestParam("followerEmail") String followerEmail,
	                          @RequestParam("followingEmail") String followingEmail) {
	    
	    Member member = (Member) session.getAttribute("member");
	    Follower follower = new Follower();
	    
	    follower.setFollower_email(followerEmail);
	    follower.setFollowing_email(followingEmail);

	    followerService.insertFollow(follower);

	    return "main";
	}
	
	
	//	언팔하기(syj)
	 @GetMapping("/deleteFollow") 
	 public String deleteFollow(
			 @RequestParam("followerEmail") String followerEmail) {
		 
		 followerService.deleteFollow(followerEmail);
		 
		 return "redirect:/main"; 
	 }

}