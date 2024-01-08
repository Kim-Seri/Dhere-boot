<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<!-- content 영역 -->
	<div class="row my-5" id="global-content">		
		<div class="offset-1 col-10">
			<!-- <div class="row">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center">답변하기</h2>
				</div>
			</div> -->
			<form name="answerWrite" id="answerWrite" action="answerWriteForm"
				class="row g-3 border border-3 m-3 p-3 rounded-3 border-primary" method="post">
				<input type="hidden" name="no" value="${no}">
				<div class="row">
				<div class="col-4 text-center d-flex align-items-center justify-content-center">
					<img src="resources/images/profile/${sessionScope.member.picture}" style="width: 200px; height: 200px">
				</div>
				  <div class="col-8 my-5">
				    <textarea name="answerContent" id="answerContent" class="form-control" rows="10"></textarea>
				  </div>
				  </div>
				  <div class="col-10 offset-1 mt-5 text-center">
					<input type="submit" value="답변완료" class="btn btn-primary" style="width: 90px; height: 45px; font-weight: bold">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="돌아가기" class="btn border-3 border-primary" style="width: 90px; height: 45px; font-weight: bold; color:rgb(49, 108, 244)" onclick="goBack()">			    
				  </div>
			</form>
		</div>
	</div>		