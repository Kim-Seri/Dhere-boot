package com.springbootstudy.dhere.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbootstudy.dhere.domain.Inquiry;

@Repository
public class InquiryDaoImpl implements InquiryDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.springstudy.dhere.mappers.InquiryMapper";

	// 문의하기
	@Override
	public void insertInquiry(Inquiry inquiry) {
		sqlSession.insert(NAME_SPACE + ".insertInquiry", inquiry);

	}
	
	// 내 문의 내역
	@Override
	public List<Inquiry> iList(String email) {
		return sqlSession.selectList(NAME_SPACE + ".iList", email);
	}
	
	@Override
	public Inquiry getInquiry(int inquiryNo) {
		return sqlSession.selectOne(NAME_SPACE + ".inquiryDetail", inquiryNo);
	}
	
	// 관리자용 전체 문의 리스트
	@Override
	public List<Inquiry> inquiryList() {
		return sqlSession.selectList(NAME_SPACE + ".inquiryList");
	}

	// 문의 삭제
	@Override
	public void deleteInquiry(int inquiryNo) {
		System.out.println("dao에서 : " + inquiryNo);
		sqlSession.delete(NAME_SPACE + ".deleteInquiry", inquiryNo);
	}
}
