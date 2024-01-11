package com.springbootstudy.dhere.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Scrap {
	private int scrapNo;
	private int storyNo;
	private String title;
	private String content1;
	private String content2;
	private String content3;
	private String content4;
	private String email;
	private Timestamp regDate;
	private int categoryNo;
	private int readCount;
	private int thank;
	private String nickname1;
	private String fileName;
	private String picture1;
	private String tagName;
	private String categoryName;
	private Timestamp scrapDate;
	
	private String nickname;
	private String job;
	private String picture;
	private String pass;

}
	
	