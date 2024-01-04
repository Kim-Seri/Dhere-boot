<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="resources/css/login.css">
<style>
#ballon {
margin: 100px 0 10px 0;
}
</style>
<div class="row align-items-center h-100">
	<div class="col">
				<form name="checkForm" id="checkForm" method="post" >
					<input type="hidden" name="email" id="eamil" value="${ member.email }" />
					<input type="hidden" class="form-control rounded" name="rPass" id="rPass" />
				</form>
				<div class="row mx-5">
					<div class="col-8 text-center" id="ballon">
						<div class="position-relative py-2 px-4 text-bg-secondary 
						border border-secondary rounded-pill">
  							개인정보 보호를 위해 비밀번호를 입력해주세요
  							<svg width="1em" height="1em" viewBox="0 0 16 16" 
  							class="position-absolute top-100 start-50 translate-middle mt-1" 
  							fill="var(--bs-secondary)" xmlns="http://www.w3.org/2000/svg">
  							<path d="M7.247 11.14L2.451 5.658C1.885 5.013 2.345 4 3.204 
  							4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
  							</svg>
						</div>
					</div>
				</div>
				<div class="row">
				<div class="col text-center" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Tooltip on top">
                    <c:if test="${ empty sessionScope.member.picture }"><!-- 귀여운그림 -->
                    <img src="resources/images/icon/86683729.png" alt="150*150" style="width:150px; height:150px; object-fit: cover; border-radius: 70%; border: 3px solid blue" />
                    </c:if>
                    <c:if test="${ not empty sessionScope.member.picture }">
                        <div class="col center">
                        <img src="resources/upload/${sessionScope.member.picture}" alt="150*150 크기 이미지" 
                        style="width: 150px; height: 150px; object-fit: cover; border-radius: 70%; border: 3px solid blue"></div>
                    </c:if>           
                </div>
                </div>
			<div class="row" >
				<div class="col-4 mx-auto my-3" >
				
					<input type="hidden" name="email" id="email" value="${ sessionScope.member.pass }" />
					<input type="password" class="form-control rounded" name="pass10" id="pass10" 
					size="10" />
				</div>
				</div>
				<div class="row">
				<div class="col text-center">
					<input type="button" id="btnPassCheck" value="확인">
				</div>
				</div>
			</div>
		
	</div>

