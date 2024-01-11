
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="resources/css/scrap.css">
<html xmlns:th="http://www.thymeleaf.org">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width">
   <head>
         <title>마이페이지</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/member.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/formcheck.js"></script>
<script src="resources/js/scrap.js"></script>
	</head>
<body>
	<div class="col justify-content-center" id="infobox">
		<div class="infoTab_box">
			<button type="button" class="infoTab_btn" >회원정보</button>
			<button type="button" class="infoTab_btn" onclick="location.href='${pageContext.request.contextPath}/mypageUpdateProcess'">회원정보수정</button>
			<button type="button" class="infoTab_btn" onclick="location.href='inquiryWrite'">1:1문의하기</button>
			<button type="button" class="infoTab_btn" onclick="location.href='iList'">문의내역</button>
		
					<c:if test="${ empty sessionScope.member.picture }">
	                    <img src="resources/images/icon/86683729.png" id="defaultPicture"
	                     style="width:150px; height:150px; object-fit: cover; border-radius: 70%; border: 3px solid blue" />
	                 </c:if>
	                 <c:if test="${ not empty sessionScope.member.picture }">
	                    <img src="resources/images/profile/${sessionScope.member.picture}" alt="150*150 크기 이미지" 
	                    style="width:150px; height:150px; object-fit: cover; border-radius: 70%; border: 3px solid blue">
	    </c:if>    
		</div>
	</div>
</body>
</html>			