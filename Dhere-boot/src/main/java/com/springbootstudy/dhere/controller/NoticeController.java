package com.springbootstudy.dhere.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Notice;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Reply;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.service.NoticeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class NoticeController {
	
	private static final String DEFAULT_PATH = "/resources/images/inquiry/";
	
	@Autowired
	private NoticeService noticeService;
	
	//	공지사항 작성하기(syj)
	@PostMapping("/noticeWrite")
	public String noticeWrite(Model model, HttpServletRequest request, HttpSession session,
	                          @RequestParam("title") String title,
	                          @RequestParam("content") String content) {
	    
	    Member member = (Member) session.getAttribute("member");
	    Notice notice = new Notice();
	    
	    notice.setTitle(title);
	    notice.setContent(content);
	    notice.setEmail(member.getEmail());
	    notice.setRegDate(new Timestamp(System.currentTimeMillis()));

	    noticeService.noticeWrite(notice);

	    return "main";
	}
	
	
}

