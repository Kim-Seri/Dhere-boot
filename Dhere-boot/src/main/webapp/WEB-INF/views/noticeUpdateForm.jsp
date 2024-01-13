<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="resources/css/mainNoticeWriteForm.css">




	<div class="row">		
		<div class="col bg-warning p-5">
		
			<div class="row bg-info">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center">공지 수정하기</h2>
				</div>
			</div>
			
			<form name="noticeUpdate" id="noticeUpdate" action="/noticeUpdate" class="row g-3 border border-3 m-3 p-3 rounded-3 border-primary" method="post" enctype="multipart/form-data">
			<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
				<div class="row mt-5">
					<div class="col">
						<input type="text" class="form-control" name="email" id="email" value="${sessionScope.member.email}" readonly>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<input type="text" class="form-control" name="title" id="title" value="${notice.title}" >
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<textarea class="form-control" rows="5" name="content" id="content">${notice.content}</textarea>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<input type="file" class="form-control" name="file" id="file"></input>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col text-center">
						<input type="submit" value="수정 완료" class="btn btn-primary"> 		    
						<input type="button" value="취소" class="btn btn-primary" onclick="goBack()">			    
					</div>
				</div>
			</form>
			
		</div>
	</div>		
	
	
	