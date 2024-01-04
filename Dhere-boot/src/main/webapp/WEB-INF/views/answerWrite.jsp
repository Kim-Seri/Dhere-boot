<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<!-- content 영역 -->
	<div class="row my-5" id="global-content">		
		<div class="offset-1 col-10">
			<div class="row">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center">답변하기</h2>
				</div>
			</div>
			<form name="inquiryWrite" id="inquiryWrite" action="inquiryWriteForm"
				class="row g-3" method="post" enctype="multipart/form-data">
				  <div class="col-10 offset-1">
				    <label for="inquiryContent" class="form-label">내 용</label>
				    <textarea name="inquiryContent" id="inquiryContent" class="form-control" rows="10"></textarea>
				  </div>
				  <div class="col-10 offset-1 mt-5 text-center">
					<input type="submit" value="답변하기" class="btn btn-primary">				    
					<input type="button" value="목록보기" class="btn btn-warning" onclick="location.href='main'">			    
				  </div>
			</form>
			
		</div>
	</div>		