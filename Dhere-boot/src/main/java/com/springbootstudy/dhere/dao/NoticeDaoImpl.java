package com.springbootstudy.dhere.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbootstudy.dhere.domain.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String NAME_SPACE = "com.springbootstudy.dhere.mappers.NoticeMapper";
	
	// 게시물 쓰기(syj)
	@Override
	public void noticeWrite(Notice notice) {
		sqlSession.insert(NAME_SPACE+".noticeWrite", notice);
	}
	
	// 게시물 리스트 가져오기(syj)
	@Override
	public List<Notice> getNoticeList() {
		return sqlSession.selectList(NAME_SPACE + ".NoticetList");
	}
}
