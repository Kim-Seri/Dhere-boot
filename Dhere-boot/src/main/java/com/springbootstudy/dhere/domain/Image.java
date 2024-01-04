package com.springbootstudy.dhere.domain;

public class Image {
	
	private int imageNo;
	private String fileName;
	private int storyNo;
	
	public Image() {}

	public Image(int imageNo, String fileName, int storyNo) {
	    this.imageNo = imageNo;
	    this.fileName = fileName;
	    this.storyNo = storyNo;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getStoryNo() {
		return storyNo;
	}

	public void setStoryNo(int storyNo) {
		this.storyNo = storyNo;
	}
	

}
