<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="resources/js/findIdPass.js"></script>
	<!-- content 영역 -->
	<div class="row mb-3" style="margin-top: 100px">
        <div class="col text-center">
            <img src="resources/images/findPass.png">
        </div>
    </div>
	<div class="row">
		<div class="col mb-5 text-center" style="font-size: 30px; font-weight: bold;">
			비밀번호 찾기
		</div>
	</div>
	<div class="row mb-3" style="width: 600px; margin: 0 auto;">
		<div class="col rounded-3" style="border: 5px solid rgb(56, 96, 255)">
			<form class="my-5" name="findPassForm" id="findPassForm" action="findPassForm" method="post">
				<div class="row my-3">
					<div class="col-3 text-end">
						<label for="name" class="form-label" style="font-size: 20px; font-weight: bold">이름</label>
					</div>
					<div class="col">
						<input type="text" class="form-control rounded-3" name="name" id="name" style="border: 5px solid rgb(56, 96, 255); width: 250px">
					</div>
				</div>
				<div class="row">
					<div class="col-3 text-end">
						<label for="phone" class="form-label" style="font-size: 20px; font-weight: bold">휴대폰번호</label>
					</div>
					<div class="col">
						<input type="text" class="form-control rounded-3" name="phone" id="phone" style="border: 5px solid rgb(56, 96, 255); width: 250px">
					</div>
					<div class="col">
						<input type="button" class="btn rounded-3" id="" value="인증번호 발송" 
						style="border: 3px solid rgb(56, 96, 255); color: white; font-weight: bold; background: rgb(56, 96, 255)">
					</div>
				</div>
				<div class="row my-3">
					<div class="col-3 text-end">
						<label for="phone" class="form-label" style="font-size: 20px; font-weight: bold">인증번호</label>
					</div>
					<div class="col">
						<input type="text" class="form-control rounded-3" name="phone" id="phone" style="border: 5px solid rgb(56, 96, 255); width: 250px">
					</div>
					<div class="col">
						<input type="button" class="btn rounded-3" id="" value="확인" 
						style="border: 3px solid rgb(56, 96, 255); color: white; font-weight: bold; background: rgb(56, 96, 255); width: 90%">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="row" style="margin-bottom: 150px">
		<div class="col text-center">
			* 회원가입 시 인증 된 본인명의의 핸드폰 번호로만 조회가 가능합니다.<br>
			* 휴대폰 인증이 불가피한 경우에는 관리자에게 이메일(Dhere@kakao.com)을 주세요.
		</div>
	</div>