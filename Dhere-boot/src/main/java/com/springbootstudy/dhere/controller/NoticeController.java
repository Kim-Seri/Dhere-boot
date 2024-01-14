package com.springbootstudy.dhere.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	private static final String DEFAULT_PATH = "/resources/images/";
	
	@Autowired
	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	//리스트업
	@GetMapping("/notice")
	public String getNoticeList(Model model) {
	    List<Notice> noticeList = noticeService.getNoticeList();
	    model.addAttribute("noticeList", noticeList);
	    return "notice";
	}
	
	// 게시물 보기
	@GetMapping("/noticeDetail")
	public String noticeDetail(Model model, int noticeNo) {
		
		Notice notice = noticeService.noticeDetail(noticeNo);
		model.addAttribute("notice", notice);
		return "notice";
	}
	
//	@GetMapping("/noticeWrite")
//	public String noticeDetail() {
//		return "noticeWrite";
//	}
	
	
//	@PostMapping("/noticeWrite")
//	public String noticeWrite(Notice notice) {
//		noticeService.noticeWrite(notice);
//		return "redirect:notice";
//	}
	
	@GetMapping("/noticeUpdate")
	public String getNoticeUpdat(Model model, HttpSession session, int noticeNo) {
		
		Member member = (Member) session.getAttribute("member");
		Notice notice = noticeService.getNotice(noticeNo);
		
		model.addAttribute("notice", notice);
		
		return "notice";
	}
	
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(int noticeNo) {
		noticeService.getNotice(noticeNo);
		return "noticeUpdate";
	}


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

