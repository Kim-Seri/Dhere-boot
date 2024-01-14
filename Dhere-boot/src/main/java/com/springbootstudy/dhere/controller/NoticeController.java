package com.springbootstudy.dhere.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Marker;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Notice;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Reply;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;
import com.springbootstudy.dhere.service.NoticeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class NoticeController {
	
	
	@Autowired
	private NoticeService noticeService;
	
//////////////////////////////////////////////////////////////
	//	공지사항 리스트 불러오기(syj)
	@GetMapping("/notice")
	public String getNoticeList(Model model) {
	    List<Notice> noticeList = noticeService.getNoticeList();
	    model.addAttribute("noticeList", noticeList);
	    return "notice";
	}
//////////////////////////////////////////////////////////////
	//	페이지 로드 시 기본으로 출력되는 공지내용
	@GetMapping("/notice/latest")
	@ResponseBody
	public ResponseEntity<Notice> getLatestNotice() {
	    Notice notice = noticeService.getLatestNotice();
	    if (notice != null) {
	        return ResponseEntity.ok(notice);
	    } else {
	        return ResponseEntity.notFound().build();
	    }
	}
//////////////////////////////////////////////////////////////
	// 공지사항 상세 정보를 JSON 형태로 반환하는 메서드(syj)
	@GetMapping("/notice/{noticeNo}")
	@ResponseBody
	public ResponseEntity<Notice> getNotice(
			@PathVariable("noticeNo") int noticeNo) {
	    Notice notice = noticeService.noticeDetail(noticeNo);
	    if (notice != null) {
	        return ResponseEntity.ok(notice);
	    } else {
	        return ResponseEntity.notFound().build();
	    }
	}
////////////////////////////////////////////////////////////////////////////////////////	
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

	    return "redirect:/notice";
	}
//////////////////////////////////////////////////////////////
	// 댓글 삭제(syj)
	@PostMapping("/noticeDelete")
	public String noticeDelete(@RequestParam("noticeNo") int noticeNo) {
		
	    noticeService.noticeDelete(noticeNo);
	    
	    return "redirect:/notice";
	}
////////////////////////////////////////////////////////////////////////////////////////
	//	공지사항 수정하기(syj)
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(Model model, HttpServletRequest request, HttpSession session,
	                           @RequestParam("noticeNo") int noticeNo,
	                           @RequestParam("title") String title,
	                           @RequestParam("content") String content) {

	    Member member = (Member) session.getAttribute("member");
	    Notice notice = noticeService.noticeDetail(noticeNo); // 기존 공지사항 데이터 가져오기

	    notice.setTitle(title);
	    notice.setContent(content);
	    // notice.setEmail(member.getEmail()); // 이메일은 업데이트하지 않아야 할 수도 있음
	    // notice.setRegDate(new Timestamp(System.currentTimeMillis())); // regDate는 업데이트하지 않음

	    noticeService.noticeUpdate(notice);

	    return "redirect:/notice";
	}
////////////////////////////////////////////////////////////////////////////////////////
	// 공지사항 수정 폼 페이지 요청(syj)
	@GetMapping("/noticeUpdateForm")
	public String getNoticeUpdateForm(@RequestParam("noticeNo") int noticeNo, Model model) {
	    Notice notice = noticeService.noticeDetail(noticeNo);
	    model.addAttribute("notice", notice);
	    return "noticeUpdateForm";
	}
	
	
	
}

