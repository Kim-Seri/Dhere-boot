package com.springbootstudy.dhere.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springbootstudy.dhere.domain.Answer;
import com.springbootstudy.dhere.service.AnswerService;

@Controller
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;
	
	@PostMapping("/answerWriteForm")
	public String insertAnswer(Answer a) {
		
		answerService.insertAnswer(a);
		
		return "main";
	}
	
	@GetMapping("/answerWrite")
	public String answerWirte(@RequestParam("no") int no, Model model) {
		model.addAttribute("no", no);
		
		return "answerWrite";
	}

}
