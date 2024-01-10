package com.springbootstudy.dhere.service;

import java.util.List;

import com.springbootstudy.dhere.domain.Follower;

public interface FollowerService {

	// 팔로우하기(syj)
    void insertFollow(Follower follower);
    
    // 언팔로우하기(syj)
    void deleteFollow(String followerEmail);
}
