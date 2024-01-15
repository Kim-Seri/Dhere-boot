<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="resources/css/main.css">
<html xmlns:th="http://www.thymeleaf.org">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width">
         <title>마이페이지</title>
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width">
         <title>마이페이지</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/otherScrap.css">
<script src="resources/js/jquery-3.2.1.min.js"></script>
	<style>
    
    </style>
   </head>
<body>
	<!-- 컨텐츠 메뉴시작 -->
	<div class="container mt-5">
	 <div class="d-flex justify-content-center">
	    <ul class="nav nav-pills text-center">
	        <li class="nav-item"  style="width: 140px; font-size: 18px">
	            <a class="nav-link active text-center" id="tab1-tab" data-bs-toggle="pill" href="#tab1" 
	            role="tab" aria-controls="tab1" aria-selected="true">회원정보</a>
	        </li>
	    </ul>
    </div>
    <!-- 컨텐츠 메뉴 끝 -->
    <!-- 컨텐츠 내용 시작 -->
    <div class="row tab-content">
        <div class="col tab-pane fade show active d-flex justify-content-center" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
            <div class="row" style="width:700px; height: 300px; border:10px solid rgb(49, 108, 244); border-radius: 20px">
            	<div class="col my-5" style="margin-left: 80px">
           			<div class="row">
                		<div class="col-4">
		               		<img src="resources/images/profile/${param.picture}" alt="150*150 크기 이미지" 
		               			style="width: 150px; height: 150px; object-fit: cover; border-radius: 70%;">     
                		</div>
		                <div class="col-8">
			                <div class="row">
				                <div class="col" style="font-size: 35px; color: rgb(49, 108, 244); font-weight: bold">
				                    ${param.nickname}
			                    </div>
		                    </div>
		                    <div class="row">
			                    <div class="col" style="font-size: 25px; color: rgb(49, 108, 244)">
			                    	${param.email}
		                    	</div>
		                    </div>
		                    <div class="row">
			                    <div class="col my-1" style="font-size: 25px; color: rgb(49, 108, 244)">
			                   	 	${param.categoryName}
			                    </div>
		                    </div>
		                    <div class="row">
			                    <div class="col my-1" style="color: rgb(49, 108, 244)">
			                   		<img src="resources/images/icon/heart.png" style="width: 30px; height: 30px"> 00개
			                    </div>
		                	</div>
		                </div>
	                </div>
                </div>
            </div>
        </div>
      
    </div>
</div>
   			  <!-- 내정보 끝 -->
         <div class="d-flex justify-content-center">
         <ul class="nav nav-underline offset">
            <li class="nav-item text-center" style="width: 170px">
              <a class="nav-link categoryBtn"  style="font-size: 25px; color: gray" data-bs-toggle="pill">
              	게시물 목록
              </a>
            </li>
         </ul>
         </div>
         
         <!-- 게시물 목록 -->
			<div class="tabcontent">
	    		<div class="row d-flex justify-content-center" id="jobSelectedCategory">
					<c:forEach var="s" items="${userStories}">
					
							<c:if test="${empty userStories}">
							<div class="row">
								<div class="col text-center">
								 	게시물이 존재하지 않습니다.
								</div>
							</div>
						</c:if>
						<c:if test="${not empty userStories}">
							<div class="col-3 m-4 rounded-4" style="background: #F3F3F3; width: 29%;">
							<!-- 데스크셋업 썸네일 -->
								<a href="storyDetail?storyNo=${s.storyNo}">
								<div class="row rounded-top-4" 
										style="height: 200px; background-size: cover; background-position: center; 
													background-image: url('resources/images/desk/${s.fileName}');">
								</div>
								</a>
								<!-- 제목 --> 
								<div class="row">
									<div class="col" style="font-weight: bold; margin-left: 2%; margin-top: 11%; font-size: 21px; font-weight: 800;">
										<a href="storyDetail?storyNo=${s.storyNo }" class="link-dark link-underline-opacity-0">${s.title}</a>
									</div>
								</div>
								<div class="row" style="width: 99%; border-bottom: 2px solid #bfbfbf; margin-left: 1%; margin-top: 20px;">
									<div class="col justify-content-center">
										
									</div>
								</div>
								<!-- 태그 -->
								<div class="row">
									<div class="col mt-3 mb-4" style="color:#5E5E5E; margin-left: 2%;">
										<c:forEach var="tag" items="${s.tags}" varStatus="loop">
									            #${tag.tagName} 
								        </c:forEach>
									</div>
								</div>
								<!-- 조회수, 좋아요 -->
								<div class="row">
									<div class="col py-3" id="main_story_category_area">
										&nbsp;<img src="resources/images/icon/name_tag_full.png" id="main_story_category_btn">&nbsp;${s.categoryName}
									</div>
									<div class="col text-end py-3" style="color:#5E5E5E; font-size: smaller;">
										<img src="resources/images/icon/eye_eyes_view_count.png" id="icon_count" style="width: 20px;">${s.readCount}&nbsp;&nbsp;
										<img src="resources/images/icon/heart.png" id="icon_heart" style="width: 20px;">${s.thank}
									</div>
								</div>
							</div>
						</c:if>
						  
					</c:forEach>
				</div>
	 		 </div>
      <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>