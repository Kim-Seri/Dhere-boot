<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row justify-content-center">
    <div class="row">
        <div class="col my-5">
            <h2 style="font-weight: bold">문의 내역</h2>
        </div>
    </div>
    <div class="row">
     <c:choose>
        <c:when test="${empty iList}">
            <div class="col">
                <p style="font-size: 20px; color: gray;">문의 내역이 없습니다.</p>
            </div>
        </c:when>
        <c:otherwise>
        <c:forEach var="i" items="${iList}">
            <div class="col-3 border border-3 m-3 p-3 rounded-3 border-primary" style="width: 320px; height: 220px">
            <input type="hidden" value="${i.inquiryNo}">
                <div class="row">
                    <div class="col" style="font-size: 25px; font-weight: bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis">
                        ${i.inquiryTitle}
                    </div>
                    <div class="col">
                        ${i.regDate}
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-3">
                        ${sessionScope.member.nickname}
                    </div>
                </div>
                <c:choose>
                    <c:when test="${not empty i.answerList}">
                        <p style="color: blue">답변 완료!!</p>
                    </c:when>
                    <c:otherwise>
                        <p style="color: red">답변 대기중...</p>
                    </c:otherwise>
                </c:choose>
                <div class="row">
                	<div class="col mt-3 text-center">
                		<input type="button" class="btn btn-primary" value="바로 가기" onclick="location.href='inquiryDetail?inquiryNo=${i.inquiryNo}'" style="width: 250px">
               		</div>
                </div>
            </div>
        </c:forEach>
        </c:otherwise>
    </c:choose>
    </div>
</div>