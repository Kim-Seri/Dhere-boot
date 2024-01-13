<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class ="row text-center">
<div class="col">
	<form name="noticeForm" id="noticeForm" action="#">
	
	
			<div class="row bg-danger">
				<div class="col">
					<input class="btn btn-primary" type="button" id="noticeWrite" value="공지쓰기" onclick="location.href='noticeWrite'"/>
				</div>
			</div>
			
			<div class="row bg-info">
				<div class="col">
					<c:forEach var="n" items="${ noticeList }">
					<div class="row">
						<div class="col">
							<input type="hidden" mame="noticeNo" id="noticeNo" value="${ n.noticeNo }">
						</div>
					</div>
					<div class="row">
						<div class="col">
					${ n.title }
						</div>
					</div>
					<div class="row">
						<div class="col">
					${ n.regDate }
						</div>
					</div>
				<div class="col">
					
					
					${ n.content }
					<input class="btn btn-primary" type="button" id="noticeUpdate" value="공지수정" onclick="location.href='noticeUpdate'"/>					
					<input class="btn btn-primary" type="button" id="noticeDelete" value="공지삭제" onclick="location.href='noticeDelete'"/>										
						
				</div>				
					</c:forEach>
				</div>
			</div>
					
			
			
	</form>
</div>
</div>