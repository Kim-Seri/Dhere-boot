package com.springbootstudy.dhere.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Marker {
	private int markerNo;
	private int storyNo;
	private int top1;
	private int left1;
	private int imageNo;
	private int productNo;
	/*
	public String toString() {
		return "top1 : " + this.top1 + ", left1 : " + this.left1 + ", productNo : " + this.productNo; 
	}
	*/
}
