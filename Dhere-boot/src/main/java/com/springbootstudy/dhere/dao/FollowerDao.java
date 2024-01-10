package com.springbootstudy.dhere.dao;

import java.util.List;

import com.springbootstudy.dhere.domain.Follower;
import com.springbootstudy.dhere.domain.Member;

public interface FollowerDao {
	
	public List<Follower> followerList(String followerEmail);
	

	
}
