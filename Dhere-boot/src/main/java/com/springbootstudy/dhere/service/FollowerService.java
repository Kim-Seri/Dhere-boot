package com.springbootstudy.dhere.service;

import java.util.List;

import com.springbootstudy.dhere.domain.Follower;

public interface FollowerService {

	// 팔로우하기(syj)
	public abstract void insertFollow(Follower follower);
    
    // 언팔로우하기(syj)
	public abstract void deleteFollow(String followerEmail, String followingEmail);
    
    // 팔로우 여부 확인하기(syj)
	public abstract boolean isFollowing(String followerEmail, String followingEmail);
    
    // 팔로우 목록 가져오기(syj)
	public abstract List<Follower> followList(String followerEmail);
    
}