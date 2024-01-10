package com.springbootstudy.dhere.domain;

public class Follower {
	
	private String follower_email;
	private String following_email;
	
	public Follower() {}

	public String getFollower_email() {
		return follower_email;
	}

	public void setFollower_email(String follower_email) {
		this.follower_email = follower_email;
	}

	public String getFollowing_email() {
		return following_email;
	}

	public void setFollowing_email(String following_email) {
		this.following_email = following_email;
	}
	
}
