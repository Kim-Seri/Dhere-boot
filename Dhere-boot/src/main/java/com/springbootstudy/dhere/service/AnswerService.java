package com.springbootstudy.dhere.service;

import java.util.List;

import com.springbootstudy.dhere.domain.Answer;

public interface AnswerService {
public abstract void insertAnswer(Answer answer);
	
	public abstract List<Answer> answerList(int inquiryNo);
}
