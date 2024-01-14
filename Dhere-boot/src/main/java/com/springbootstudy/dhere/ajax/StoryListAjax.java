package com.springbootstudy.dhere.ajax;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.service.ProductService;
import com.springbootstudy.dhere.service.StoryService;

@RestController
public class StoryListAjax {
	
	@Autowired
	private StoryService storyService;
	
	@Autowired
	private ProductService productService;
	
	// 게시물 리스트 ajax
	@PostMapping("/storyList")	
	public Map<String, List<Story>> storyList(
			@RequestParam(value="selectedJob", required = false, defaultValue="null") String selectedJob,
			@RequestParam(value="searchKeyword", required = false, defaultValue="null") String searchKeyword,
			@RequestParam(value="sort", required = false, defaultValue="recent") String sort,
			@RequestParam(value="offset", required = false, defaultValue="0") Integer offset,
			@RequestParam(value="limit", required = false, defaultValue="6") Integer limit) {
		
		System.out.println("selectedJob : " + selectedJob);
		System.out.println("searchKeyword : " + searchKeyword);
		System.out.println("sort : " + sort);
		System.out.println("offset : " + offset);
		System.out.println("limit : " + limit);
		
		Map<String, List<Story>> map = new HashMap<>();

	    // 중복을 허용한 리스트를 전달
	    map.put("resultList", storyService.getResultStoryList(offset, limit, selectedJob, searchKeyword, sort));

		return map;		
	}
	
	// 제품 리스트 ajax
		@PostMapping("/getProductList")
		@ResponseBody
		public Map<String, List<Product>> getProductListPaged( 
				@RequestParam(value = "productCategory", required = false, defaultValue="null") String productCategory, 
				@RequestParam(value="pOffset", required = false, defaultValue="0") Integer pOffset,
				@RequestParam(value="productLimit", required = false, defaultValue="8") Integer productLimit) {
			
			System.out.println("productCategory : " + productCategory);
			System.out.println("pOffset : " + pOffset);
			System.out.println("limit : " + productLimit);
			
			Map<String, List<Product>> map = new HashMap<>();
			map.put("productList", productService.getProductListPaged(productCategory, pOffset, productLimit));

			return map;		
			
			
		}
	
}


