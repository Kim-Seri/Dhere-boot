package com.springbootstudy.dhere.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;
import com.springbootstudy.dhere.service.ProductService;
import com.springbootstudy.dhere.service.StoryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class StoryController {

	@Autowired
	private StoryService storyService;
	
	@Autowired
	private ProductService productService;
	
	private static final String DEFAULT_PATH = "/resources/images/desk/";
	
	
	// #######################################################
	// ##### JSP 뷰 시작 
	// #######################################################
	
	// 데스크 셋업 리스트 출력 (메인)
	// 카테고리 별 제품 리스트 출력
	@GetMapping(value= {"/", "/main"})
	public String Main(Model model, 
			@RequestParam(value="storyNo", defaultValue="1") int storyNo,  
			@RequestParam(value="productCategory", required=false, defaultValue="All") String productCategory) {
		
		List<Job> jList=storyService.getJobList();
		model.addAttribute("jList", jList);
		
		List<Story> sList = storyService.getStoryList();
		model.addAttribute("sList", sList);
		
		List<Product> pList = productService.productList(productCategory);
	    model.addAttribute("pList", pList);

		return "main";
	}
	
	// 게시물 디테일(syj)
	@GetMapping("/storyDetail")
	public String storyDetail(Model model, HttpSession session,
			@RequestParam("storyNo") int storyNo) {
		
		// 조회수 증가 로직 추가
		storyService.increaseReadCount(storyNo);
	    
	    Story storyDetail = storyService.getStoryDetail(storyNo);
	    model.addAttribute("storyDetail", storyDetail);
	    
	    List<Image> iList = storyService.getStoryDetailImage(storyNo);
		model.addAttribute("iList", iList);
	    
		List<Tag> tList = storyService.getStoryDetailTag(storyNo);
		model.addAttribute("tList", tList);
	    
		
	    return "storyDetail";
	}
///////////////////////////////////////////////////////////////////
	// 게시물 삭제(syj)
	@GetMapping("/deleteStory")
	public String deleteStory(HttpServletResponse response, 
			@RequestParam("storyNo") int storyNo) {
		
		storyService.deleteStory(storyNo);
		
		return "redirect:main";
	}
///////////////////////////////////////////////////////////////////
	// 게시물 수정하기 읽어오기(syj)
	@GetMapping("/updateStory")
	public String updateStory(Model model, HttpServletResponse response, 
			@RequestParam("storyNo") int storyNo) {

		Story story = storyService.getStoryDetail(storyNo);

		model.addAttribute("story", story);

		return "updateStory";
	}
///////////////////////////////////////////////////////////////////
	// 게시물 수정하기(syj)
	@PostMapping(value="updateStoryProcess")
	public String updateStoryProcess(
			HttpServletResponse response, PrintWriter out, 
			@ModelAttribute Story story) {
	
		// storyService 클래스를 이용해 게시물을 수정한다.
		storyService.updateStoryProcess(story);
		
		return "redirect:main";
	}	
	
	//게시글 쓰기
	@PostMapping(value="/postWrite")
	public String postWrite(Model model ,
			HttpServletRequest request , HttpServletResponse response, HttpSession session,
			@RequestParam(value="title")String title,
			@RequestParam(value="content1")String content1, 
			@RequestParam(value="content2")String content2, 
			@RequestParam(value="content3")String content3, 
			@RequestParam(value="content4")String content4 ,
			@RequestParam(value="categoryNo") int categoryNo,
			@RequestParam(value="hashtag",required=false) List<String> tagList,
			@RequestParam(value="additionalImages", required=false) List<MultipartFile> multipartFile) throws IOException{
		
		String nickname=(String) session.getAttribute("nickname");
		Member member=(Member) session.getAttribute("member");
		String email=member.getEmail();
		
		Story story=new Story();
		
		story.setTitle(title);
		story.setContent1(content1);
		story.setContent2(content2);
		story.setContent3(content3);
		story.setContent4(content4);
		story.setCategoryNo(categoryNo);
		story.setEmail(email);
		story.setNickname(nickname);
		System.out.println(nickname);
		
		
		storyService.postWrite(story);
		
		System.out.println(tagList);
		
		
		//태그 리스트 추가
		if(tagList != null &&! tagList.isEmpty()) {
			for(String hashtag:tagList) {
				Tag tag=new Tag();
				tag.setTagName(hashtag);
				tag.setStoryNo(story.getStoryNo());
				storyService.insertTag(tag);
				storyService.insertTagPost(tag);
			}
		}
		
		// 이미지 리스트 추가
		if (multipartFile != null && !multipartFile.isEmpty()) {
			 
			for (MultipartFile imageFile : multipartFile) {
				Image image = new Image();
				 // Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
	            String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
	          
	            UUID uid = UUID.randomUUID();
	            
	            String saveName = uid.toString() + "_" + imageFile.getOriginalFilename();
	            String encodedFileName = URLEncoder.encode(saveName, "UTF-8");
	            File file = new File(filePath, encodedFileName);         
	            
	            // 업로드 되는 파일을 upload 폴더로 저장한다.
	            imageFile.transferTo(file);
	            image.setFileName(encodedFileName);
				image.setStoryNo(story.getStoryNo());
				storyService.insertImage(image);
			}
		}
		return "redirect:main";
	}

	@GetMapping(value="/postWriteForm")
	public String postWriteForm(Model model) {
		
		List<Job> jList=storyService.getJobList();
		// System.out.println(jList.get(0).getCategoryName());
		model.addAttribute("jList",jList);
		
		
		return "postWriteForm";
	}
	
	// 제품 디테일
	@GetMapping("/productDetail")
	public String productDetail(Model model, 
			@RequestParam("productNo") int productNo) {
		
		System.out.println(productNo);
		
		Product product = productService.getProduct(productNo);
		
		model.addAttribute("product", product);
		
		return "productDetail";
	}


	// #######################################################
	// ##### Thymeleaf 뷰 시작 
	// #######################################################		
	@GetMapping("/thView")
	public String productDetail(Model model) {
		
		return "th/thViewTest";
	}
}
