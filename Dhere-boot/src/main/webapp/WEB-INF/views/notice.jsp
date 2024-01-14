<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<div class ="row text-center">
<div class="col">
	
	
			<div class="row bg-danger">
				<div class="col">
					<input class="btn btn-primary" type="button" id="noticeWrite" value="공지쓰기" onclick="location.href='noticeWrite'"/>
					
				</div>
			</div>
			
			<div class="row bg-info">
				<div class="col">
					<form name="noticeForm" id="noticeForm" action="#" method="post">
					<c:forEach var="n" items="${ noticeList }">
						<div class="row">
							<div class="col">
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
						<div class="row">
							<div class="col">
								${ n.content }
			 					<input class="btn btn-primary" type="submit" id="noticeUpdate" name="noticeUpdate" value="공지수정" />					
			 					<input class="btn btn-primary" type="submit" id="noticeDelete" name="noticeDelete" value="공지삭제" />	 									
							</div>				
						</div>				
					</c:forEach>
					</form>
				</div>
			</div>
					
			
</div>
</div>