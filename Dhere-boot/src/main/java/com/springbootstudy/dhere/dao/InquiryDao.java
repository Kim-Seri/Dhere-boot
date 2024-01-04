package com.springbootstudy.dhere.dao;

import java.util.List;

import com.springbootstudy.dhere.domain.Inquiry;

public interface InquiryDao {
	
	// 문의하기
	public abstract void insertInquiry(Inquiry inquiry);
	
	// 내 문의 내역
	public abstract List<Inquiry> iList(String email);
	
	// 문의 내역 상세보기
	public abstract Inquiry getInquiry(int inquiryNo);
	
	// 관리자용 전체 문의 리스트
	public abstract List<Inquiry> inquiryList();
}
