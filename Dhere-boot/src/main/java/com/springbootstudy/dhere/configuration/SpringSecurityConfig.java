package com.springbootstudy.dhere.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

/* 스프링 환경설정 클래스를 지정하는 애노테이션
 * 이 애노테이션이 붙은 클래스는 스프링 DI 컨테이너가 초기화 될 때 빈으로 등록된다.
 **/
@Configuration
// 요청 URL이 스프링 시큐리티의 제어를 받도록 지정하는 애노테이션
@EnableWebSecurity
public class SpringSecurityConfig {
	
	/* @Configuration이 적용된 클래스의 메서드에 
	 * @Bean 애노테이션을 사용해 빈을 수동으로 생성하도록 할 수 있다.
	 **/
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	/*@EnableWebSecurity 애너테이션을 사용하면 
	 * 내부적으로 SpringSecurityFilterChain이 동작하여 URL 필터가 적용된다.
	 **/
	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http.authorizeHttpRequests(
				/* 스프링 시큐리티를 적용하면 모든 요청 URL에서 인증을 시도하여
				 * 로그인 창이 나타나기 때문에 아래와 같이 설정하여 인증하지 않도록 설정했기
				 * 때문에 모든 페이지에 접근할 수 있다. 
				 **/
				authorizeHttpRequests -> 
							authorizeHttpRequests.requestMatchers(
										new AntPathRequestMatcher("/**"))
				.permitAll())
				/* 스프링 시큐리티가 CSRF 처리시 아래 URL은 예외로 처리하도록 설정 
				 * CSRF(cross site request forgery)는 웹 사이트 취약점 공격을 방지를 위해 사용하는 기술이다.
				 **/
				.csrf(csrf -> 
							csrf.ignoringRequestMatchers(
									new AntPathRequestMatcher("/h2-console/**")))
				.csrf(csrf -> csrf.disable());
		
		return http.build();
	}
	
}
