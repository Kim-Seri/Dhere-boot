package com.springbootstudy.dhere.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/* 스프링 환경설정 클래스를 지정하는 애노테이션
 * 이 애노테이션이 붙은 클래스는 스프링 DI 컨테이너가 초기화 될 때 빈으로 등록된다.
 * View 전용 컨트롤러를 등록하기 위한 클래스
 **/
@Configuration
public class WebConfig implements WebMvcConfigurer {
	/*	 
	<view-controller path="/mainAbout" view-name="mainAbout"/>
	<view-controller path="/mainNotice" view-name="mainNotice"/>
	<view-controller path="/footerMenu" view-name="footerMenu"/>
	<view-controller path="/otherScrap" view-name="otherScrap"/>
	<view-controller path="/inquiryWrite" view-name="inquiryWrite"/>
	<view-controller path="/iList" view-name="iList"/>
	<view-controller path="/inquiryDetail" view-name="inquiryDetail"/>
	<view-controller path="/adminInquiry" view-name="adminInquiry"/>
	<view-controller path="/answerWirte" view-name="answerWirte"/> 
	 */
	public void addViewControllers(ViewControllerRegistry registry) {
		//registry.addRedirectViewController("/", "/main");
		registry.addViewController("/loginForm").setViewName("loginForm");
		registry.addViewController("/joinForm").setViewName("joinForm");
		registry.addViewController("/scrap").setViewName("scrap");
		registry.addViewController("/mainProduct").setViewName("mainProduct");
		registry.addViewController("/inquiryWrite").setViewName("inquiryWrite");
		registry.addViewController("/answerWrite").setViewName("answerWrite");			
	}
}
