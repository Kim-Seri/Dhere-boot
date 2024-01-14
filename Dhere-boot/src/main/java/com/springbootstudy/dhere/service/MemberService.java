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
	
	// 회원 정보를 DAO를 이용해 회원테이블에서 수정하는 메서드
	public void updateMember(Member member);
	
	//핸드폰 인증번호
	public abstract void certifiedPhoneNumber(String phoneNum, String numStr);
	
	//닉네임 중복검사
	public abstract boolean overNickNameCheck(String nickname);

	
	

}
