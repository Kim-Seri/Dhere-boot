<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/header.css">
<head>
<script src="resources/js/allAreas.js"></script>
</head>

<div class="row p-5" id="header">
    <div class="col">
        <img src="resources/images/icon/logo2.png" id="header_logo" onclick="location.href='main'">
    </div>
    <div class="col justify-content-end d-flex align-items-center">
        <a href="mainAbout" class="text-decoration-none text-white" id="header_menu">About</a>
        <a href="notice" class="text-decoration-none text-white" id="header_menu">Notice</a>
        
        
 
        <img src="<c:choose>
			        <c:when test='${not empty sessionScope.member}'>
			            resources/images/profile/${sessionScope.member.picture}
			        </c:when>
			        <c:otherwise>
								resources/images/profile/DefaultProfile.png
			        </c:otherwise>
			    </c:choose>"
			id="login_menu" 
			tabindex="0" 
			data-bs-html="true" 
			data-bs-placement="bottom" 
			data-bs-toggle="popover" 
			data-bs-trigger="focus" 
			data-bs-title="<c:choose>
							        <c:when test='${not empty sessionScope.member}'>
							            ${sessionScope.member.nickname}
							        </c:when>
							        <c:otherwise>
							            로그인이
							            <br>
							            <br>
							            필요합니다
							        </c:otherwise>
							    </c:choose>" 
			data-bs-content="<c:choose>
								        <c:when test='${empty sessionScope.member}'>
								            <a href='loginForm' class='text-decoration-none text-dark'>로그인</a>
								            <br>
								            <br>
								            <a href='joinForm' class='text-decoration-none text-dark'>회원가입</a>
								        </c:when>
								        <c:when test="${sessionScope.member.role eq 'admin'}">
								            <a href='adminInquiry' class='text-decoration-none text-dark'>전체 문의내역</a>
								            <br>
									    	<br>
								            <a href='logoutResult' class='text-decoration-none text-dark'>로그아웃</a>
								        </c:when>
								        <c:otherwise>
								            <!-- 로그인 성공한 경우 -->
								            <a href='scrap' class='text-decoration-none text-dark'>마이페이지</a>
								            <br>
								            <br>
								            <a href='logoutResult' class='text-decoration-none text-dark'>로그아웃</a>
								        </c:otherwise>
								    </c:choose>
	    	">
    </div>
</div>


