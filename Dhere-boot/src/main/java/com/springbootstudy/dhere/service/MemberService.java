package com.springbootstudy.dhere.service;

import java.util.List;

import com.springbootstudy.dhere.domain.Job;
import com.springbootstudy.dhere.domain.Member;

public interface MemberService {
	
	// 로그인 
	public abstract int login(String email, String pass);

	// 회원정보 가져오기
	public abstract Member getMember(String email);
	
	// 회원가입
	public abstract void addMember(Member m);
	
	//아이디 중복확인 메서드
	public abstract boolean overEmailCheck(String email);

	// 비밀번호 체크 메서드
	public abstract boolean memberPassCheck(String email, String pass);
	
}
