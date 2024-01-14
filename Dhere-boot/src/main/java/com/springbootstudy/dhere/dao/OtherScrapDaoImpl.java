package com.springbootstudy.dhere.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Marker;
import com.springbootstudy.dhere.domain.Image;
import com.springbootstudy.dhere.domain.Story;
import com.springbootstudy.dhere.domain.Tag;

@Repository
public class OtherScrapDaoImpl implements OtherScrapDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String NAME_SPACE = "com.springbootstudy.dhere.mappers.OtherScrapMapper";
	
	// 다른 유저의 스토리 게시물 가져오기
	@Override
	public List<Story> getUserStories(String email, Integer otherOffset, Integer otherLimit) {
		Map<String, Object> params = new HashMap<>();
		params.put("email", email);
		params.put("otherOffset", otherOffset);
		params.put("otherLimit", otherLimit);

		return sqlSession.selectList(NAME_SPACE + ".getOtherStoryListPaged", params);
	}
	
	
    
    
}
