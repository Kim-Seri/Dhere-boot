package com.springbootstudy.dhere.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springbootstudy.dhere.domain.Answer;
import com.springbootstudy.dhere.domain.Inquiry;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.service.AnswerService;
import com.springbootstudy.dhere.service.InquiryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {
	
	private static final String DEFAULT_PATH = "src/main/resources/static/resources/images/inquiry/";
	
	@Autowired
	private InquiryService service;
	
	@Autowired
	private AnswerService answerService;
	
	@PostMapping(value = "/inquiryWriteForm")
    public String insertInquiry(Inquiry i, HttpServletRequest request, 
    		@RequestParam(value="imgFile", required=false) MultipartFile multipartFile,
    		HttpSession session) throws IOException {
        
		System.out.println("email : " + session.getAttribute("member"));
		System.out.println("email : " + i.getInquiryTitle());
		System.out.println("email : " + i.getInquiryContent());
		System.out.println("email : " + i.getInquiryFile());
		
		Member member = (Member)session.getAttribute("member");
		i.setInquiryEmail(member.getEmail());
		
        if (multipartFile != null && !multipartFile.isEmpty()) {
            
            // Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
            String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
            
            UUID uid = UUID.randomUUID();
            String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
            
            File file = new File(filePath, saveName);         
            
            // 업로드 되는 파일을 upload 폴더로 저장한다.
            multipartFile.transferTo(file);
            i.setInquiryFile(saveName);
        } else {
            System.out.println("No file uploaded");
        }
        service.insertInquiry(i);
        return "redirect:main";
    }
	
	
	@GetMapping("/dd")
	public String iList(Model model, HttpSession session) {
	    Member member = (Member) session.getAttribute("member");

	    List<Inquiry> iList = service.iList(member.getEmail());

	    // 각 Inquiry에 대한 답변 목록을 검색하여 모델에 추가
	    for (Inquiry inquiry : iList) {
	        int inquiryNo = inquiry.getInquiryNo();
	        List<Answer> answerList = service.getAnswerList(inquiryNo);
	        inquiry.setAnswerList(answerList);
	    }

	    model.addAttribute("iList", iList);

	    return "iList";
	}

	
	
	
	
	 @GetMapping("/deleteInquiry") 
	 public String deleteInquiry(@RequestParam(value="inquiryNo", required = false) int inquiryNo) {
		 
		 service.deleteInquiry(inquiryNo);
		 
		 return "redirect:/"; 
	 }
	 
	 
	 

	
	@GetMapping("/inquiryDetail")
	public String inquiryDetail(Model model, @RequestParam("inquiryNo") int inquiryNo) {
		
		System.out.println();
		
		Inquiry inquiry = service.getInquiry(inquiryNo);
		
		model.addAttribute("inquiry", inquiry);
		
		List<Answer> answerList = answerService.answerList(inquiryNo);
		model.addAttribute("answerList", answerList);
		
		return "inquiryDetail";
	}
	
	 @GetMapping(value= "/adminInquiry")
	    public String inquiryList(Model model) { 
	        List<Inquiry> inquiryList = service.inquiryList();
	        model.addAttribute("inquiryList", inquiryList);
	        return "adminInquiry";
	    }
	
}
