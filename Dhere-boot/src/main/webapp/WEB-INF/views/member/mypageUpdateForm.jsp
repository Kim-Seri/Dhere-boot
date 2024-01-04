<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="resources/css/joinForm.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/member.js"></script>
<style>
	body {
		background-image: url('resources/images/join_background.png');
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;
	}
</style>


<div class="row my-5 container" id="global-content">
	<div class="offset-3 col-6">
		<form action="mypageUpdateResult" name="mypageUpdateForm" id="mypageUpdateForm" method="post" enctype="multipart/form-data">
		<div class="row m-3">
			<div class="col fs-1 text-center text-white" style="font-weight: bold">
				Update
			</div>
		</div>
			<input type="hidden" name="isIdCheck" id="isIdCheck" value="false">
			<div class="row">
				<div class="col m-3 rounded-4">	
					<div class="row mt-5 mb-2">
						<div class="col-md-6 offset-md-3 text-center">
							<img id="preview" class="img-fluid" alt="프로필 사진" style="color:white; max-width: 300px; max-height: 300px; object-fit: cover;">
						</div>
					</div>
					<div class="row mb-3 justify-content-center">
						<div class="col-4">
							<input type="file" class="form-control form-control-sm border border-1" id="picture" name="picture1" onchange="readURL(this);">
						</div>
					</div>

			        
					<div class="row my-3">
						<div class="col-8 offset-2">
							<label for="email" class="form-label" style="color:white">이메일 </label>
							<div class="row">
								<div class="col-8">
									<input type="text" class="form-control border border-3" name="email" id="email" 
									value="${sessionScope.member.email}" readonly
									placeholder="example@example.com" style="background: transparent; border-radius: 15px; color: white;">
									<label id="label1"></label>
								</div>
								<div class="col-4">
									<input type="button" class="btn" id="btnOverlapEmail" value="확인" style="width: 65%; height: 45px; background: white; border-radius: 15px;">
								</div>
							</div>
						</div>
					</div>
					<div class="row my-3">
						<div class="col-6 offset-2">
							<label for="pass" class="form-label" style="color:white">비밀번호 </label>
							<input type="password" class="form-control border border-3" name="oldPass" id="oldPass1" 
							style="background: transparent; border-radius: 15px; color: white;">
						</div>
					</div>
					<div class="row">
						<div class="col-8 offset-2">
							<label for="pass2" class="form-label" style="color:white">비밀번호 확인 </label>
							<div class="row">
								<div class="col-8">
									<input type="password" class="form-control border border-3" name="pass2" id="pass2" 
									style="background: transparent; border-radius: 15px; color: white;">
								</div>
								<div class="col-4">
									<input type="button" class="btn" id="btnOverlapPass" value="확인" style="width: 65%; height: 45px; background: white; border-radius: 15px;">
								</div>
							</div>
						</div>
					</div>
					<div class="row mt-5 mb-3">
						<div class="col-8 offset-2">
							<label for="name" class="form-label" style="color:white">이름 </label>
							<input type="text" class="form-control border border-3" name="name" id="name" 
							value="${ sessionScope.member.name}"
							style="background: transparent; border-radius: 15px; color: white;">
						</div>
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<label for="nickname" class="form-label" style="color:white">닉네임 </label>
							<input type="text" class="form-control border border-3" name="nickname" id="nickname" 
							style="background: transparent; border-radius: 15px; color: white;" >
						</div>
					</div>
					<div class="row my-3">
						<div class="col-7 offset-2">
							<label for="zipcode" class="form-label" style="color:white">주소 </label>
							<div class="row">
								<div class="col-8">
									<input type="text" class="form-control border border-3" name="zipcode" id="zipcode" 
									maxlength="5" style="background: transparent; border-radius: 15px; color: white;" readonly 
									value="${sessionScope.member.zipcode}">
								</div>
								<div class="col-3">
									<input type="button" class="btn" id="btnZipcode" value="우편번호 검색" 
									style="width: 220%; height: 45px; background: white; border-radius: 15px;">
								</div>
							</div>
						</div>
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<!-- <label for="address1" class="form-label">Address </label> -->
							<input type="text" class="form-control border border-3" name="address1" id="address1" 
							style="background: transparent; border-radius: 15px; color: white;" readonly
							value="${sessionScope.member.address1}">
						</div>
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<!-- <label for="address2" class="form-label">Detail Address </label> -->
							<input type="text" class="form-control border border-3" name="address2" id="address2" 
							style="background: transparent; border-radius: 15px; color: white;"
							value="${ sessionScope.member.address2 }">
						</div>
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<label for="job" class="form-label" style="color:white">직업 </label>
							<div class="row">
								<div class="col">
									<input type="text" class="form-control border border-3" name="job" id="job" placeholder="개발자" style="background: transparent; border-radius: 15px; color: white;">
								</div>
							</div>
						</div>
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<label for="phone" class="form-label" style="color:white">연락처 </label> 
							<div class="row">
								<div class="col">
									<input type="text" class="form-control border border-3" name="phone" id="phone" 
									maxlength="20" placeholder="010-0000-0000" 
									value="${ sessionScope.member.phone }
									style="background: transparent; border-radius: 15px; color: white;">
								</div>
							</div>
						</div>
					</div>
					<div class="row my-5">
						<div class="col-8 offset-2 text-center"> 
							<input type="submit" value="수정하기" class="btn border border-3 border-white" style="background: white; width: 25%; border-radius: 15px;">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>