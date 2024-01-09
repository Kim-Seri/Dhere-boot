package com.springbootstudy.dhere.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 접속자가 로그인 상태인지 체크하는 인터셉터
public class LoginCheckInterceptor implements HandlerInterceptor {
	
	// 클라이언트 요청이 들어오고 컨트롤러가 실행되기 전에 호출	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {
		
		// 세션에 isLogin란 이름의 데이터가 없으면 로그인 상태가 아님
		if(request.getSession().getAttribute("isLogin") == null) {
			// 로그인 폼으로 리다이렉트하고 false를 반환
			response.sendRedirect("loginForm");			
			return false;
		}
		return true;
	}

	// 클라이언트 요청이 들어오고 컨트롤러가 정상적으로 실행된 이후에 호출 - 뷰가 생성되기 전에 호출
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	
	// 클라이언트 요청을 처리하고 뷰를 생성해 클라이언트로 응답을 전송한 후에 호출
	@Override
	public void afterCompletion(HttpServletRequest request, 
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
