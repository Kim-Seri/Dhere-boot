<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<script src="resources/js/member.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/formcheck.js"></script>
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
	        <li class="nav-item"  style="width: 140px; font-size: 18px">
	            <a class="nav-link text-center" id="tab2-tab" data-bs-toggle="pill" href="#tab2" 
	            role="tab" aria-controls="tab2" aria-selected="false">회원정보수정</a>
	        </li>
	        <li class="nav-item"  style="width: 140px; font-size: 18px">
	            <a class="nav-link text-center" id="tab3-tab" data-bs-toggle="pill" href="#tab3" 
	            role="tab" aria-controls="tab3" aria-selected="false">1:1문의하기</a>
	        </li>
	        <li class="nav-item"  style="width: 140px; font-size: 18px">
	            <a class="nav-link text-center" id="tab4-tab" data-bs-toggle="pill" 
	            href='${ sessionScope.isLogin ? ".logout" : ".main" }'
	            role="tab" aria-controls="tab4" aria-selected="false">로그아웃</a>
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
	               	<img src="resources/upload/${param.picture}" alt="150*150 크기 이미지" 
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
                    (${param.email})
                    </div>
                    </div>
                    <div class="row">
                    <div class="col my-1" style="font-size: 25px; color: rgb(49, 108, 244)">
                    ${param.job}
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
			
			<!-- 게시물/스크랩/팔로잉 -->
              
         <div class="d-flex justify-content-center">
         <ul class="nav nav-underline offset">
            <li class="nav-item text-center" style="width: 170px">
              <a class="nav-link categoryBtn"  style="font-size: 25px; color: gray" data-bs-toggle="pill">게시물 목록</a>
            </li>
         </ul>
         <div class="row justify-content-center" id="categoryList">
         <c:forEach var="p" items="${pList}">
         <div class="col-3 m-3 p-1 rounded-4" style="width: 350px; height: 380px; background: #F3F3F3; cursor:pointer;" onclick="location.href='productDetail?productNo=${p.productNo}'">
            <div class="row">
                <div class="col d-flex justify-content-center align-items-center" style="height: 200px; overflow: hidden;">
                    <img src="resources/images/products/${p.productImage}" id="preview" class="img-fluid rounded-top-4" alt="${p.productImage}" style="width: 100%; height: 100%;">
                </div>
            </div>
   
            <div class="row">
               <div class="col p-3">
                  <div class="row">
                <div class="col d-flex justify-content  mb-3" style="overflow: hidden; font-size: 15px; color: #5E5E5E">
                   ${p.brandName}
               </div>
            </div>
            
            <div style="width: 100%; height: 2px; background-color: #5E5E5E"></div>
            
            <div class="row">
                <div class="col mt-3 d-flex justify-content" style="overflow: hidden; font-size: 23px">
                    <b>${p.productName}</b>
                </div>
            </div>
               </div>
            </div>
         </div>
         </c:forEach>
         </div>
         
         
	</div>
         <input type="button" value="morepage">
      <%@ include file="/WEB-INF/template/footer.jsp"%>
      <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
</body>
</html>