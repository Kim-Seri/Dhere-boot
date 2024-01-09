package com.springbootstudy.dhere.domain;

import java.util.List;

public class Inquiry {
	private int inquiryNo;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryFile;
	private String regDate;
	private String inquiryEmail;
	private List<Answer> answerList;
	
	public Inquiry() {}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public String getInquiryFile() {
		return inquiryFile;
	}

	public void setInquiryFile(String inquiryFile) {
		this.inquiryFile = inquiryFile;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getInquiryEmail() {
		return inquiryEmail;
	}

	public void setInquiryEmail(String inquiryEmail) {
		this.inquiryEmail = inquiryEmail;
	}
	
	public List<Answer> getAnswerList() {
        return answerList;
    }

    public void setAnswerList(List<Answer> answerList) {
        this.answerList = answerList;
    }
	
}
