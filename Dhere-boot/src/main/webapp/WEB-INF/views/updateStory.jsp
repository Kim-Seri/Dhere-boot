<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link href="resources/css/postWrite.css" rel="stylesheet">
<script src="resources/js/postWrite.js"></script>



<c:choose>
	<c:when test="${story.email eq sessionScope.member.email}">
	
		<div class="row p-5 my-5 border border-primary rounded-4 border-3">
			<div class="col">
				<form action="updateStoryProcess" method="post" id="postWriteForm"
					name="postWriteForm" enctype="multipart/form-data">
					
					<input type="hidden" name="storyNo" value="${story.storyNo}">
					
					
					${story.email}
					${story.fileName}
					
					
					
					
					
					
					
		            <div class="row my-5">
						<div class="col">
							<h3 class="text-primary fw-bold">제목</h3>
							<input type="text" 
									class="form-control form-control-lg" 
									name="title" 
									value="${story.title}" 
									id="postTitle" 
									style="height: 100px; border: 1px solid #4370FF;">
						</div>
					</div>
					<div class="row my-5">
						<div class="col">
							<div class="row my-3">
								<div class="col">
									<h3 class="text-primary fw-bold">Q. 당신의 데스크셋업은 어떤 생각으로 구성했나요?</h3>
								</div>
							</div>
							<div class="row">
								<div class="col text-center fw-bold">
									<textarea class="form-control fs-4" name="content1" id="floatingTextarea2" 
												style="height: 400px; border: 1px solid #4370FF;">${story.content1}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-5">
						<div class="col">
							<div class="row my-3">
								<div class="col">
									<h3 class="text-primary">Q. 추천하는 기기는 무엇인가요?</h3>
								</div>
							</div>
							<div class="row">
								<div class="col text-center ">
									<textarea class="form-control fs-4" name="content2" id="floatingTextarea2" 
												style="height: 300px; border: 1px solid #4370FF;">${story.content2}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-5">
						<div class="col">
							<div class="row my-3">
								<div class="col">
									<h3 class="text-primary">Q. 추천하는 업무용 툴이나 기타 프로그램이 무엇인가요?</h3>
								</div>
							</div>
							<div class="row">
								<div class="col text-center ">
									<textarea class="form-control fs-4" name="content3" id="floatingTextarea2" 
												style="height: 200px; border: 1px solid #4370FF;">${story.content3}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-5">
						<div class="col">
							<div class="row my-3">
								<div class="col">
									<h3 class="text-primary">Q. 당신의 데스크셋업에서 보완하고 싶은 부분이 있다면 무엇인가요?</h3>
								</div>
							</div>
							<div class="row">
								<div class="col text-center ">
									<textarea class="form-control fs-4" name="content4" id="floatingTextarea2" 
												style="height: 200px; border: 1px solid #4370FF;">${story.content4}</textarea>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row my-5">
						<div class="col text-center ">
							<input type="submit" class="btn btn-primary" value="수정 완료" id="btnWrite">
						</div>
					</div>
				</form>
			</div>
		</div>
</c:when>
<c:otherwise>
   로그인이 되어있지 않다면, 접근이 불가합니다.
</c:otherwise>
</c:choose>
	
	
	




	
	

	    	
	    