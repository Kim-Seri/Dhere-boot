package com.springbootstudy.dhere.dao;

import java.util.List;

import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Member;

public interface MemberDao {
	
	// 로그인
	public abstract Member getMember(String email);

	// 회원가입
	public abstract void addMember(Member m);

	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 체크하는 메서드
	public abstract String memberPassCheck(String email, String pass);
		
	// 회원 정보를 마이페이지에서 수정하는 메서드
	public abstract void updateMember(Member member);

	
	//회원정보(닉네임) 가져오기
	public abstract Member getMemberNickName(String nickname);

	//아이디 비번찾기 회원정보 가져오기
	public abstract Member getMemberFind(String name,String phone);

	
	
	


	
}