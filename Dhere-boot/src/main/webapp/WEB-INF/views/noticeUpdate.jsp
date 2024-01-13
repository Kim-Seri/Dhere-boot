<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class ="row text-center">
<div class="col">
	<form name="noticeUpdateForm" action="noticeUpdate" id="noticeUpdateForm" method="post">
		<div class="row">
			<div class="col">
			<label for="title" class="form-label">제목</label>
				<input type="text" class="form-control" name="title" id="title" value="${ Notice.title }">
			<label for="content" class="form-label">내용</label>
				<input type="text" class="form-control" name="content" id="content" value="${ Notice.content }">
			<input type="submit" value="등록하기" class="btn-btn-primary" />
			<input type="button" value="목록보기" class="btn-btn-primary" onclick="location.href='notice'" />
			</div>
		</div>
	</form>
</div>
</div>