<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
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
                <input type="hidden" id="formattedDateInput" value="${formattedDate}" />
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
									    <fmt:formatDate value="${n.regDate}" pattern="yyyy-MM-dd" var="formattedDate"/>
										${formattedDate}
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
document.addEventListener('DOMContentLoaded', function() {
    loadLatestNotice();
    addClickEventsToButtons();
});

function loadLatestNotice() {
    var xhr = new XMLHttpRequest();
    xhr.onload = function() {
        if (xhr.status === 200) {
            var notice = JSON.parse(xhr.responseText);
            displayNotice(notice);
            setActiveButton(notice.noticeNo);
        } else {
            console.error('Failed to load the latest notice');
        }
    };
    xhr.open('GET', '/notice/latest', true);
    xhr.send();
}

function setActiveButton(noticeNo) {
    var buttons = document.querySelectorAll('.noticeBtn');
    buttons.forEach(function(btn) {
        btn.classList.remove('active');
        if (btn.getAttribute('data-notice-no') === noticeNo.toString()) {
            btn.classList.add('active');
        }
    });
}


function displayNotice(notice) {
    var titleElement = document.querySelector('.noticeTitle');
    var contentElement = document.querySelector('.noticeContent');
    var dateElement = document.querySelector('.noticeRegDate');
    
    // 요소들의 투명도를 0으로 설정하여 숨김
    titleElement.style.opacity = 0;
    contentElement.style.opacity = 0;
    dateElement.style.opacity = 0;

    // 내용 업데이트
    setTimeout(function() {
        titleElement.innerHTML = '<img src="resources/images/icon/megaphone.png" style="width: 40px; height: 40px; margin-right: 20px;">' + notice.title;
        contentElement.textContent = notice.content;
        dateElement.textContent = notice.regDate;

        // 투명도를 1로 설정하여 서서히 나타나게 함
        titleElement.style.opacity = 1;
        contentElement.style.opacity = 1;
        dateElement.style.opacity = 1;
        
        // "수정하기" 버튼에 이벤트 지정
        var updateBtn = document.getElementById('noticeUpdateBtn');
        updateBtn.onclick = function() {
            location.href = 'noticeUpdateForm?noticeNo=' + notice.noticeNo;
        };

        // "삭제하기" 버튼에 이벤트 지정
        var deleteButton = document.getElementById('deleteButton');
        deleteButton.setAttribute('data-notice-no', notice.noticeNo);
        deleteButton.onclick = function() {
            deleteNotice(notice.noticeNo);
        };
    }, 200);
}


function addClickEventsToButtons() {
    document.querySelectorAll('.noticeBtn').forEach(function(button) {
        button.addEventListener('click', function() {
            var noticeNo = this.getAttribute('data-notice-no');
            fetchNotice(noticeNo);
            setActiveButton(noticeNo);
        });
    });
}

function fetchNotice(noticeNo) {
    var xhr = new XMLHttpRequest();
    xhr.onload = function() {
        if (xhr.status === 200) {
            displayNotice(JSON.parse(xhr.responseText));
        }
    };
    xhr.open('GET', '/notice/' + noticeNo, true);
    xhr.send();
}

function deleteNotice(noticeNo) {
    if (confirm('해당 공지를 삭제하시겠습니까?')) {
        var xhr = new XMLHttpRequest();
        xhr.onload = function() {
            if (xhr.status === 200 || xhr.status === 204) {
                alert('공지가 삭제되었습니다.');
                window.location.reload();
            } else {
                console.error('Failed to delete notice: ' + xhr.status);
                alert('공지 삭제에 실패했습니다.');
            }
        };
        xhr.open('POST', '/noticeDelete', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send('noticeNo=' + encodeURIComponent(noticeNo));
    }
}
</script>




