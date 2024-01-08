package com.springbootstudy.dhere.dao;

import com.springbootstudy.dhere.domain.Member;

public interface MemberDao {
	
	// 로그인
	public abstract Member getMember(String email);

	// 회원가입
	public abstract void addMember(Member m);

	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 체크하는 메서드
	public String memberPassCheck(String email, String pass);
		
	// 회원 정보를 마이페이지에서 수정하는 메서드
	public void updateMember(Member member);
	
}