package com.springbootstudy.dhere.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.service.StoryService;

@Controller
public class StoryListAjax {
	
	@Autowired
	private StoryService storyService;
	
	@GetMapping("/jobSelectedCategory")
	@ResponseBody
	public Map<String, List<Story>> categoryStoryList(
			@RequestParam("selectedJob") String selectedJob) {
		//System.out.println(selectedJob);

		Map<String, List<Story>> map = new HashMap<>();
		map.put("category", storyService.storyList(selectedJob));
		
		return map;
	}
	
	@GetMapping("/allJobSelectedCategory")
	@ResponseBody
	public Map<String, List<Story>> categoryAllStoryList() {
		//System.out.println(selectedJob);

		Map<String, List<Story>> map = new HashMap<>();
		map.put("category", storyService.getStoryList());
		
		return map;
	}
	
}
