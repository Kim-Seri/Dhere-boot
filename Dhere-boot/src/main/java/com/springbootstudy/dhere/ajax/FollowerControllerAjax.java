package com.springbootstudy.dhere.ajax;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Follower;
import com.springbootstudy.dhere.service.FollowerService;

import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/api")
public class FollowerControllerAjax {
    
    @Autowired
    private FollowerService followerService;
    
    // 팔로우하는 사람들의 상세 정보를 JSON 형태로 반환하는 메서드
    @GetMapping("/scrap")
    public ResponseEntity<List<Follower>> getFollowDetails(HttpSession session) {
    	
        Member member = (Member) session.getAttribute("member");
        
        List<Follower> followingDetails = followerService.followList(member.getEmail());
        return ResponseEntity.ok(followingDetails);
    }
}