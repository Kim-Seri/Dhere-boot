<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script src="resources/js/formcheck.js"></script>  
<input type="hidden" id="inquiryNo" value="${inquiry.inquiryNo}">
	<!-- content 영역 -->
	<div class="row my-5" id="global-content">		
		<div class="offset-1 col-10">
			<div class="row">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center">상세보기(${inquiry.regDate})</h2>
				</div>
			</div>
			<form name="inquiryWrite" id="inquiryWrite" action="inquiryWriteForm"
				class="row g-3 border border-3 m-3 p-3 rounded-3 border-primary" method="post" enctype="multipart/form-data">
				  <div class="col-10 offset-1 my-5">
				    <input type="text" class="form-control" name="inquiryTitle" id="inquiryTitle" value="${inquiry.inquiryTitle}" style="border: none; border-radius: 0; border-bottom: 2px solid rgb(49, 108, 244); outline: none; font-size: 30px; font-weight: bold" readonly>
				  </div>
				  <div class="col-10 offset-1 my-5">
				  	<input type="text" class="form-control" name="inquiryContent" id="inquiryContent" value="${inquiry.inquiryContent}" style="border: none; border-radius: 0; border-bottom: 2px solid rgb(49, 108, 244); outline: none" readonly> 
				  </div>
				  <div class="col-3">
					<img src="resources/images/inquiry/${inquiry.inquiryFile}" style="max-width: 200%; height: auto;">
				  </div>
				  <c:forEach var="answer" items="${answerList}">
				    <div class="col-10 offset-1 border border-3 rounded-3 my-5">
				    	<input type="text" value="${answer.answerContent}" style="height: 150px; border: none; outline: none" readonly>
				    </div>
				</c:forEach>
				<c:if test="${sessionScope.member.role eq 'user'}">
			    	<div class="row mt-3 text-center">
			    		<div class="col my-5">
				 	 		<input type="button" class="btn border-3 border-primary" style="width: 90px; height: 45px; font-weight: bold; color:rgb(49, 108, 244)" value="돌아가기" onclick="goBack()">
				 	 	</div>
			 	 	</div>
			    </c:if>
			    
			    <c:if test="${sessionScope.member.role eq 'admin'}">
				 	 <div class="row mt-3 text-center my-5">
				 	 	<div class="col">
				 	 		<input type="button" class="btn btn-primary" value="답변하기" style="width: 90px; height: 45px" onclick="location.href='answerWrite?no=${inquiry.inquiryNo}'">
				 	 	</div>
				 	 	<div class="col">
				 	 		<input type="button" class="btn border-3 border-primary" style="width: 90px; height: 45px; font-weight: bold; color:rgb(49, 108, 244)" value="삭제하기" id="deleteInquiry">
				 	 	</div>
				 	 	<div class="col">
				 	 		<input type="button" class="btn border-3 border-primary" style="width: 90px; height: 45px; font-weight: bold; color:rgb(49, 108, 244)" value="돌아가기" onclick="goBack()">
				 	 	</div>
				 	 </div>
				  </c:if>
			</form>
		</div>
	</div>		