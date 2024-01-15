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
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	//	댓글 쓰기(syj)
	@PostMapping("/replyWrite")
	public ResponseEntity<Map<String, Object>> replyWrite(HttpServletRequest request, HttpServletResponse response, Model model,
	                                                     @RequestParam("storyNo") int storyNo,
	                                                     @RequestParam(value = "replyNo", required = false) Integer replyNo,
	                                                     @RequestParam("replyContent") String replyContent,
	                                                     HttpSession session) {
	    String email = (session.getAttribute("member") != null) ? ((Member)session.getAttribute("member")).getEmail() : null;

	    if(email == null) {
	        // 로그인 페이지로 리다이렉트하는 대신, 에러 코드를 반환
	        Map<String, Object> responseBody = new HashMap<>();
	        responseBody.put("error", "로그인이 필요합니다.");
	        return new ResponseEntity<>(responseBody, HttpStatus.UNAUTHORIZED);  // 401 상태 코드 (Unauthorized)
	    }

	    Reply reply = new Reply();
	    
	    reply.setStoryNo(storyNo);
	    reply.setReplyNo(replyNo != null ? replyNo : 0);
	    reply.setReplyContent(replyContent);
	    reply.setEmail(email);
	    
	    replyService.replyWrite(reply);

	    Map<String, Object> responseBody = new HashMap<>();
	    responseBody.put("message", "댓글 작성이 성공적으로 이루어졌습니다.");

	    return new ResponseEntity<>(responseBody, HttpStatus.OK);  // 200 상태 코드 (OK)
	}
	
////////////////////////////////////////////////////////////////////////////
		// 댓글 삭제(syj)
		@PostMapping("/deleteReply")
		public String deleteReply(
				@RequestParam("replyNo") int replyNo) {
			
		    replyService.deleteReply(replyNo);
		    
		    return "redirect:/main"; // 또는 적절한 주소로 리다이렉트
		}
}
