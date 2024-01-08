package com.springbootstudy.dhere.dao;

import java.util.List;


import com.springbootstudy.dhere.domain.Notice;


public interface NoticeDao {

    // 게시물 쓰기(syj)
	public abstract void noticeWrite(Notice notice);
	
    // 게시물 리스트 가져오기(syj)
    public abstract List<Notice> getNoticeList();
}