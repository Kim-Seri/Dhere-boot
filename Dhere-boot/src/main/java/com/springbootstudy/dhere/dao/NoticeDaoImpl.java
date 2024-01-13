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
	
	// 공지사항 쓰기(syj)
	@Override
	public void noticeWrite(Notice notice) {
		sqlSession.insert(NAME_SPACE+".noticeWrite", notice);
	}
	
	//	공지사항 읽기(syj)
	@Override
	public Notice noticeDetail(int noticeNo) {
		return sqlSession.selectOne(NAME_SPACE + ".noticeDetail", noticeNo);	
	}
	
	//	공지사항 수정(syj)
	@Override
	public void noticeUpdate(Notice notice) {
			sqlSession.update(NAME_SPACE + ".noticeUpdate", notice);
	}
	
	//	공지사항 삭제(syj)
	@Override
	public void noticeDelete(int noticeNo) {
			sqlSession.delete(NAME_SPACE + ".noticeDelete", noticeNo);
	}
	
	// 공지사항 목록 가져오기(syj)
	@Override
	public List<Notice> getNoticeList() {
	    return sqlSession.selectList(NAME_SPACE + ".getNoticeList");
	}
	
	
}