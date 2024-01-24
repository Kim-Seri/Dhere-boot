<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="resources/css/notice.css">

<!-- 테스트 출력 -->
<%-- <c:forEach var="n" items="${noticeList}">
    제목 : ${n.noticeNo}<br>
    제목 : ${n.title}<br>
    내용 : ${n.content}<br>
    작성일자 : ${n.regDate}<br>
    <br><br><br><br>
</c:forEach> --%>
<!-- 테스트 출력 -->

<div class="row">
    <div class="col">
        
        
        <div class="row" id="notice_mainBox1">
            <div class="col">
                
                    <div class="row" id="notice_mainBox2">
                        <div class="col-3 text-center" id="notice_btnBox">
                        <c:forEach var="n" items="${noticeList}">
                            <button class="noticeBtn ps-3 pe-3" data-notice-no="${n.noticeNo}">
                                <div class="row">
                                    <div class="col">
                                        <div class="text-start" id="noticeBtn_content">${n.title}</div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-4 text-start">
                                    </div>
                                    <div class="col-8 text-end noticeBtn_regDate">
									    ${n.regDate}
									</div>
                                </div>
                            </button>
                            </c:forEach>
                        </div>
                        <div class="col-8 ms-5" style="overflow-y: auto;">
                            <div class="row">
                                <div class="col-8 noticeTitle" id="notice_detail_title">
                                </div>
                                <div class="col-4 noticeRegDate" id="notice_detail_regDate">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-10 noticeContent" id="notice_detail_content">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col text-end">
                            <c:choose>
							    <c:when test="${sessionScope.member.email eq 'admin'}">
									<button class="btn btn-primary" onclick="location.href='noticeWriteForm'">작성하기</button>
									<button class="btn btn-success" id="noticeUpdateBtn">수정하기</button>
									<input type="button" id="deleteButton" class="btn btn-danger" data-notice-no="" value="삭제하기">
		                            <button class="btn btn-warning" onclick="location.href='main'">돌아가기</button>
								</c:when>
						    	<c:otherwise>
						    		<button class="btn btn-outline-primary" onclick="location.href='main'">돌아가기</button>
							    </c:otherwise>
							</c:choose>
                        </div>
                    </div>
                
            </div>
        </div>
    

    </div>
</div>



									






<script>
//문서의 모든 DOM 컨텐츠가 로드되었을 때 실행될 함수들을 설정합니다.
document.addEventListener('DOMContentLoaded', function() {
    // 가장 최근 공지사항을 로드하는 함수를 호출합니다.
    loadLatestNotice();
    // 모든 공지사항 버튼에 클릭 이벤트 리스너를 추가하는 함수를 호출합니다.
    addClickEventsToButtons();
});

// 서버로부터 최신 공지사항을 가져오는 함수입니다.
function loadLatestNotice() {
    // XMLHttpRequest 객체를 생성합니다.
    var xhr = new XMLHttpRequest();
    // 요청이 완료되었을 때 실행될 함수를 설정합니다.
    xhr.onload = function() {
        // 요청이 성공적으로 이루어졌는지 확인합니다.
        if (xhr.status === 200) {
            // 서버로부터 받은 데이터(JSON 문자열)를 객체로 변환합니다.
            var notice = JSON.parse(xhr.responseText);
            // 공지사항을 화면에 표시하는 함수를 호출합니다.
            displayNotice(notice);
            // 해당 공지사항 버튼을 활성화 상태로 만드는 함수를 호출합니다.
            setActiveButton(notice.noticeNo);
        } else {
            // 요청이 실패했을 경우 콘솔에 에러 메시지를 출력합니다.
            console.error('Failed to load the latest notice');
        }
    };
    // 서버의 '/notice/latest' 엔드포인트로 HTTP GET 요청을 비동기적으로 설정합니다.
    xhr.open('GET', '/notice/latest', true);
    // 요청을 전송합니다.
    xhr.send();
}

// 현재 활성화된 공지사항 버튼을 시각적으로 표시하는 함수입니다.
function setActiveButton(noticeNo) {
    // 모든 공지사항 버튼을 가져옵니다.
    var buttons = document.querySelectorAll('.noticeBtn');
    // 각 버튼에 대해 반복하여 처리합니다.
    buttons.forEach(function(btn) {
        // 'active' 클래스를 모든 버튼에서 제거합니다.
        btn.classList.remove('active');
        // 클릭된 버튼의 data-notice-no 속성 값이 현재 noticeNo와 일치하는지 확인합니다.
        if (btn.getAttribute('data-notice-no') === noticeNo.toString()) {
            // 일치한다면 해당 버튼에 'active' 클래스를 추가합니다.
            btn.classList.add('active');
        }
    });
}

// 서버로부터 받은 공지사항 데이터를 화면에 표시하는 함수입니다.
function displayNotice(notice) {
    // 제목, 내용, 등록일을 표시할 DOM 요소를 선택합니다.
    var titleElement = document.querySelector('.noticeTitle');
    var contentElement = document.querySelector('.noticeContent');
    var dateElement = document.querySelector('.noticeRegDate');
    
    // 선택한 요소들의 투명도를 0으로 설정하여 숨김 처리합니다.
    titleElement.style.opacity = 0;
    contentElement.style.opacity = 0;
    dateElement.style.opacity = 0;

    // setTimeout을 사용하여 일정 시간 후에 코드를 실행합니다.
    setTimeout(function() {
        // 제목 요소의 내부 HTML을 설정합니다. 이미지와 공지사항 제목을 포함합니다.
        titleElement.innerHTML = '<img src="resources/images/icon/megaphone.png" style="width: 40px; height: 40px; margin-right: 20px;">' + notice.title;
        // 내용과 등록일을 텍스트로 설정합니다.
        contentElement.textContent = notice.content;
        dateElement.textContent = notice.regDate;

        // 투명도를 1로 설정하여 요소들을 서서히 나타나게 합니다.
        titleElement.style.opacity = 1;
        contentElement.style.opacity = 1;
        dateElement.style.opacity = 1;
        
        // "수정하기" 버튼에 클릭 이벤트를 설정합니다.
        var updateBtn = document.getElementById('noticeUpdateBtn');
        updateBtn.onclick = function() {
            // 수정 페이지로 이동합니다. URL에 noticeNo 쿼리 파라미터를 포함합니다.
            location.href = 'noticeUpdateForm?noticeNo=' + notice.noticeNo;
        };

        // "삭제하기" 버튼에 클릭 이벤트를 설정합니다.
        var deleteButton = document.getElementById('deleteButton');
        deleteButton.setAttribute('data-notice-no', notice.noticeNo);
        deleteButton.onclick = function() {
            // 삭제 함수를 호출하며 noticeNo를 인자로 전달합니다.
            deleteNotice(notice.noticeNo);
        };
    }, 200); // 200ms 후에 함수를 실행합니다.
}

// 모든 공지사항 버튼에 클릭 이벤트 리스너를 추가하는 함수입니다.
function addClickEventsToButtons() {
    // 공지사항 버튼을 선택합니다.
    document.querySelectorAll('.noticeBtn').forEach(function(button) {
        // 클릭 이벤트 리스너를 추가합니다.
        button.addEventListener('click', function() {
            // 버튼의 data-notice-no 속성 값을 가져옵니다.
            var noticeNo = this.getAttribute('data-notice-no');
            // 해당 공지사항의 상세 정보를 가져오는 함수를 호출합니다.
            fetchNotice(noticeNo);
            // 해당 버튼을 활성화 상태로 만듭니다.
            setActiveButton(noticeNo);
        });
    });
}

// 특정 공지사항의 상세 정보를 서버로부터 가져오는 함수입니다.
function fetchNotice(noticeNo) {
    // XMLHttpRequest 객체를 생성합니다.
    var xhr = new XMLHttpRequest();
    // 요청이 완료되었을 때 실행될 함수를 설정합니다.
    xhr.onload = function() {
        // 요청이 성공적으로 이루어졌는지 확인합니다.
        if (xhr.status === 200) {
            // 서버로부터 받은 데이터(JSON 문자열)를 객체로 변환하고,
            // 공지사항을 화면에 표시하는 함수에 전달합니다.
            displayNotice(JSON.parse(xhr.responseText));
        }
    };
    // 서버의 '/notice/' + noticeNo 엔드포인트로 HTTP GET 요청을 비동기적으로 설정합니다.
    xhr.open('GET', '/notice/' + noticeNo, true);
    // 요청을 전송합니다.
    xhr.send();
}

// 서버에 공지사항 삭제를 요청하는 함수입니다.
function deleteNotice(noticeNo) {
    // 사용자에게 삭제 확인을 요청합니다.
    if (confirm('해당 공지를 삭제하시겠습니까?')) {
        // XMLHttpRequest 객체를 생성합니다.
        var xhr = new XMLHttpRequest();
        // 요청이 완료되었을 때 실행될 함수를 설정합니다.
        xhr.onload = function() {
            // 요청이 성공적으로 이루어졌는지 확인합니다.
            if (xhr.status === 200 || xhr.status === 204) {
                // 성공 메시지를 알립니다.
                alert('공지가 삭제되었습니다.');
                // 페이지를 새로고침합니다.
                window.location.reload();
            } else {
                // 요청이 실패했을 경우 콘솔과 사용자에게 에러 메시지를 출력합니다.
                console.error('Failed to delete notice: ' + xhr.status);
                alert('공지 삭제에 실패했습니다.');
            }
        };
        // 서버의 '/noticeDelete' 엔드포인트로 HTTP POST 요청을 비동기적으로 설정합니다.
        xhr.open('POST', '/noticeDelete', true);
        // POST 요청에 적절한 헤더를 설정합니다.
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        // 요청을 전송합니다. noticeNo를 인코딩하여 전달합니다.
        xhr.send('noticeNo=' + encodeURIComponent(noticeNo));
    }
}
</script>
</script>




