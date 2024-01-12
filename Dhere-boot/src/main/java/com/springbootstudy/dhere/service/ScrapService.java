package com.springbootstudy.dhere.service;

import java.util.List;

import com.springbootstudy.dhere.domain.Scrap;

public interface ScrapService {
	
	public abstract List<Scrap> scrapList(String email);
	
	public abstract List<Scrap> scList(String email);
	
	public abstract void insertScrap(Scrap scrap);
	
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
	
	// 스크랩 여부 확인하기(syj)
	public abstract boolean scrapingCheck(String email,int storyNo);
	
	// 언스크랩 하기(syj)
	public abstract void deleteScrap(int scrapNo);
}