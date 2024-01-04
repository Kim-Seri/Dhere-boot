<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="resources/css/storyDetail.css">
<%@ page session="true" %>
<html>
<head>
    <title>Story Detail</title>
</head>
<body>
						
<div class="container">
	<div class="row">
		<div class="col">
		
		
		
					<input type="hidden" value="${sessionScope.member.email}">
					<!-- 직무 카테고리 시작 -->
					<div class="row" id="category_view_btn">
						<div class="col">
							<button type="button" class="btn btn-primary fs-5 fw-bolder">
							<img src="resources/images/icon/name_tag_white.png" 
								id="icon_tag_category_view_btn">&nbsp;&nbsp;${storyDetail.categoryName}
							</button>
						</div>
					</div>
					<!-- 직무 카테고리 끝 -->
					<!-- 제목 시작 -->
					<div class="row mt-3">
						<div class="col border-bottom border-primary">
							<h1 id="title">${storyDetail.title}</h1>
						</div>
					</div>
					<!-- 제목 끝 -->				
					<!-- 프로필 사진, 닉네임, 날짜, 조회수, 좋아요 시작 -->
					<div class="row mt-4">
						<!-- 프로필 사진 시작 -->
						<div class="col-1">
							<img src="resources/images/profile/${storyDetail.picture}" 
							id="profile"
							tabindex="0" 
							data-bs-html="true" 
							data-bs-placement="bottom" 
							data-bs-toggle="popover" 
							data-bs-trigger="focus"
							data-bs-title="${storyDetail.nickname}"
							data-bs-content="
							
							<a href='otherScrap?email=${storyDetail.email}&nickname=${storyDetail.nickname}&picture=${storyDetail.picture}&job=${storyDetail.categoryName}'class='text-decoration-none text-dark'>프로필 보러가기</a>
							<br>
						    <br>
						    <a href='scrap' class='text-decoration-none text-dark'>쪽지 보내기</a>
							<br>
						    <br>
						    <a href='scrap' class='text-decoration-none text-dark'>1:1 대화</a>
							<br>
						    <br>
						    <a href='scrap' class='text-decoration-none text-dark'>신고하기</a>
						    
						    " >
						</div>
						<!-- 프로필 사진 끝 -->
						<!-- 닉네임 시작 -->
						<div class="col-2 d-flex align-items-center ms-3" id="nickname">
							${ storyDetail.nickname }
						</div>
						<!-- 닉네임 끝 -->
						<!-- 날짜 시작 -->
						<div class="col-7 text-end" id="regDate">
							${ storyDetail.regDate }
						</div>
						<!-- 날짜 끝 -->
						<!-- 조회수, 좋아요 시작 -->
						<div class="col-2 text-end justify-content-end" id="count_num">
						<img src="resources/images/icon/eye_eyes_view_count.png" id="icon_count">
							${ storyDetail.readCount }
							<img src="resources/images/icon/heart.png" id="icon_heart">
							${ storyDetail.thank }
						</div>
						<!-- 좋아요 끝 -->
					</div>
					<!-- 팔로우, 스크랩 버튼 시작 -->
					<div class="row text text-end mb-5">
						<div class="col">
						
						
							<c:choose>
							    <c:when test="${storyDetail.email eq sessionScope.member.email}">
							    <button type="button" class="btn btn-outline-primary fs-5" id="updateBtn" 
							    		onclick="location.href='/dhere/updateStory?storyNo=${storyDetail.storyNo}'">
							            수정하기
							    </button>
							    </c:when>
							    <c:otherwise>
							        <button type="button" class="btn btn-outline-primary fs-5" id="followBtn">
							            팔로우
							        </button>
							    </c:otherwise>
							</c:choose>
							
							
							
							
							<c:choose>
							    <c:when test="${storyDetail.email eq sessionScope.member.email}">
							    <form action="deleteStory" method="post" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
							    	<input type="hidden" name="storyNo" value="${storyDetail.storyNo}" />
							        <button type="submit" class="btn btn-outline-primary fs-5" id="deleteBtn">
							            삭제하기
							        </button>
						        </form>
							    </c:when>
							    <c:otherwise>
							        <button type="button" class="btn btn-outline-primary fs-5" id="scrapBtn">
							            스크랩
							        </button>
							    </c:otherwise>
							</c:choose>

							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							</div>
					</div>
					<!-- 팔로우, 스크랩 버튼 끝 -->
	<!--################################## 사진 출력 영역 시작 ##################################-->
					 <c:forEach var="i" items="${iList}">
							<div class="row">
								<div class="col text text-center">
									<img src="resources/images/desk/${ i.fileName }" id="fileName">
								</div>
							</div>
			        </c:forEach>
	<!--################################## 사진 출력 영역 끝 ##################################-->
	<!--################################## content 영역 시작 ##################################-->
					<!-- content 1 시작 -->
					<div class="row">
						<div class="col">
						
							<div class="row" id="Q_text">
								<div class="col">
									Q. 당신의 데스크 셋업은 어떤 생각으로 구성했나요?
								</div>
							</div>
							<div class="row" id="A-text">
								<div class="col">
									${ storyDetail.content1 }
									<br>
									<br>
									${ storyDetail.content1 }
									${ storyDetail.content1 }
									${ storyDetail.content1 }
								</div>
							</div>
							
						</div>
					</div>
					<!-- content 1 끝 -->
					<!-- content 2 시작 -->
					<div class="row">
						<div class="col">
						
							<div class="row" id="Q_text">
								<div class="col">
									Q. 추천하는 기기는 무엇인가요?
								</div>
							</div>
							<div class="row" id="A-text">
								<div class="col">
									${ storyDetail.content2 }
									${ storyDetail.content2 }
									<br>
									<br>
									${ storyDetail.content2 }
									${ storyDetail.content2 }
								</div>
							</div>
							
						</div>
					</div>
					<!-- content 2 끝 -->
					<!-- content 3 시작 -->
					<div class="row">
						<div class="col">
						
							<div class="row" id="Q_text">
								<div class="col">
									Q. 추천하는 업무용 툴이나 기타 프로그램이 무엇인가요?
								</div>
							</div>
							<div class="row" id="A-text">
								<div class="col">
									${ storyDetail.content3 }
								</div>
							</div>
							
						</div>
					</div>
					<!-- content 3 끝 -->
					<!-- content 4 시작 -->
					<div class="row">
						<div class="col">
						
							<div class="row" id="Q_text">
								<div class="col">
									Q. 당신의 데스크 셋업에서 보완하고 싶은 부분이 있다면 무엇인가요?
								</div>
							</div>
							<div class="row" id="A-text">
								<div class="col">
									${ storyDetail.content4 }
								</div>
							</div>
							
						</div>
					</div>
					<!-- content 4 끝 -->
	<!--################################## content 영역 끝 ##################################-->				
	<!--############################# 공유, 하트, 신고 버튼 영역 시작 ############################-->
					<div class="row" id="share_heart_siren_btn">
						<div class="col text text-center">
							<button type="button" class="btn btn-outline-primary">
								<img src="resources/images/icon/shara_export.png" id="icon_share_btn">
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-primary fs-4">
								+<img src="resources/images/icon/heart.png" id="icon_heart_btn">
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-primary">
								<img src="resources/images/icon/siren_police.png" id="icon_siren_btn">
							</button>
						</div>
					</div>
	<!--############################# 공유, 하트, 신고 버튼 영역 끝 ############################-->
	<!--############################# 태그 출력 영역 시작 ############################-->
					<div class="row" id="tag">
					    <div class="col">
					        <img src="resources/images/icon/name_tag.png" id="icon_tag">
					            <c:forEach var="t" items="${tList}">
					                #${t.tagName}&nbsp;&nbsp;
					            </c:forEach>
					    </div>
					</div>
	<!--############################# 태그 출력 영역 끝 ############################-->
	<!--############################# 구분 선, products list 시작 ############################-->
					<div class="row">
						<div class="col" id="storyDetaile_products_area">
							<h1>사용 제품 목록</h1>
							<br>
							마커 찍은 제품 출력
							<img src="resources/images/test/stoeryDetail_test.png">
						</div>
					</div>
	<!--############################# 구분 선, products list 끝 ############################-->						
	<!--############################# 댓글 출력 영역 시작 ############################-->						
					<div class="row" id="storyDetail_reply_area">
						<div class="col-3">
							<div class="row">
								<div class="col text-center">
									<img src="" alt="다른 유저의 사진">
								</div>
							</div>
							<div class="row">
								<div class="col text-center">
									닉네임
								</div>
							</div>
						</div>
						<div class="col-8">
							<div class="row">
								<div class="col" id="storyDetail_reply_content">
									너무 유익한 내잉용입ㄴ디
									<br>
									앞으로도 자주 글 올려주세요!!!
									<br>
									좋아요 남기고 갈게요~~~ ㅎㅎ
									<br>
								</div>
							</div>
							<div class="row">
								<div class="col text-end" id="storyDetail_reply_regDate">
									2013-22-12 55:52
								</div>
							</div>
						</div>
						<div class="col-1">
							<img src="resources/images/icon/siren_police.png" id="storyDetail_reply_siren">
						</div>
					</div>
					<!--  -->
					<div class="row" id="storyDetail_reply_area">
						<div class="col-3">
							<div class="row">
								<div class="col text-center">
									<img src="" alt="다른 유저의 사진">
								</div>
							</div>
							<div class="row">
								<div class="col text-center">
									닉네임
								</div>
							</div>
						</div>
						<div class="col-8">
							<div class="row">
								<div class="col" id="storyDetail_reply_content">
									너무 유익한 내잉용입ㄴ디... 앞으로도 자주 글 올려주세요!!!
									<br>
									날씨가 많이 추워졌죠?? 항상 따뜻하게 입고 다니세요 ㅜㅠㅜ 감기 걸리지 마셔요 ㅠㅜㅠㅜㅠ
									<br>
								</div>
							</div>
							<div class="row">
								<div class="col text-end" id="storyDetail_reply_regDate">
									2013-22-12 55:52
								</div>
							</div>
						</div>
						<div class="col-1">
							<img src="resources/images/icon/siren_police.png" id="storyDetail_reply_siren">
						</div>
					</div>
	<!--############################# 댓글 출력 영역 끝 ############################-->						
	<!--############################# 댓글 작성 영역 끝 ############################-->		
					<form class="row" id="storyDetail_reply_write_area">
						<div class="col-3">
							<div class="row">
								<div class="col text-center">
									<img src="resources/images/profile/${ storyDetail.picture }" id="profile">
								</div>
							</div>
							<div class="row">
								<div class="col text-center" id="nickname">
									${ storyDetail.nickname }
								</div>
							</div>
						</div>
						<div class="col-7 text-center">
							<textarea rows="4" cols="40" id="storyDetail_reply_write_content">test</textarea>
						</div>
						<div class="col-2 text-center text-bottom">
							<input type="submit">
						</div>
					</form>
	<!--############################# 댓글 작성 영역 끝 ############################-->				
		</div>
	</div>
</div>


</body>
</html>