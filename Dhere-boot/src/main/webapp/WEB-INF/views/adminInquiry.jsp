<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<!-- content 영역 -->
	<div class="row justify-content-center">
			<c:forEach var="i" items="${inquiryList}">
				<div class="col-3 border border-3 m-3 p-3">
					<div class="row">
						<div class="col mt-5">
						<a href="inquiryDetail?inquiryNo=${i.inquiryNo}">${i.inquiryTitle}</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>	