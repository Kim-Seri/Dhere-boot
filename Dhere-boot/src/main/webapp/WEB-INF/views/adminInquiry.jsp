 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<!-- content 영역 -->
	<div class="row justify-content-center">
		<div class="row">
	        <div class="col my-5">
	            <h2 style="font-weight: bold">문의 내역</h2>
	        </div>
	    </div>
	    <div class="row">
        <c:forEach var="i" items="${inquiryList}">
            <div class="col-3 border border-3 m-3 p-3 rounded-3 border-primary" style="width: 320px; height: 200px">
                <div class="row">
                    <div class="col" style="font-size: 25px; font-weight: bold; white-space: nowrap; overflow: hidden; text-overflow: ellipsis">
                        ${i.inquiryTitle}
                    </div>
                    <div class="col text-end">
                        ${i.regDate}
                    </div>
                </div>
                <div class="row">
                    <div class="col mb-3">
                        ${i.inquiryEmail}
                    </div>
                </div>
                <div class="row">
                	<div class="col mt-3 text-center">
                		<input type="button" class="btn btn-primary" value="바로 가기" onclick="location.href='inquiryDetail?inquiryNo=${i.inquiryNo}'" style="width: 250px">
               		</div>
                </div>
            </div>
		</c:forEach>
		</div>
	</div>	