package com.springbootstudy.dhere.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springbootstudy.dhere.dao.NoticeDao;
import com.springbootstudy.dhere.domain.Notice;


@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;

	// 게시물 쓰기(syj)
	@Override
	public void noticeWrite(Notice notice) {
		noticeDao.noticeWrite(notice);
	}

	// 게시물 리스트 가져오기(syj)
	@Override
	public List<Notice> getNoticeList() {
		return noticeDao.getNoticeList();
	}
}
