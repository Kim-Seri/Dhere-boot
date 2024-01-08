package com.springbootstudy.dhere.controller;


import java.io.File;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.mysql.cj.Session;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Reply;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;
import com.springbootstudy.dhere.service.ProductService;
import com.springbootstudy.dhere.service.ReplyService;
import com.springbootstudy.dhere.service.StoryService;

@Controller
public class FollowerController {
	
	
	@PostMapping("/follow-toggle")
	public ResponseEntity<?> toggleFollow(@RequestParam String following_email, HttpSession session) {
	    String followerEmail = (String) session.getAttribute("email"); // 현재 로그인한 사용자의 이메일
	    if (followerEmail == null) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
	    }

	    // 팔로우 상태 토글 로직
	    boolean isFollowing = followService.toggleFollow(followerEmail, followingEmail);

	    // 팔로우 상태에 따라 응답을 반환
	    return ResponseEntity.ok(new IsFollowingResponse(isFollowing));
	}
/////////////////////////////////////////////////////////////////////////////////////////////
	@GetMapping("/check-follow")
	public ResponseEntity<?> checkFollowStatus(@RequestParam String following_email, HttpSession session) {
	    String followerEmail = (String) session.getAttribute("email"); // 현재 로그인한 사용자의 이메일
	    if (followerEmail == null) {
	        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인이 필요합니다.");
	    }

	    // 팔로우 상태 확인 로직
	    boolean isFollowing = followService.isFollowing(followerEmail, followingEmail);

	    // 팔로우 상태에 따라 응답을 반환
	    return ResponseEntity.ok(new IsFollowingResponse(isFollowing));
	}

	// 팔로우 상태를 나타내는 응답 클래스
	class IsFollowingResponse {
	    public boolean isFollowing;

	    public IsFollowingResponse(boolean isFollowing) {
	        this.isFollowing = isFollowing;
	    }
	}
	
	
}
