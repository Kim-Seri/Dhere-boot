package com.springbootstudy.dhere.service;

import java.util.List;

import com.springbootstudy.dhere.domain.Follower;
import com.springbootstudy.dhere.domain.Member;

public interface FollowerService {
	
	public abstract List<Follower> followerList(String followerEmail);
	

	

}
