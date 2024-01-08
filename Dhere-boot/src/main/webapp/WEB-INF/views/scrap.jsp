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
	<!-- 전체 컨테이너 시작 -->
<div class="container mt-5 row justify-content-center">
<div class="col-auto">
	<!-- 탭바 (프로필/정보수정/1:1문의하기/로그아웃) 시작 -->
	
	<div class="col justify-content-center" id="infobox">
		<div class="infoTab_box">
			<button type="button" class="btn btn-outline-primary" id="infoTab_btn" onclick="showInfo(0)">회원정보</button>
			<button type="button" class="btn btn-outline-primary" id="infoTab_btn" onclick="location.href='${pageContext.request.contextPath}/mypageUpdateProcess'">회원정보수정</button>
			<button type="button" class="btn btn-outline-primary" id="infoTab_btn" onclick="location.href='inquiryWrite'">1:1문의하기</button>
			<button type="button" class="btn btn-outline-primary" id="infoTab_btn" onclick="showInfo(1)">로그아웃</button>
		</div>
		<div class="infoContent_box">
			<div class="row infoContent">
				<!-- 프로필 사진 시작 -->
            	<div class="col-4" >
					 <c:if test="${ empty sessionScope.member.picture }">
	                    <img src="resources/images/icon/86683729.png" id="defaultPicture"
	                     style="width:150px; height:150px; object-fit: cover; border-radius: 70%; border: 3px solid blue" />
	                 </c:if>
	                 <c:if test="${ not empty sessionScope.member.picture }">
	                    <img src="resources/upload/${sessionScope.member.picture}" alt="150*150 크기 이미지" 
	                    style="width:150px; height:150px; object-fit: cover; border-radius: 70%; border: 3px solid blue">
	                 </c:if>           
            	</div>
				<!-- 프로필 사진 끝 -->
			<!-- 닉네임/이메일/직업/좋아요 시작 -->
			
                <!-- 닉네임 -->
                <div class="col-6 offset-1">
	                <div class="row">
		                <div class="col" style="font-size: 35px; color: rgb(49, 108, 244); font-weight: bold">
		                    ${sessionScope.member.nickname}
		                </div>
	                </div>
	                <!-- 이메일 -->
	                <div class="row">
		                <div class="col" style="font-size: 25px; color: rgb(49, 108, 244)">
		                    (${sessionScope.member.email})
		                </div>
	                </div>
	                <!-- 직업 -->
	                <div class="row">
		                <div class="col" style="font-size: 25px; color: rgb(49, 108, 244)">
		                    ${sessionScope.member.job}
		                </div>
	                </div>
	                <!-- 하트 시작 -->
	                <div class="row">
		                <div class="col" style="color: rgb(49, 108, 244)">
		                    <img src="resources/images/icon/heart.png" style="width: 30px; height: 30px"> 개
						</div>
	                </div>
				</div>
	
			</div>
			<!-- 닉네임/이메일/직업/좋아요 끝 -->
			<div class="infoContent alert-box" id="logout_btn">
			<div>
				<p>정말 로그아웃 하실건가요?</p>				
				<a class="btn btn-primary" href="/" >아니오</a>
				<a class="btn btn-primary" href="/logoutResult" >네에</a>
			</div>
			</div>			
</div>
</div>
	
	<!-- 탭바 (프로필/정보수정/1:1문의하기/로그아웃) 끝 -->
	<!-- 탭바 (내 게시물/스크랩 항목/팔로우) 시작 -->
	<div class="row mt-5">
	<div class="col">
		<ul class="nav nav-underline offset-1" id="myPostsBtn">
		  <li class="nav-item text-center" data-tab="myPosts" style="width: 170px">
		    <a class="nav-link active" aria-current="page" 
		    style="font-size: 25px; color: rgb(56, 96, 255); cursor: pointer" data-bs-toggle="pill">나의 게시물</a>
		  </li>
		  <li class="nav-item text-center" data-tab="myScraps" style="width: 170px">
		    <a class="nav-link " aria-current="page" 
		    style="font-size: 25px; color: rgb(56, 96, 255); cursor: pointer" data-bs-toggle="pill">나의 스크랩</a>
		  </li>
		  <li class="nav-item text-center" data-tab="followListsß" style="width: 170px">
		    <a class="nav-link " aria-current="page" 
		    style="font-size: 25px; color: rgb(56, 96, 255); cursor: pointer" data-bs-toggle="pill">팔로우 목록</a>
		  </li>
		</ul>
	<div class="tabcontent">
		<div class="tabcontent fade show active" id="myPosts">
    		호
 		 </div>

  		<!-- 나의 스크랩 탭 내용 -->
  		<div class="tabcontent fade" id="myScraps">
   		 이
  		</div>

  		<!-- 팔로우 목록 탭 내용 -->
		<div class="tab-content fade" id="followLists">
		와우
  		</div>
	</div>
	</div>
	<!-- 탭바 (내 게시물/스크랩 항목/팔로우) 끝 -->
	 <input type="button" value="morepage" />
</div>
</div>
</div>
	<!-- 전체컨테이너 끝 -->
</body>
</html>