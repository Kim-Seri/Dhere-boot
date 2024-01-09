package com.springbootstudy.dhere.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootstudy.dhere.dao.InquiryDao;
import com.springbootstudy.dhere.domain.Answer;
import com.springbootstudy.dhere.domain.Inquiry;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryDao inquiryDao;

	@Override
	public void insertInquiry(Inquiry inquiry) {
		inquiryDao.insertInquiry(inquiry);

	}
	
	@Override
	public List<Inquiry> iList(String email) {
		
		return inquiryDao.iList(email);
	}
	
	@Override
	public Inquiry getInquiry(int inquiryNo) {
		return inquiryDao.getInquiry(inquiryNo);
	}
	
	@Override
	public List<Inquiry> inquiryList() {
		
		return inquiryDao.inquiryList();
	}
	
	@Override
	public void deleteInquiry(int inquiryNo) {
		
		inquiryDao.deleteInquiry(inquiryNo);
	}
	
	@Override
    public List<Answer> getAnswerList(int inquiryNo) {
        return inquiryDao.getAnswerList(inquiryNo);
    }

}
