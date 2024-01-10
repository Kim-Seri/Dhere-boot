package com.springbootstudy.dhere.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void deleteFollow(String followerEmail, String followingEmail) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("followerEmail", followerEmail);
	    params.put("followingEmail", followingEmail);
	    sqlSession.delete(NAME_SPACE + ".deleteFollow", params);		
	}

	// 팔로우 여부 확인하기(syj)
    @Override
    public boolean isFollowing(String followerEmail, String followingEmail) {
        Map<String, Object> params = new HashMap<>();
        params.put("followerEmail", followerEmail);
        params.put("followingEmail", followingEmail);
        Integer count = sqlSession.selectOne(NAME_SPACE + ".isFollowing", params);
        return count != null && count > 0;
    }

}



