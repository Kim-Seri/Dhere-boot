<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="resources/css/mainNoticeWriteForm.css">
	<!-- content 영역 -->
	<div class="row my-5" id="global-content">		
		<div class="offset-1 col-10">
			<div class="row">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center">공지사항</h2>
				</div>
			</div>
			<form name="inquiryWrite" id="inquiryWrite" action="inquiryWriteForm"
				class="row g-3 border border-3 m-3 p-3 rounded-3 border-primary" method="post" enctype="multipart/form-data">
				   <div class="col-5 offset-1">
				    <label for="noticeEmail" class="form-label">글쓴이</label>
				    <input type="text" class="form-control" name="noticeEmail" id="noticeEmail" value="${sessionScope.member.email}" readonly>
				  </div>
				  <div class="col-10 offset-1 my-5">
				    <input type="text" class="form-control" name="noticeTitle" id="noticeTitle" placeholder="제목을 입력해 주세요." >
				  </div>
				  <div class="col-10 offset-1 my-5">
				  <input type="text" class="form-control" name="noticeContent" id="noticeContent" placeholder="내용을 입력해 주세요." >
				    
				  </div>
				  <div class="col-10 offset-1">
				    <input type="file" name="imgFile" id="imgFile" class="form-control"></input>
				  </div>
				  <div class="col-10 offset-1 mt-5 text-center">
					<input type="submit" value="등록" class="btn btn-primary rounded-3" style="width: 90px; height: 45px; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				    
					<input type="button" value="취소" class="btn border-3 border-primary rounded-3" style="width: 90px; height: 45px; font-weight: bold; color:rgb(49, 108, 244)" onclick="goBack()">			    
				  </div>
			</form>
			
		</div>
	</div>		