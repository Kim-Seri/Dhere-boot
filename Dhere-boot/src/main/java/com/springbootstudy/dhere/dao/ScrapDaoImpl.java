package com.springbootstudy.dhere.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// 스크랩 여부 확인하기(syj)
    @Override
    public boolean scrapingCheck(String email, int storyNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("email", email);
        params.put("storyNo", storyNo);
        Integer count = sqlSession.selectOne(NAME_SPACE + ".scrapingCheck", params);
        return count != null && count > 0;
    }

    // 언스크랩 하기(syj)
	@Override
	public void deleteScrap(int storyNo) {
		sqlSession.delete(NAME_SPACE + ".deleteScrap", storyNo);
	}

}
