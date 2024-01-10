package com.springbootstudy.dhere.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbootstudy.dhere.domain.Follower;
@Repository
public class FollowerDaoImpl implements FollowerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.springstudy.dhere.mappers.FollowerMapper";

	//	팔로우하기(syj)
	@Override
	public void insertFollow(Follower follower) {
		sqlSession.insert(NAME_SPACE + ".insertFollow", follower);
	}

	//	언팔하기(syj)
	@Override
	public void deleteFollow(String followerEmai) {
		sqlSession.delete(NAME_SPACE + ".deleteFollow", followerEmai);		
	}

	
}
