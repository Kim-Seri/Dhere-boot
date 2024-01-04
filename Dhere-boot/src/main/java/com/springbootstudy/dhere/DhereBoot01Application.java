package com.springbootstudy.dhere;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

//JPA Auditing(감시) 기능을 활성화 하는 어노테이션
@EnableJpaAuditing
@SpringBootApplication
public class DhereBoot01Application {	
	public static void main(String[] args) {
		SpringApplication.run(DhereBoot01Application.class, args);
	}
}
