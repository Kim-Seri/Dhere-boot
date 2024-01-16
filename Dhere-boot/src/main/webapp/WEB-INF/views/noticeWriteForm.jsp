<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="resources/css/mainNoticeWriteForm.css">




	<div class="row">		
		<div class="col p-5">
		
			<div class="row">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center">공지 작성하기</h2>
				</div>
			</div>
			
			<form name="noticeWrite" id="noticeWrite" action="/noticeWrite" class="row g-3 border border-3 m-3 p-3 rounded-3 border-primary" method="post" enctype="multipart/form-data">
				<div class="row mt-5">
					<div class="col">
						<label >작성자</label>
						<input type="text" class="form-control" name="email" id="email" value="${sessionScope.member.email}" readonly>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<label >제목</label>
						<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요" >
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<label >내용</label>
						<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" ></textarea>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<input type="file" class="form-control" name="file" id="file"></input>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col text-center">
						<input type="submit" value="등록" class="btn btn-primary"> 		    
						<input type="button" value="취소" class="btn btn-outline-primary" onclick="location.href='notice'">			    
					</div>
				</div>
			</form>
			
		</div>
	</div>		
	
	