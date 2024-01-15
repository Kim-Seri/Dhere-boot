package com.springbootstudy.dhere.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.springbootstudy.dhere.interceptor.LoginCheckInterceptor;

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
		registry.addViewController("/inquiryWrite").setViewName("inquiryWrite");
		registry.addViewController("/answerWrite").setViewName("answerWrite");
		registry.addViewController("/noticeWriteForm").setViewName("noticeWriteForm");
		registry.addViewController("/noticeUpdateForm").setViewName("noticeUpdateForm");
		registry.addViewController("/notice").setViewName("notice");
		registry.addViewController("/findIdPass").setViewName("findIdPass");
		registry.addViewController("/findId").setViewName("findId");
		registry.addViewController("/findPass").setViewName("findPass");
		registry.addViewController("/mainAbout").setViewName("mainAbout");
	}
	
	// Interceptor 등록
		@Override
		public void addInterceptors(InterceptorRegistry registry) {
			registry.addInterceptor(new LoginCheckInterceptor())
						// 인터셉터 호출에서 제외
						.excludePathPatterns("/resources/**", "/", "/main", "/login*","/join*","/categoryList","/productList","/storyDetail", "/storyList","/authenNumCheck","/nicknameCheck", "/find*",
								"/findCheckId","/notice","/mainAbout");
						// 인터셉터 호출에 추가
						//.addPathPatterns("/mypage*", "/post*");
		}
		
		//  classpath:/static/resources/images/** 에 모든 리소스를 저장하고 
		// /resources/images/** 로 요청되는 리소스 요청 설정
		//  css, js, images를 모두 src/main/resources/static/resources/** 에 저장하고 적용해야 함
	
//  classpath:/static/resources/images/** 에 모든 리소스를 저장하고 
	// /resources/images/** 로 요청되는 리소스 요청 설정
	//  css, js, images를 모두 src/main/resources/static/resources/** 에 저장하고 적용해야 함	
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**")
					// classpath: 방식으로 지정하면 약간의 지연이 생김 - 새로 고침 필요 
					// .addResourceLocations("classpath:/resources/")
		
					// file: 프로토콜을 사용하면 업로드한 이미지가 바로 보인다. 
					.addResourceLocations("file:./src/main/resources/static/resources/")
					.setCachePeriod(1);		
	}


	// #############################################################################
	// ####### 아래는 참고용
	
	//  classpath:/resources/** 에 모든 리소스를 저장하고 /resources/** 로 요청되는 리소스 요청 설정
	//  css, js, images를 모두 src/main/resources/resources/** 에 저장하고 적용해야 함
	/*
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**")
					.addResourceLocations("classpath:/resources/")
					.addResourceLocations("file:./src/main/resources/resources/")
					.setCachePeriod(1);		
	}
	*/
		
	
	// 프로젝트 외부 폴더를 이미지 저장소로 사용 - 현재 프로젝트가 실행되고 있는 최상위 루트에서 부터 참조
	// d:/resources/images/desk 에 저장하고 /resources/images/desk/** 로 요청되는 리소스 요청 설정 
	/*
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {		
		registry.addResourceHandler("/resources/images/desk/**")
		
					// 아래와 같이 지정하면 src/main/webapp/resources/images/desk/에서 이미지를 찾는다.
					//.addResourceLocations("/resources/images/desk/")
		
					// 아래는 현재 프로젝트를 기준으로 src/main/resources/desk/ 에서 이미지를 찾는다.
					// 이 위치는 기본 리소스 폴더가 아니므로 파일이 업로도 되면 프로젝트 소스가 변경된 것으로
					// 판단하여 서버가 다시 리프레시 되고 세션이 풀려버린다.
					//.addResourceLocations("file:./src/main/resources/desk/")
		
					// 아래와 같이 file 프로토콜을 사용하면 현재 프로젝트가 실행되고 있는 최상의 루트부터 참조 
					// 즉 /resources/images/desk/ 폴더을 기준으로 요청된 파일을 찾는다.
					.addResourceLocations("file:///resources/images/desk/")
					.setCachePeriod(1);
	}
	*/
	
}
