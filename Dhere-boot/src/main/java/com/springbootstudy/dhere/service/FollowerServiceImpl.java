package com.springbootstudy.dhere.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootstudy.dhere.dao.FollowerDao;
import com.springbootstudy.dhere.dao.MemberDao;
import com.springbootstudy.dhere.domain.Follower;
import com.springbootstudy.dhere.domain.Member;

@Service
public class FollowerServiceImpl implements FollowerService {
	
	@Autowired
	private FollowerDao followerDao;

	@Override
	public List<Follower> followerList(String followerEmail) {
		return followerDao.followerList(followerEmail);
	}


	
}
