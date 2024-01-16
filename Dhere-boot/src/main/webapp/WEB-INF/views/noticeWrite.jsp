<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
	<div class="col">
		<form name="noticeWrite" action="noticeWrite" id="noticeWrite" method="post">
			<label for="title" class="form-label">제목</label>
				<input type="text" class="form-control" name="title" id="title" >
			<label for="content" class="form-label">내용</label>
				<input type="text" class="form-control" name="content" id="content" >
			<input type="submit" value="등록하기" class="btn-btn-primary" />
			<input type="button" value="목록보기" class="btn-btn-primary" onclick="location.href='notice'" />
		</form>
	</div>
</div>

