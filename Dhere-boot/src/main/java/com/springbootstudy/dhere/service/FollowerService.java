package com.springbootstudy.dhere.service;

import java.util.List;

import com.springbootstudy.dhere.domain.Follower;

public interface FollowerService {

	// 팔로우하기(syj)
    void insertFollow(Follower follower);
    
    // 언팔로우하기(syj)
    void deleteFollow(String followerEmail, String followingEmail);
    
    // 팔로우 여부 확인하기(syj)
    boolean isFollowing(String followerEmail, String followingEmail);
    
}




/*
public interface FollowerService {
	
	public abstract List<Follower> followerList(String followerEmail);
	

	

}
*/