package com.springbootstudy.dhere.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootstudy.dhere.dao.AnswerDao;
import com.springbootstudy.dhere.domain.Answer;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Autowired
	private AnswerDao answerDao;

	@Override
	public void insertAnswer(Answer answer) {
		answerDao.insertAnswer(answer);
	}
	
	@Override
	public List<Answer> answerList(int inquiryNo) {
		return answerDao.answerList(inquiryNo);
	}

}
