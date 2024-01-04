package com.springbootstudy.dhere.domain;

public class Member {
   private String email;
   private String name;
   private String nickname;
   private String pass;
   private String zipcode;
   private String address1;
   private String address2;
   private String job;
   private String phone;
   private String picture;
   private String role;
   
   public Member() {}

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getNickname() {
      return nickname;
   }

   public void setNickname(String nickname) {
      this.nickname = nickname;
   }

   public String getPass() {
      return pass;
   }

   public void setPass(String pass) {
      this.pass = pass;
   }

   public String getZipcode() {
      return zipcode;
   }

   public void setZipcode(String zipcode) {
      this.zipcode = zipcode;
   }

   public String getAddress1() {
      return address1;
   }

   public void setAddress1(String address1) {
      this.address1 = address1;
   }

   public String getAddress2() {
      return address2;
   }

   public void setAddress2(String address2) {
      this.address2 = address2;
   }

   public String getJob() {
      return job;
   }

   public void setJob(String job) {
      this.job = job;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getPicture() {
      return picture;
   }

   public void setPicture(String picture) {
      this.picture = picture;
   }

   public String getRole() {
      return role;
   }

   public void setRole(String role) {
      this.role = role;
   }
   
}