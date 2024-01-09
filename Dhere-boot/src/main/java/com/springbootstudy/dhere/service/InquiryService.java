package com.springbootstudy.dhere.service;

import java.util.List;

import com.springbootstudy.dhere.domain.Answer;
import com.springbootstudy.dhere.domain.Inquiry;

public interface InquiryService {

	public abstract void insertInquiry(Inquiry inquiry);
	
	public abstract List<Inquiry> iList(String email);
	
	public abstract Inquiry getInquiry(int inquiryNo);
	
	public abstract List<Inquiry> inquiryList();
	
	public abstract void deleteInquiry(int inquiryNo);
	
	public abstract List<Answer> getAnswerList(int inquiryNo);
}
