package com.springbootstudy.dhere.domain;

import java.sql.Timestamp;

public class Scrap {
	private int scrap_no;
	private String email;
	private int story_no;
	private Timestamp scrap_date;
	
	private int storyNo; // 추가
    private Timestamp scrapDate; // 추가
	
	private String nickname;
	private String job;
	private String picture;
	private String pass;
	 
	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public Scrap() {}

	public Scrap(int scrap_no, String email, int story_no, Timestamp scrap_date, 
			String nickname, String job, String picture, String pass) {
		this.scrap_no = scrap_no;
		this.email = email;
		this.story_no = story_no;
		this.scrap_date = scrap_date;
		
		this.nickname = nickname;
		this.job = job;
		this.picture = picture;
		this.pass = pass;
		}

	public int getScrap_no() {
		return scrap_no;
	}

	public void setScrap_no(int scrap_no) {
		this.scrap_no = scrap_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getStory_no() {
		return story_no;
	}

	public void setStory_no(int story_no) {
		this.story_no = story_no;
	}

	public Timestamp getScrap_date() {
		return scrap_date;
	}

	public void setScrap_date(Timestamp scrap_date) {
		this.scrap_date = scrap_date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getStoryNo() {
		return storyNo;
	}

	public void setStoryNo(int storyNo) {
		this.storyNo = storyNo;
	}

	public Timestamp getScrapDate() {
		return scrapDate;
	}

	public void setScrapDate(Timestamp scrapDate) {
		this.scrapDate = scrapDate;
	}
	
	
	}
	
	