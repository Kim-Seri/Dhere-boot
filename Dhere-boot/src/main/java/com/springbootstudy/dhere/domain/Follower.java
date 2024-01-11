package com.springbootstudy.dhere.domain;

public class Follower {
	
	private String followerEmail;
	private String followingEmail;
	
	private String nickname;
	private String picture;
	
	
	
	
	public Follower() {}

	public String getFollowerEmail() {
		return followerEmail;
	}

	public void setFollowerEmail(String followerEmail) {
		this.followerEmail = followerEmail;
	}

	public String getFollowingEmail() {
		return followingEmail;
	}

	public void setFollowingEmail(String followingEmail) {
		this.followingEmail = followingEmail;
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