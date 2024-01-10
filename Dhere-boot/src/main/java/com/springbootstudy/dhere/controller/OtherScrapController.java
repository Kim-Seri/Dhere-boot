package com.springbootstudy.dhere.controller;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Reply;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;
import com.springbootstudy.dhere.service.ProductService;
import com.springbootstudy.dhere.service.ReplyService;
import com.springbootstudy.dhere.service.StoryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class OtherScrapController {
	
	  @GetMapping("/otherScrap")
	    public String showProfile(@RequestParam("email") String email,
	                              @RequestParam("nickname") String nickname,
	                              @RequestParam("picture") String picture,
	                              @RequestParam("categoryName") String categoryName,
	                              Model model) {
	       
	        model.addAttribute("email", email);
	        model.addAttribute("nickname", nickname);
	        model.addAttribute("picture", picture);
	        model.addAttribute("categoryName", categoryName);
	        
	        return "otherScrap";
	    }
}
