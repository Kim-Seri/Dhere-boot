package com.springbootstudy.dhere.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.service.MemberService;
import com.springbootstudy.dhere.service.StoryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private StoryService storyService;
	
	private static final String DEFAULT_PATH = "src/main/resources/static/resources/images/profile/";

	// 로그인
	@PostMapping(value = "/login")
	public String getMember(HttpServletResponse response,
			HttpSession session, PrintWriter out,
			@RequestParam("email") String email, 
			@RequestParam("pass1") String pass) {

		int result = memberService.login(email, pass);

		if (result == -1) { // 회원이 존재하지 않는 경우
			response.setContentType("text/html; charset=utf-8");
			out.print("<script>");
			out.print("alert('회원 아이디가 존재하지 않습니다');");
			out.print("location.href='loginForm'");
			out.print("</script>");
			return null;
		} else if (result == 0) { // 비밀번호가 틀린 경우
			response.setContentType("text/html; charset=utf-8");
			out.print("<script>");
			out.print("alert('비밀번호가 틀립니다.');");
			out.print("history.back();");
			out.print("</script>");
			return null;
		}

		Member member = memberService.getMember(email);

		session.setAttribute("isLogin", true);
		session.setAttribute("member", member);
		session.setAttribute("nickname", member.getNickname());

//		System.out.println(email);
//		System.out.println(pass);
//		System.out.println(result);

		return "redirect:main";

	}
	
	// 로그아웃
	@GetMapping(value ="/logoutResult")
	public String logout(HttpSession session) {
		log.info("logout");
		session.invalidate();
		return "redirect:/main";
	}

	// 회원가입
   @PostMapping(value = "/joinResult")
    public String joinResult(HttpServletRequest request,
          Member m, 
          @RequestParam(value="picture1", required=false) MultipartFile multipartFile) throws IOException {
        
        if (multipartFile != null && !multipartFile.isEmpty()) {
           
           Image image = new Image();
           
           File parent = new File(DEFAULT_PATH);
         log.info("parent abs path : " + parent.getAbsolutePath());
         log.info("parent path : " + parent.getPath());
         log.info("exist : " + parent.exists() + ", dir : " + parent.isDirectory());

         // 존재하지 않으면 filePath의 경로에 있는 모든 폴더를 생성한다.
         if (!parent.exists()) {
            parent.mkdirs();
         }

	         UUID uid = UUID.randomUUID();
	         
	         String extension = StringUtils.getFilenameExtension(multipartFile.getOriginalFilename());
	         String saveName = uid.toString() + "." + extension;
	         File file = new File(parent.getAbsolutePath(), saveName);
	         log.info("file abs path : " + file.getAbsolutePath());
	         log.info("file path : " + file.getPath());
	         multipartFile.transferTo(file);
	         m.setPicture(saveName);
	        } else {
	        	String defaultImageName = "DefaultProfile.png";
	            m.setPicture(defaultImageName);
	        }
	        memberService.addMember(m);
	        return "redirect:loginForm";
	    }
	
	// 회원가입 시 직무 리스트 출력하기(syj)
	@GetMapping("/joinForm")
	public String getJobList(Model model) {

		List<Job> jList = storyService.getJobList();
		
		model.addAttribute("jList", jList);

		return "joinForm";
	}
	

}
