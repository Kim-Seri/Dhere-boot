package com.springbootstudy.dhere.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springbootstudy.dhere.dao.InquiryDao;
import com.springbootstudy.dhere.domain.Inquiry;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryDao inquirydao;

	@Override
	public void insertInquiry(Inquiry inquiry) {
		inquirydao.insertInquiry(inquiry);

	}
	
	@Override
	public List<Inquiry> iList(String email) {
		
		return inquirydao.iList(email);
	}
	
	@Override
	public Inquiry getInquiry(int inquiryNo) {
		return inquirydao.getInquiry(inquiryNo);
	}
	
	@Override
	public List<Inquiry> inquiryList() {
		
		return inquirydao.inquiryList();
	}

}
