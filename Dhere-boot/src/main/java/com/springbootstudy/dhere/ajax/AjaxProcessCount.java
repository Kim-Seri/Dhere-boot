package com.springbootstudy.dhere.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.springbootstudy.dhere.controller.MemberController;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Marker;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Scrap;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.service.MemberService;
import com.springbootstudy.dhere.service.ProductService;
import com.springbootstudy.dhere.service.ScrapService;
import com.springbootstudy.dhere.service.StoryService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AjaxProcessCount {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private StoryService storyService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ScrapService scrapService;
	
	@PostMapping("/joinCheck")
	public Map<String, Boolean> overIdCheck(@RequestParam("id") String id){
		
		boolean result=memberService.overEmailCheck(id);
		Map<String,Boolean> map=new HashMap<>();
		map.put("result", result);
		return map;
	}
	
	// 카테고리 별 제품 리스트 출력
	@PostMapping("/categoryList")
	public Map<String, List<Product>> productList(
			@RequestParam("productCategory") String productCategory) {
		
		Map<String, List<Product>> map= new HashMap<>();
		map.put("category", productService.productList(productCategory));
		
		return map;
	}
	
	
	 @PostMapping("/myScraps")
	 public Map<String, List<Scrap>> scList(HttpSession session, Model model) {
		 
		 Member member = (Member) session.getAttribute("member");
	 
		 Map<String, List<Scrap>> map=new HashMap<>();
		 map.put("scList",scrapService.scList(member.getEmail()));
			 
		 return map; 
	 }
	 
	@PostMapping("/imageListajax")
	@ResponseBody
	public List<Image> storyImageList(
			@RequestParam("storyNo") int storyNo){
		
		List<Image> iList = storyService.getStoryDetailImage(storyNo);
		return iList;
		
	}
	
	@PostMapping("/markerData")
	@ResponseBody
	public List<Marker> markerList(
			@RequestParam("storyNo") int storyNo){
		
		List<Marker> mList = storyService.markerList(storyNo);
		return mList;
		
	}
	
	//제품정보 전체 데이터 가져오기 (마커 검색 비교용)
	@GetMapping("/productList")
	public List<Product> productListAll(){
		List<Product> product =productService.productListAll();
		log.info(product.get(0).getBrandName());
		
		return product;
	}
	
	
}

