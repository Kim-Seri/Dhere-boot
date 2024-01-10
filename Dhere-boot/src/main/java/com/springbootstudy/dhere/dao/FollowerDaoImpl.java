package com.springbootstudy.dhere.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbootstudy.dhere.domain.Follower;
import com.springbootstudy.dhere.domain.Member;

@Repository
public class FollowerDaoImpl implements FollowerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String NAME_SPACE = "com.springbootstudy.dhere.mappers.FollowerMapper";

	@Override
	public List<Follower> followerList(String followerEmail) {
		return sqlSession.selectList(NAME_SPACE + ".followerList", followerEmail);
	}


		
}
