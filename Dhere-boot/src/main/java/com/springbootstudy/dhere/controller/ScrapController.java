package com.springbootstudy.dhere.controller;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Scrap;
import com.springbootstudy.dhere.service.MemberService;
import com.springbootstudy.dhere.service.ScrapService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ScrapController {
	
	@Autowired
	private ScrapService scrapService;
	
	public void setScrapService(ScrapService scrapService) {
		this.scrapService = scrapService;
	}
	
	@Autowired
	private MemberService memberService;	
	
	// 회원정보 받기
	@GetMapping(value="/mypage")
	public String email (Model model,
			HttpSession session ,
			@RequestParam(value="email", defaultValue="test") String email) {
		
		// 세션 객체 안에 있는 이메일 정보 저장
		Scrap scrap = scrapService.getScrap(email);

		// 정보 저장 후 페이지 이동
		model.addAttribute("scrap", scrap);
		
		return "scrap";
	}
	
	
}