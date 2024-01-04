<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="resources/css/main.css">
 <script src="resources/js/main.js"></script>
<%@ page session="true" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<div class="container">
<div class="row">
	<div class="col">
	
		 <!-- 글쓰기 버튼 -->
		 <input type="button" class="btn btn-primary fixed-write-button" onclick="location.href='postWriteForm'" value="글쓰기" />
		 
		 <!-- 상단바 이동 버튼 -->
		 <a href="#" class="goToTopBtn">
		 	<img src="resources/images/icon/topbar.png" style="width: 35px;">
		 </a>
		 
		<!-- 마이페이지 -->
		<input type="button" class="btn btn-primary" onclick="location.href='scrap'" value="마이페이지" />
		
		<!-- 캐러셀 시작 -->
		<div class="row">
			<div class="col">
				<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner">
					  <div class="carousel-item active" data-bs-interval="10000">
					    <img src="resources/images/dhere_carousel.png" class="d-block w-100" alt="...">
					  </div>
					  <div class="carousel-item" data-bs-interval="2000">
					    <img src="resources/images/dhere_carousel.png" class="d-block w-100" alt="...">
					  </div>
					  <div class="carousel-item">
					    <img src="resources/images/dhere_carousel.png" class="d-block w-100" alt="...">
					  </div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					  <span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					  <span class="carousel-control-next-icon" aria-hidden="true"></span>
					  <span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
		<!-- 캐러셀 끝 -->

		<!-- 카테고리 -->
		<div class="row">
		<div class="col">
			
			
			<!-- 여기서 체크박스를 지우고, 라벨도 지우고, -->
			<div class="job-categories-container justify-content-center">
			    <c:forEach var="jList" items="${jList}" varStatus="status">
			    
			        <div class="jobs" data-category="${jList.categoryName}" style="cursor: pointer; position:relative; background-color: white;">
			        	
			        	<span >${jList.categoryName}</span>

			            <span class="close-btn" onclick="clearSelection(${status.index})"></span>
			        </div>
			    
			    </c:forEach>
			    
			</div>

				
		</div>
		</div>




		
		<!-- 검색창 -->
		<div class="row">
		<div class="col d-flex justify-content-center">
			<form class="row my-5 " action="#">
			<div class="col">
				<input type="text" placeholder=" &nbsp;#데스크셋업" class="border border-primary border-3 rounded-4 TagSearchBox"> &nbsp;&nbsp;
				<img src="resources/images/icon/search.png" style="width: 35px;">
			</div>
			</form>
		</div>
		</div>
		
		<!-- 게시글 타이틀, 정렬 -->
		<div class="row align-items-center">
		<div class="col-2" style="font-weight: bold; font-size: 2.0em;">
			 ⎸ 전체 게시글
		</div>
		<div class="col text-end">
			<select class="selectBox" onchange="">
				<option value="">최신순 정렬</option>
				<option value="">인기순 정렬</option>
			</select>
		</div>
		</div>

		<!-- 데스크셋업 리스트 -->
		<div class="row">
		<div class="col">
			
			<!-- 게시물 전체 -->
			<div class="row">
			<div class="col">
			
			<!-- 게시물 한칸 -->
			<div class="row d-flex justify-content-center" id="jobSelectedCategory">
			<c:forEach var="s" items="${sList}">
			
			<c:if test="${empty sList}">
				none
			</c:if>
			
			<c:if test="${not empty sList}">
			<div class="col-3 m-4 rounded-4" style="background: #F3F3F3; width: 29%;">
			
			
				<!-- 데스크셋업 썸네일 -->
				<a href="storyDetail?storyNo=${s.storyNo }">
					<div class="row rounded-top-4" style="height: 200px; background-size: cover; background-position: center; background-image: url('resources/images/desk/${s.fileName}');">
					<div class="col">				
					</div>
					</div>
				</a>
				
				<!-- 프로필, 닉네임, 날짜 -->
				<div class="row">
				<div class="col" style="color: #636363; margin-left: 2%; margin-top: 5%; font-weight: 700;">
					<img src="resources/images/profile/${s.picture}" 
							id="main_picture"
							tabindex="0" 
							data-bs-html="true" 
							data-bs-placement="bottom" 
							data-bs-toggle="popover" 
							data-bs-trigger="focus"
							data-bs-title="${s.nickname}"
							data-bs-content="
										<a href='otherScrap?email=${s.email}&nickname=${s.nickname}&picture=${s.picture}'class='text-decoration-none text-dark'>프로필 보러가기</a>
										<br>
									    <br>
									    <a href='scrap' class='text-decoration-none text-dark'>쪽지 보내기</a>
										<br>
									    <br>
									    <a href='scrap' class='text-decoration-none text-dark'>1:1 대화</a>
										<br>
									    <br>
									    <a href='scrap' class='text-decoration-none text-dark'>신고하기</a>
							">
					&nbsp;
					${s.nickname}
					
				</div>
				<div class="col text-end" style="color: #5E5E5E; margin-top: 2%;">
					<fmt:formatDate value="${s.regDate}" pattern="yyyy-MM-dd" var="formattedDate"/>
					${formattedDate}
				</div>
				</div>
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
						<img src="resources/images/icon/name_tag_full.png" id="main_story_category_btn">
						
							${s.categoryName}
					</div>
					<div class="col text-end py-3" style="color:#5E5E5E; font-size: smaller;">
						<img src="resources/images/icon/eye_eyes_view_count.png" id="icon_count" style="width: 20px;">
						${s.readCount} &nbsp;&nbsp;
						<img src="resources/images/icon/heart.png" id="icon_heart" style="width: 20px;">
						${s.thank}
					</div>
				</div>

			
			</div>
			</c:if>
			</c:forEach>
			</div>
			
			<div class="row">
			<div class="col text-center">
				<button id="moreBtn" onclick=""><span>더보기</span></button>
			</div>
			</div>
			
			</div>
			</div>
		
		
		
		</div>
		</div>
		

		
		<!-- 경진 -->
		<div class="row">
			<div class="col-3 offset-1 my-3">
				<h1 style="font-weight: bold">장비 리스트</h1>
			</div>
		</div>
		<ul class="nav nav-underline offset-1">
			<li class="nav-item text-center" style="width: 170px">
			  <a class="nav-link active categoryBtn" aria-current="page" style="font-size: 25px; color: black; cursor: pointer" data-bs-toggle="pill">All</a>
			</li>
			<li class="nav-item text-center" style="width: 170px">
			  <a class="nav-link categoryBtn"  style="font-size: 25px; color: black; cursor: pointer" data-bs-toggle="pill">Lap-top</a>
			</li>
			<li class="nav-item text-center" style="width: 170px">
			  <a class="nav-link categoryBtn"  style="font-size: 25px; color: black; cursor: pointer" data-bs-toggle="pill">Monitor</a>
			</li>
			<li class="nav-item text-center" style="width: 170px">
			  <a class="nav-link categoryBtn"  style="font-size: 25px; color: black; cursor: pointer" data-bs-toggle="pill">Mouse</a>
			</li>
			<li class="nav-item text-center" style="width: 170px">
			  <a class="nav-link categoryBtn"  style="font-size: 25px; color: black; cursor: pointer" data-bs-toggle="pill">Keyboard</a>
			</li>
			<li class="nav-item text-center" style="width: 170px">
			  <a class="nav-link categoryBtn"  style="font-size: 25px; color: black; cursor: pointer" data-bs-toggle="pill">Others</a>
			</li>
		</ul>
		<div class="row justify-content-center" id="categoryList">
		<c:forEach var="p" items="${pList}">
		<div class="col-3 m-3 p-1 rounded-4" style="width: 290px; height: 380px; background: #F3F3F3; cursor: pointer" onclick="location.href='productDetail?productNo=${p.productNo}'">
			<div class="row">
			    <div class="col d-flex justify-content-center align-items-center" style="height: 200px; overflow: hidden;">
			        <img src="resources/images/products/${p.productImage}" id="preview" class="img-fluid rounded-top-4" alt="${p.productImage}" style="width: 100%; height: 100%;">
			    </div>
			</div>

			<div class="row">
				<div class="col p-3">
					<div class="row">
					    <div class="col-10 offset-1 py-3" style="font-weight: bold; border-bottom: 2px solid #bfbfbf; color: #bfbfbf">
					        ${p.brandName}
					    </div>
					</div>	

			
			<div style="width: 100%; height: 2px; color: black"></div>
			
			
			
			
			<div class="row">
			    <div class="col-10 offset-1 mt-2" style="overflow: hidden; font-size: 23px">
			        <b>${p.productName}</b>
			    </div>
			</div>
			
			
				</div>
			</div>
		</div>
		</c:forEach>
		</div>
		
		
		
		

	</div>
</div>
	

</div>
</body>
</html>

	
