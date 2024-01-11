package com.springbootstudy.dhere.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbootstudy.dhere.domain.Answer;
import com.springbootstudy.dhere.domain.Member;
import com.springbootstudy.dhere.domain.Scrap;


@Repository
public class ScrapDaoImpl implements ScrapDao {
	
	
	private static final String NAME_SPACE = "com.springstudy.dhere.mappers.ScrapMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 프로필 가져오기
	@Override
	public Scrap getScrap(String email) {
		return sqlSession.selectOne(NAME_SPACE + ".getScrap", email);
	}
	
	// 회원 정보 수정시에 기존 비밀번호가 맞는지 체크하는 메서드
	public String memberPassCheck(String email, String Pass) {
		return sqlSession.selectOne(NAME_SPACE + ".memberPassCheck", email);
	}
	
	public List<Scrap> scrapList(String email) {
		return sqlSession.selectList(NAME_SPACE + ".scrapList", email);
	}
	
	public List<Scrap> scList(String email) {
		return sqlSession.selectList(NAME_SPACE + ".scList", email);
	}
	
	public void insertScrap(Scrap scrap) {
		sqlSession.insert(NAME_SPACE + ".insertScrap", scrap);
	}
	
	// 스크랩한 데이터 처리할 DAO
	
	
//	// 회원 정보 DAO를 이용해 회원 테이블에서 수정하는 메서드
//	public void updateMember(Member member) {
//		sqlSession.update(NAME_SPACE + ".updateMember", member);
//	}


}
