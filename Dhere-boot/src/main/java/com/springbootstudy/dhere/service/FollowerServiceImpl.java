package com.springbootstudy.dhere.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootstudy.dhere.dao.FollowerDao;
import com.springbootstudy.dhere.domain.Follower;

@Service
public class FollowerServiceImpl implements FollowerService {
	
	@Autowired
	private FollowerDao followerDao;

	// 팔로우하기(syj)
	@Override
	public void insertFollow(Follower follower) {
		followerDao.insertFollow(follower);
	}
	
	// 언팔하기(syj)
	@Override
	public void deleteFollow(String followerEmail) {
		followerDao.deleteFollow(followerEmail);
	}

}
