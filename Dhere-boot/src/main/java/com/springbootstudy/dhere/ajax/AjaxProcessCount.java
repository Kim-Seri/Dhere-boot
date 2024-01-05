package com.springbootstudy.dhere.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbootstudy.dhere.domain.Product;
import com.springbootstudy.dhere.service.MemberService;
import com.springbootstudy.dhere.service.ProductService;

@Controller
public class AjaxProcessCount {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProductService productService;
	
	@PostMapping("/ConfirmId")
	@ResponseBody
	public Map<String, Boolean> overIdCheck(@RequestParam("id") String id){
		
		boolean result=memberService.overEmailCheck(id);
		Map<String,Boolean> map=new HashMap<>();
		map.put("result", result);
		return map;
	}
	
	// 카테고리 별 제품 리스트 출력
	@PostMapping("/categoryList")
	@ResponseBody
	public Map<String, List<Product>> productList(
			@RequestParam("productCategory") String productCategory) {
		
		Map<String, List<Product>> map= new HashMap<>();
		map.put("category", productService.productList(productCategory));
		
		return map;
	}
	

	
}

