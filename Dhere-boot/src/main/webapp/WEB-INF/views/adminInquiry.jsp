<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<!-- content 영역 -->
	<div class="row justify-content-center">
	
	
	

	<c:choose>
    <c:when test="${sessionScope.member.role eq 'admin'}">
        <c:forEach var="i" items="${inquiryList}">
            <!-- 관리자에게 보여질 문의 목록 -->
            <div class="col-3 border border-3 m-3 p-3">
                <div class="row">
                    <div class="col mt-5">
                        문의 번호 : ${i.inquiryNo}
                        <br>
                        <br>
                        제목 : ${i.inquiryTitle}
                        <br>
                        <br>
                        작성자 : ${i.inquiryEmail}
                        <br>
                        <br>
                        작성일 : ${i.regDate}
                        <br>
                        <br>
                        <a href="inquiryDetail?inquiryNo=${i.inquiryNo}">바로가기</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <!-- 관리자가 아닌 사용자에게 보여질 메시지 -->
        모르겠다 너는 누구냐?
    </c:otherwise>
</c:choose>
    	
    	
	</div>	