package com.springbootstudy.dhere.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.springbootstudy.dhere.domain.Notice;

public interface NoticeService {
	
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
    
    //no에 해당하는 게시글을 읽어와 반환하는 메서드
    public abstract Notice getNotice(int noticeNo);

}