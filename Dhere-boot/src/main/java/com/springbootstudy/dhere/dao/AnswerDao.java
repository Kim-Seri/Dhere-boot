package com.springbootstudy.dhere.dao;

import java.util.List;

import com.springbootstudy.dhere.domain.Answer;

public interface AnswerDao {
	
	public abstract void insertAnswer(Answer answer);
	
	public abstract List<Answer> answerList(int inquiryNo);
}
