<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script src="resources/js/formcheck.js"></script>  
<input type="hidden" id="inquiryNo" value="${inquiry.inquiryNo}">
	<!-- content 영역 -->
	<div class="row my-5" id="global-content">		
		<div class="offset-1 col-10">
			<div class="row">
				<div class="col">
					<h2 class="fs-3 fw-bold text-center">상세보기(${inquiry.regDate})</h2>
				</div>
			</div>
			<form name="inquiryWrite" id="inquiryWrite" action="inquiryWriteForm"
				class="row g-3" method="post" enctype="multipart/form-data">
				   <%-- <div class="col-5 offset-1">
				    <label for="inquiryEmail" class="form-label">글쓴이</label>
				    <input type="text" class="form-control" name="inquiryEmail" id="inquiryEmail" value="${sessionScope.member.email}" readonly>
				  </div> --%>
				  <div class="col-10 offset-1">
				    <label for="inquiryTitle" class="form-label">제 목</label>
				    <input type="text" class="form-control" name="inquiryTitle" id="inquiryTitle" value="${inquiry.inquiryTitle}" readonly>
				  </div>
				  <div class="col-10 offset-1">
				    <label for="inquiryContent" class="form-label">내 용</label>
				    <textarea name="inquiryContent" id="inquiryContent" class="form-control" rows="10" readonly>${inquiry.inquiryContent}</textarea>
				  </div>
				  <div class="col-3">
					<img src="resources/images/inquiry/${inquiry.inquiryFile}" style="max-width: 200%; height: auto;">
				  </div>
				  <c:if test="${sessionScope.member.role eq 'admin'}">
				 	 <input type="button" class="btn btn-primary" value="답변하기" onclick="location.href='answerWrite?no=${inquiry.inquiryNo}'">
				 	 <input type="button" class="btn btn-warning" value="삭제하기" id="deleteInquiry">
				  </c:if>
			</form>
			
			<c:forEach var="answer" items="${answerList}">
			    <div class="col-10 offset-1">
			        <label for="answerContent" class="form-label">답변 내용</label>
			        <textarea name="answerContent" id="answerContent" class="form-control" rows="5" readonly>${answer.answerContent}</textarea>
			    </div>
			</c:forEach>


			
		</div>
	</div>		