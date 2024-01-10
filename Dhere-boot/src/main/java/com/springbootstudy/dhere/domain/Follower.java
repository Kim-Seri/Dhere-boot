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







/*
public class Follower {

	private String followingEmail;
	private String followerEmail;
	
	private String email;
	private String picture;
	private String job;
	private String nickname;
	

	public Follower() {}
	
	public Follower(String email, String followerEmail, String followingEmail, String picture, String job, String nickname) {
		this.followerEmail = followerEmail;
		this.followingEmail = followingEmail;

		this.email = email;
		this.picture = picture;
		this.job = job;
		this.nickname = nickname;
	}
	
	public String getFollowerEmail() {
		return followerEmail;
	}

	public void setFollowerEmail(String followerEmail) {
		this.followerEmail = followerEmail;
	}

	public String getFollowingEmail() {
		return followingEmail;
	}
	public void setFollowing_Email(String followingEmail) {
		this.followingEmail = followingEmail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

}
*/