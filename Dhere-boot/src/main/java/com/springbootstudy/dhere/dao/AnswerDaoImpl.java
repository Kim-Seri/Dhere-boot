package com.springbootstudy.dhere.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springbootstudy.dhere.domain.Answer;

@Repository
public class AnswerDaoImpl implements AnswerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static final String NAME_SPACE = "com.springstudy.dhere.mappers.AnswerMapper";

	@Override
	public void insertAnswer(Answer answer) {
		sqlSession.insert(NAME_SPACE + ".insertAnswer", answer);
	}

}
