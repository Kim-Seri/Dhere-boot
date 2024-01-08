<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="resources/css/storyDetail.css">
<link rel="stylesheet" href="resources/css/main.css">
<%@ page session="true" %>
<%@ page import="com.springbootstudy.dhere.domain.Member"%>
<script src="resources/js/storyDetail.js"></script>
<% 
    Member member = (Member)session.getAttribute("member");
    boolean isLoggedIn = member != null;
%>
<html>
<head>
    <title>Story Detail</title>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col">
				
				 <!-- 상단바 이동 버튼 -->
				 <a href="#" class="goToTopBtn">
				 	<img src="resources/images/icon/topbar.png" style="width: 35px;">
				 </a>
		
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
							<fmt:formatDate value="${storyDetail.regDate}" pattern="yyyy년 MM월 dd일" var="formattedAAA"/>
							<fmt:formatDate value="${storyDetail.regDate}" pattern="HH시 mm분 ss초" var="formattedBBB"/>
							${formattedAAA}
							<br>
							${formattedBBB}
						</div>
						<!-- 날짜 끝 -->
						<!-- 조회수, 좋아요 시작 -->
						<div class="col-2 text-end justify-content-end" id="count_num">
						    <img src="resources/images/icon/eye_eyes_view_count.png" id="icon_count">
						    ${storyDetail.readCount}
						    <img src="resources/images/icon/heart.png" id="icon_heart">
						    <span class="likes-count">${storyDetail.thank}</span>
						</div>
						<!-- 좋아요 끝 -->
					</div>
					<!-- 팔로우, 스크랩 버튼 시작 -->
					<div class="row text text-end mb-5">
						<div class="col">
							<c:choose>
							    <c:when test="${storyDetail.email eq sessionScope.member.email}">
							    <button type="button" class="btn btn-outline-primary fs-5" id="updateBtn" 
							    		onclick="location.href='/updateStory?storyNo=${storyDetail.storyNo}'">
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
							<button type="button" class="btn btn-outline-primary" id="icon_siren_btn2">
								<img src="resources/images/icon/shara_export.png" id="icon_share_btn">
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-primary fs-4 increaseThankBtn" data-story-id="${storyDetail.storyNo}">
							    +<img src="resources/images/icon/heart.png" id="icon_heart_btn">
							    <span class="likes-count">${storyDetail.thank}</span>
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-primary" id="icon_siren_btn1">
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
					<c:choose>
					    <c:when test="${not empty rList}">
					        <c:forEach items="${rList}" var="r">
						        <fmt:formatDate value="${r.replyDate}" pattern="yyyy년 MM월 dd일" var="formattedDate"/>
						        <fmt:formatDate value="${r.replyDate}" pattern="HH시 mm분 ss초" var="formattedTime"/>
								<div class="row mb-5" id="storyDetail_reply_area">
									<div class="col-3">
										<div class="row">
											<div class="col text-center">
												<img src="resources/images/profile/${r.picture}" 
												id="replyOtherUserPicture"
												tabindex="0" 
												data-bs-html="true" 
												data-bs-placement="left" 
												data-bs-toggle="popover" 
												data-bs-trigger="focus"
												data-bs-title="${r.nickname}"
												data-bs-content="
												<a href='otherScrap?email=${r.email}&nickname=${r.nickname}&picture=${r.picture}&categoryName=${storyDetail.categoryName}'class='text-decoration-none text-dark'>프로필 보러가기</a>
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
										</div>
										<div class="row">
											<div class="col text-center">
												${r.nickname}
											</div>
										</div>
									</div>
									<div class="col-8">
										<div class="row">
											<div class="col" id="storyDetail_reply_content">
												${r.replyContent}
											</div>
										</div>
										<div class="row">
											<div class="col text-end" id="storyDetail_reply_regDate">
												${formattedDate}<br>${formattedTime}
											</div>
										</div>
									</div>
									<div class="col-1">
									<c:choose>
									    <c:when test="${sessionScope.member.email eq 'admin' or r.email eq sessionScope.member.email}">
											<img src="resources/images/icon/cancel.png" id="storyDetail_reply_delete"
														onclick="deleteReply(${r.replyNo})" style="cursor: pointer;">
										</c:when>
								    	<c:otherwise>
								    		<img src="resources/images/icon/siren_police.png" id="storyDetail_reply_siren" >
									    </c:otherwise>
									</c:choose>
									</div>
								</div>
					        </c:forEach>
					    </c:when>
					    <c:otherwise>
					        <h1 class="text-center mb-5">
					        	등록 된 댓글이 없습니다.
					        </h1>
					    </c:otherwise>
					</c:choose>
	<!--############################# 댓글 출력 영역 끝 ############################-->						
	<!--############################# 댓글 작성 영역 시작 ############################-->		
					<form class="row" action="replyWrite" method="post" id="storyDetail_reply_write_area">
					<input type="hidden" name="storyNo" value="${storyDetail.storyNo}">
						<div class="col-3">
							<div class="row">
								<div class="col text-center" >
									<c:choose>
									    <c:when test="${not empty sessionScope.member.email}">
											<img src="resources/images/profile/${sessionScope.member.picture}" id="profile">
										</c:when>
								    	<c:otherwise>
									    </c:otherwise>
									</c:choose>
								</div>
							</div>
							<div class="row">
								<div class="col text-center" id="nickname">
									${sessionScope.member.nickname}
								</div>
							</div>
						</div>
						<div class="col-7 text-center">
						
						<c:choose>
						    <c:when test="${not empty sessionScope.member.email}">
								<textarea rows="4" cols="40" name="replyContent" 
											id="storyDetail_reply_write_content" 
											placeholder="무분별한 욕설/비방은 제재 대상이므로 삭제 및 이용정지 대상이 될 수 있습니다."></textarea>
							</c:when>
					    	<c:otherwise>
					    		<textarea rows="4" cols="40" name="replyContent" 
											id="storyDetail_reply_write_content" 
											class="text-center"
											placeholder="댓글 기능은 회원만 이용 가능합니다."></textarea>
						    </c:otherwise>
						</c:choose>
						</div>
						<div class="col-2 text-center text-bottom">
						<c:if test="${not empty sessionScope.member}">
						        <input type="submit" class="btn btn-warning" value="댓글 작성">
						    </c:if>
						</div>
					</form>
	<!--############################# 댓글 작성 영역 끝 ############################-->				
		</div>
	</div>
</div>
<div id="bottomOfPage"></div>











<!-- 좋아요 클릭 시 실시간 증가시키기 -->
<script>
$(document).ready(function() {
    $('.increaseThankBtn').click(function() {
        var storyId = $(this).data('story-id'); // 게시물 ID를 가져옵니다.

        console.log("storyId 값 : ", storyId); // 수정된 부분
        
        $.ajax({
            url: 'increaseThank', // 서버의 URL로 요청을 보냅니다.
            type: 'POST',
            data: { storyNo: storyId },
            success: function(response) {
                // 성공적으로 좋아요가 반영되었다면 페이지의 모든 좋아요 수를 업데이트합니다.
                $('.likes-count').text(response.likes);
            },
            error: function(xhr, status, error) {
                // 오류 처리
                console.log("Error: ", error); // 오류 메시지를 더 명확하게 출력하도록 수정
            }
        });
    });
});
</script>

<!-- 댓글 삭제 시 실시간 삭제하기 -->
<script>
// 댓글 삭제 함수
function deleteReply(replyNo) {
    if (!confirm('댓글을 삭제하시겠습니까?')) return;
    
    $.ajax({
        url: '/deleteReply',
        type: 'POST',
        data: { 'replyNo': replyNo },
        success: function(response) {
            // 삭제 성공 후 페이지 새로고침 또는 목록 업데이트
            location.reload();
        },
        error: function(xhr, status, error) {
            // 오류 처리
            alert('댓글 삭제에 실패했습니다.');
        }
    });
}
</script>
<script>
    // 로그인 상태를 JavaScript 변수로 설정
    var isLoggedIn = <%= isLoggedIn %>;

    document.addEventListener("DOMContentLoaded", function() {
        // 버튼의 ID로 각 버튼을 가져옵니다.
        var iconSirenBtn1 = document.getElementById('icon_siren_btn1');
        var iconSirenBtn2 = document.getElementById('icon_siren_btn2');

        // 각 버튼에 대한 클릭 이벤트 리스너를 설정합니다.
        var buttons = [iconSirenBtn1, iconSirenBtn2];
        buttons.forEach(function(button) {
            if (button) {
                button.onclick = function() {
                    if (!isLoggedIn) {
                        alert('로그인을 먼저 진행해주세요');
                        window.location.href = 'loginForm'; // 로그인 페이지로 이동
                    } else {
                        // 로그인 상태일 때 확인창을 띄웁니다.
                        if (confirm('해당 댓글을 신고하시겠습니까?')) {
                            window.location.href = 'inquiryWrite'; // 문의 작성 페이지로 이동
                        }
                        // '취소'를 누르면 아무 일도 일어나지 않습니다.
                    }
                };
            }
        });
    });
</script>





<script>
$(document).ready(function() {
    // 페이지 로드 시 팔로우 상태 확인
    checkFollowStatus();

    $('#followBtn').click(function() {
        var $this = $(this); // 버튼을 jQuery 객체로 저장
        var followingEmail = '작성자 이메일'; // 작성자 이메일을 여기에 설정

        $.ajax({
            url: '/follow-toggle', // 팔로우 상태를 토글하는 서버의 URL
            type: 'POST',
            data: {
                following_email: followingEmail
            },
            success: function(response) {
                if (response.isFollowing) {
                    $this.addClass('btn-danger').removeClass('btn-outline-primary').text('언팔로우');
                } else {
                    $this.removeClass('btn-danger').addClass('btn-outline-primary').text('팔로우');
                }
            },
            error: function(xhr, status, error) {
                alert('오류가 발생했습니다.');
            }
        });
    });
});

function checkFollowStatus() {
    var followingEmail = '작성자 이메일'; // 작성자 이메일을 여기에 설정
    $.ajax({
        url: '/check-follow', // 팔로우 상태를 확인하는 서버의 URL
        type: 'GET',
        data: {
            following_email: followingEmail
        },
        success: function(response) {
            if (response.isFollowing) {
                $('#followBtn').addClass('btn-danger').removeClass('btn-outline-primary').text('언팔로우');
            }
        }
    });
}

</script>










</body>
</html>















