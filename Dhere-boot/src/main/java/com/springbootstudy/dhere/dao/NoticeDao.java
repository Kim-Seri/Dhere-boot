package com.springbootstudy.dhere.dao;

import java.util.List;

import com.springbootstudy.dhere.domain.Notice;


public interface NoticeDao {

    // 공지사항 쓰기(syj)
	public abstract void noticeWrite(Notice notice);
	
	//	공지사항 읽기(syj)
	public abstract Notice noticeDetail(int noticeNo);
	
	//	공지사항 수정(syj)
	public abstract void noticeUpdate(Notice notice);
	
	//	공지사항 삭제(syj)
	public abstract void noticeDelete(int noticeNo);
	
    // 공지사항 목록 가져오기(syj)
    public abstract List<Notice> getNoticeList();
}

