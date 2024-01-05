package com.springbootstudy.dhere.domain;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

public class Reply {
	
	private int storyNo;
	private int replyNo;
	private String replyContent;
	private String email;
	private Timestamp replyDate;
    private String nickname;
    private String picture;
	
	public int getStoryNo() {
		return storyNo;
	}
	public void setStoryNo(int storyNo) {
		this.storyNo = storyNo;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Timestamp replyDate) {
		this.replyDate = replyDate;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	
}
