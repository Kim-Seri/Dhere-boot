<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="com.springbootstudy.dhere.domain.Member"%>
 <%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="resources/css/scrap.css">
<link rel="stylesheet" href="resources/css/main.css">
<html xmlns:th="http://www.thymeleaf.org">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
<head>
<title>마이페이지</title>
	<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
	<script src="resources/js/main.js"></script>
	<script src="resources/js/member.js"></script>
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/formcheck.js"></script>
	<script src="resources/js/scrap.js"></script>
</head>
<body>



<div class="container">
	<div class="row">
		<div class="col">
	
	
	
			<div class="row text-center " id="scrap_menu_btn_area">
				<div class="col">
			    	<div class="row">
						<div class="col">
							<div class="scrap_menu_btn" id="scrap_menu_btn1" >
			          			<h3>회원정보</h3>
							</div>
						</div>
					<div class="col">
			        	<div class="scrap_menu_btn" id="scrap_menu_btn2"  
			        			onclick="location.href='/mypageUpdateProcess'">
			          		<h3>회원정보 수정</h3>
		        		</div>
					</div>
			      	<div class="col">
			        	<div class="scrap_menu_btn" id="scrap_menu_btn3"
			        			onclick="location.href='/inquiryWrite'">
							<h3>1:1 문의하기</h3>
						</div>
					</div>
						<div class="col">
							<div class="scrap_menu_btn" id="scrap_menu_btn4"
									onclick="location.href='/iList'">
								<h3>문의 목록</h3>
							</div>
						</div>
			    	</div>
				</div>
			</div>
			<div class="row" id="scrap_profile_area">
				<div class="col text-center" id="scrap_picture_area">
					<c:if test="${ empty sessionScope.member.picture }">
	                    <img src="resources/images/icon/86683729.png" id="scrap_picture">
	                 </c:if>
	                 <c:if test="${ not empty sessionScope.member.picture }">
	                    <img src="resources/images/profile/${sessionScope.member.picture}" id="scrap_picture">
	                 </c:if>
				</div>
				<div class="col">
					<div class="row">
						<div class="col" id="scrap_cinkname">
	                    	<h1>
	                    	<b>
	                   		${sessionScope.member.nickname}
	                    	</b>
	                    	</h1>
						</div>
						<div class="col text-start" id="scrap_email">
							<h1>
							(${sessionScope.member.email})
							</h1>
						</div>
					</div>
					<div class="row">
						<div class="col" id="scrap_job">
							<h4>
							<img src="resources/images/icon/name_tag_full.png" 
										id="scrap_job_icon">&nbsp;&nbsp;${sessionScope.member.job}
							</h4>
						</div>
					</div>
					<div class="row">
						<div class="col" id="scrap_heart">
							<h4>
							<img src="resources/images/icon/heart.png"  
										id="scrap_heart_icon">&nbsp;&nbsp;320
							</h4>
						</div>
					</div>
				</div>
			</div>
			<div class="row " id="scrap_list_btn_area">
				<div class="col">
					<ul class="nav nav-underline">
						<li class="nav-item text-center">
						    <h3>
					    	<b>
				    		<a class="nav-link active" id="scrap_li1">나의 게시물</a>
					    	</b>
						    </h3>
						</li>
						<li class="nav-item text-center">
							<h3>
							<b>
							<a class="nav-link scrapbtn" aria-current="page"  style="font-size: 25px; color: rgb(56, 96, 255); cursor: pointer" data-bs-toggle="pill">나의 스크랩</a>
							</b>
							</h3>
						</li>
						<li class="nav-item text-center">
							<h3>
							<b>
					    	<a class="nav-link" id="scrap_li3" >팔로우 목록</a>
					    	</b>
						    </h3>
						</li>
					</ul>
				</div>
			</div>
			<!-- 1번 버튼 누르면 -->
			<div id="myPostsContent" class="content-section">
   			<div class="tabcontent">
			<div class="tabcontent show active" id="myList">
		    		<div class="row d-flex justify-content-center" id="jobSelectedCategory">
						<c:forEach var="s" items="${sList}" varStatus="counter">
							<c:if test="${empty sList}">
								<div class="row">
									<div class="col text-center">
									 	게시물이 존재하지 않습니다.
									</div>
								</div>
							</c:if>
							<c:if test="${not empty sList}">
								<div class="col-3 m-4 rounded-4" style="background: #F3F3F3; width: 29%;">
								<!-- 데스크셋업 썸네일 -->
									<a href="storyDetail?storyNo=${s.storyNo}">
									<div class="row rounded-top-4" 
											style="height: 200px; background-size: cover; background-position: center; 
														background-image: url('resources/images/desk/${s.fileName}');">
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
																<a href='otherScrap?email=${s.email}
																				&nickname=${s.nickname}
																				&picture=${s.picture}
																				&categoryName=${s.categoryName}
																				&categoryName=${s.categoryName}'
																		class='text-decoration-none text-dark'>프로필 보러가기</a>
																<br>
															    <br>
															    <a href='scrap' class='text-decoration-none text-dark'>쪽지 보내기</a>
																<br>
															    <br>
															    <a href='scrap' class='text-decoration-none text-dark'>1:1 대화</a>
																<br>
															    <br>
															    <a href='scrap' class='text-decoration-none text-dark'>신고하기</a>">
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
		 		 <!-- 1번 버튼 누르면 -->
		 		 
		 		 

				</div>
			</div>
			
			
			
			<div id="myScrapsContent" class="content-section">
			    <!-- 나의 스크랩 내용 -->
			</div>
			<div id="followListContent" class="content-section">
			    <!-- 팔로우 목록 내용 -->
			</div>

	<!-- ----------------------------------------------------------------------------------------------------- -->		

	
												
													
		</div>
	</div>
</div>
</body>
</html>



