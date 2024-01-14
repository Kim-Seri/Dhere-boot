package com.springbootstudy.dhere.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootstudy.dhere.dao.NoticeDao;
import com.springbootstudy.dhere.domain.Notice;


@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;

	// 공지사항 쓰기(syj)
	@Override
	public void noticeWrite(Notice notice) {
		noticeDao.noticeWrite(notice);
	}

	//	공지사항 읽기(syj)
	@Override
	public Notice noticeDetail(int noticeNo) {
		return noticeDao.noticeDetail(noticeNo);
	}

	//	공지사항 수정(syj)
	@Override
	public void noticeUpdate(Notice notice) {
		noticeDao.noticeUpdate(notice);
	}

	//	공지사항 삭제(syj)
	@Override
	public void noticeDelete(int noticeNo) {
		noticeDao.noticeDelete(noticeNo);
	}

	// 공지사항 목록 가져오기(syj)
	@Override
	public List<Notice> getNoticeList() {
		return noticeDao.getNoticeList();
	}
	
	@Override
	public Notice getNotice(int noticeNo) {
		return noticeDao.getNotice(noticeNo);
	}
	
}
