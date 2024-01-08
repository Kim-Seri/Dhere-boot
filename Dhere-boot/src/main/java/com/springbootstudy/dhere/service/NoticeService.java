package com.springbootstudy.dhere.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.springbootstudy.dhere.domain.Notice;

public interface NoticeService {
	
	// 게시물 쓰기(syj)
	public abstract void noticeWrite(Notice notice);
	
	// 게시물 리스트 가져오기(syj)
    public abstract List<Notice> getNoticeList();
}