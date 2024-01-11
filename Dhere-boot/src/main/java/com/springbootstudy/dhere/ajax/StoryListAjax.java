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

import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.service.StoryService;

@RestController
public class StoryListAjax {
	
	@Autowired
	private StoryService storyService;
	
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
	
	/*
	1/11 백업!!!!!
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
	
	
	 */
	
	
	/*	
	@PostMapping("/jobSelectedCategory")
	@ResponseBody
	public Map<String, List<Story>> categoryStoryList(@RequestParam("selectedJob") String selectedJob) {
		//System.out.println(selectedJob);

		Map<String, List<Story>> map = new HashMap<>();
		map.put("category", storyService.storyList(selectedJob));
		
		return map;
	}
	
	@PostMapping("/allJobSelectedCategory")
	@ResponseBody
	public Map<String, List<Story>> categoryAllStoryList() {

		Map<String, List<Story>> map = new HashMap<>();
		map.put("category", storyService.getStoryList());
		
		return map;
	}
	
	@GetMapping("/searchTag")
	@ResponseBody
	public Map<String, List<Story>> searchStoryList(@RequestParam("searchKeyword") String searchKeyword) {
		
		Map<String, List<Story>> map = new HashMap<>();
		map.put("search", storyService.searchList(searchKeyword));
		
		return map;
	}
	
	@GetMapping("/sorting")
	@ResponseBody
	public Map<String, List<Story>> sortingStoryList(@RequestParam("sortList") String sortList) {

		Map<String, List<Story>> map = new HashMap<>();
		map.put("sortingList", storyService.sortList(sortList));

		return map;
	}
	
//	@GetMapping("/moreList")
//	@ResponseBody
//	public Map<String, List<Story>> moreList(@RequestParam("indexCnt") int indexCnt) {
//		
//		Map<String, List<Story>> map = new HashMap<>();
//		map.put("moreList", storyService.moreList(indexCnt));
//		
//		return map;
//	}
	*/
}


