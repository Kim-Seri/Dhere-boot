package com.springbootstudy.dhere.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootstudy.dhere.dao.AnswerDao;
import com.springbootstudy.dhere.domain.Answer;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Autowired
	private AnswerDao answerdao;

	@Override
	public void insertAnswer(Answer answer) {
		answerdao.insertAnswer(answer);
	}

}
