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
	
	private static final String DEFAULT_PATH = "/resources/images/inquiry/";
	
	@Autowired
	private NoticeService noticeService;
	
	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@GetMapping("/notice")
	public String getNoticeList(Model model) {
	    List<Notice> noticeList = noticeService.getNoticeList();
	    model.addAttribute("noticeList", noticeList);
	    return "notice";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(Model model, int noticeNo) {
		
		Notice notice = noticeService.noticeDetail(noticeNo);
		model.addAttribute("notice", notice);
		return "notice";
	}
	
	@GetMapping("/noticeWrite")
	public String noticeDetail() {
		return "noticeWrite";
	}
	
	
	@PostMapping("/noticeWriteProcess")
	public String noticeWrite(Notice notice) {
		noticeService.noticeWrite(notice);
		return "redirect:notice";
	}
	
	@GetMapping("/noticeUpdate")
	public String noticeUpdate(Model model, 
			@RequestParam("noticeNo") int noticeNo) {
	    Notice notice = noticeService.noticeDetail(noticeNo);
	    return "noticeUpdate";
	}
	   
   @GetMapping("/updateNoticeForm")
    public String updateNoticeForm() {
        return "notice";
    }
	
	@PostMapping("/noticeDelete")
	public String deleteNotice(PrintWriter out, int noticeNo) {
		noticeService.noticeDelete(noticeNo);
		return "redirect:notice";
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

