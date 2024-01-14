package com.springbootstudy.dhere.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Marker;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;

public interface OtherScrapService {
	
	// 다른 유저의 스토리 게시물 가져오기
	public abstract List<Story> getUserStories(String email, Integer otherOffset, Integer otherLimit);
	
}