package com.springbootstudy.dhere.domain;

public class Answer {
	private int answerNo;
	private int no;
	private String answerContent;
	private String answerEmail;
	
	public Answer() {}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerEmail() {
		return answerEmail;
	}

	public void setAnswerEmail(String answerEmail) {
		this.answerEmail = answerEmail;
	}
	
}
