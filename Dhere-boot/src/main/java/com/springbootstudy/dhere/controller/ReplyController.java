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
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	//	댓글 쓰기(syj)
	@PostMapping("/replyWrite")
	public String replyWrite(HttpServletRequest request, HttpServletResponse response, Model model,
	                         @RequestParam("storyNo") int storyNo,
	                         @RequestParam(value = "replyNo", required = false) Integer replyNo,
	                         @RequestParam("replyContent") String replyContent,
	                         HttpSession session) {
	    // 세션에서 이메일을 가져오기
	    String email = (session.getAttribute("member") != null) ? ((Member)session.getAttribute("member")).getEmail() : null;

	    // 이메일이 null이면 사용자가 로그인하지 않은 것으로 간주하고 처리
	    if(email == null) {
	        // 로그인 페이지로 리다이렉트하거나 에러 메시지
	        return "redirect:login";
	    }

	    Reply reply = new Reply();
	    
	    reply.setStoryNo(storyNo);
	    reply.setReplyNo(replyNo != null ? replyNo : 0); // replyNo가 null이면 기본값으로 설정
	    reply.setReplyContent(replyContent);
	    reply.setEmail(email);
	    
	    replyService.replyWrite(reply);
	    
	    return "redirect:storyDetail?storyNo=" + storyNo; // 댓글을 단 스토리로 리다이렉트
	}

		// 댓글 삭제(syj)
		@PostMapping("/deleteReply")
		public String deleteReply(
				@RequestParam("replyNo") int replyNo) {
			
		    replyService.deleteReply(replyNo);
		    
		    return "redirect:/main"; // 또는 적절한 주소로 리다이렉트
		}
}
