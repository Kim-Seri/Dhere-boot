package com.springbootstudy.dhere.service;

import com.springbootstudy.dhere.domain.Scrap;

public interface ScrapService {
	
	// 회원 로그인을 처리하는 메서드
	//public int login(String email, String pass);
	
	// 마이페이지 프로필 정보 출력
	public Scrap getScrap(String email);
	
//	// 회원 정보 수정 시에 기존 비밀번호가 맞는지 체크하는 메서드
//	public boolean memberPassCheck(String email, String pass);
//		
//	//회원정보를 DAO를 이용해 회원 테이블에서 수정하는 메서드
//	public void updateMember(Member member);

	
	// 스크랩리스트 출력
//	public List<Scrap> ScrapList();
	
	// 스크랩한 게시물을 읽어보는 메서드
//	public abstract Scrap getScrapPost(String email);
	
	// 
}