package com.springbootstudy.dhere.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springbootstudy.dhere.dao.OtherScrapDao;
import com.springbootstudy.dhere.dao.StoryDao;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Marker;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;

@Service
public class OtherScrapServiceImpl implements OtherScrapService {

	@Autowired
	private StoryDao storyDao;
	
	@Autowired
	private OtherScrapDao otherScrapDao;

	// 다른 유저의 스토리 게시물 가져오기
	@Override
	public List<Story> getUserStories(String email, Integer otherOffset, Integer otherLimit) {
		List<Story> sList=otherScrapDao.getUserStories(email, otherOffset, otherLimit);
		for (Story story : sList) {
	        List<Tag> tags = storyDao.getStoryDetailTag(story.getStoryNo());
	        story.setTags(tags);
	    }
		
		return sList;
	}

	
	
	
}
