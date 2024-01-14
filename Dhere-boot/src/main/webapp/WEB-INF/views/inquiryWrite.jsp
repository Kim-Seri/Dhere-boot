<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script src="resources/js/formcheck.js"></script>  
	<!-- content 영역 -->
	<div class="row my-5" id="global-content">		
		<div class="offset-1 col-10">
			<!-- <div class="row">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center">문의하기</h2>
				</div>
			</div> -->
			<form name="inquiryWrite" id="inquiryWrite" action="inquiryWriteForm"
				class="row g-3 border border-3 m-3 p-3 rounded-3 border-primary" method="post" enctype="multipart/form-data">
				   <%-- <div class="col-5 offset-1">
				    <label for="inquiryEmail" class="form-label">글쓴이</label>
				    <input type="text" class="form-control" name="inquiryEmail" id="inquiryEmail" value="${sessionScope.member.email}" readonly>
				  </div> --%>
				  <div class="col-10 offset-1 my-5">
				    <input type="text" class="form-control" name="inquiryTitle" id="inquiryTitle" placeholder="제목을 입력해 주세요." style="font-size: 30px; font-weight: bold; border: none; border-radius: 0; border-bottom: 2px solid rgb(49, 108, 244); outline: none">
				  </div>
				  <div class="col-10 offset-1 my-5">
				  <input type="text" class="form-control" name="inquiryContent" id="inquiryContent" placeholder="내용을 입력해 주세요." style="border: none; height: 150px; border-radius: 0; border-bottom: 2px solid rgb(49, 108, 244); outline: none">
				    
				  </div>
				  <div class="col-10 offset-1">
				    <input type="file" name="imgFile" id="imgFile" class="form-control" style="border: none; outline: none"></input>
				  </div>
				  <div class="col-10 offset-1 mt-5 text-center">
					<input type="submit" value="등록" class="btn btn-primary rounded-3" style="width: 90px; height: 45px; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				    
					<input type="button" value="취소" class="btn border-3 border-primary rounded-3" style="width: 90px; height: 45px; font-weight: bold; color:rgb(49, 108, 244)" onclick="goBack()">			    
				  </div>
			</form>
			
		</div>
	</div>		