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


<div class="row my-4 container" id="global-content">
	<div class="offset-3 col-6">
		<form action="mypageUpdateResult" name="mypageUpdateResult" id="mypageUpdateResult" method="post" enctype="multipart/form-data">
		<div class="row m-3">
			<div class="col fs-1 text-center text-white" style="font-weight: bold" >
				update
			</div>
		</div>
			
			<div class="row">
				<div class="col m-3 rounded-4">	
					<div class="row mt-5 mb-2">
						<div class="col-md-6 offset-md-3 text-center">
							<c:if test="${ empty sessionScope.member.picture }">
	                   			 <img src="resources/images/icon/86683729.png" id="scrap_picture" style="color:white; width:150px; height:150px; object-fit: cover; border-radius: 70%; border: 3px solid white">
	                		</c:if>
							<c:if test="${ not empty sessionScope.member.picture }">						
							<img id="preview" class="img-fluid"  alt="프로필 사진" 
							src="resources/images/profile/${sessionScope.member.picture}" style="color:white; width:150px; height:150px; object-fit: cover; border-radius: 70%; border: 3px solid white">
							</c:if>
						</div>
					</div>
					<div class="row mb-3 justify-content-center">
						<div class="col-4 mt-3">
						<input type="button" class="btn border-white" value="프로필 사진 변경" id="profilePhoto" onclick="document.getElementById('input-file').click();" 
						style="width: 110%; height: 45px; color: white; border-radius: 10px;"/>
							<input type="file" id="input-file" name="picture1" onchange="readURL(this);" style="display:none" />
						</div>
					</div>
					<div class="row my-4">
						<div class="col-8 offset-2">
							<label for="email" class="form-label" style="color: white; font-size: 25px; font-weight: bold">&nbsp;&nbsp;이메일</label>
							<div class="row">
								<div class="col-8">
									<input type="text" class="form-control border border-white border-3" name="email" id="email" placeholder="example@example.com" 
									style="width: 110%; background: white; border-radius: 10px; color: black;" value="${sessionScope.member.email}" readonly>
									<label id="label1"></label>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-4">
						<div class="col-6 offset-2">
							<label for="pass" class="form-label" 
							style="color: white; font-size: 25px; font-weight: bold">&nbsp;&nbsp;새 비밀번호 </label>
							<input type="password" class="form-control border border-white border-3" name="newPass1" id="newPass1" oninput=passCheck() style="width: 97%; background: white; border-radius: 10px; color: black;">
						</div>
					</div>
					<div class="row">
						<div class="col-8 offset-2">
							<label for="pass2" class="form-label" style="color: white; font-size: 25px; font-weight: bold">&nbsp;&nbsp;새 비밀번호 확인</label>
							<div class="row">
								<div class="col-8">
									<input type="password" class="form-control border border-white border-3" name="newPass2" id="newPass2" style="width: 110%; background: white; border-radius: 10px; color: black;">
									<label id="newPassLabel"></label>
								</div>
								<div class="col-4 text-end">
									<input type="button" class="btn border-white" id="newPassBtn" value="확인" style="width: 75%; height: 45px; color: white; border-radius: 10px;">
								</div>
							</div>
						</div>
					</div>
					<div class="row my-4">
						<div class="col-8 offset-2">
							<label for="name" class="form-label" style="color: white; font-size: 25px; font-weight: bold">&nbsp;&nbsp;이름 </label>
							<input type="text" class="form-control border border-white border-3" name="name" id="name" 
							style="background: white; border-radius: 10px; color: black;" value="${sessionScope.member.name}">
						</div>
					</div>
					<div class="row my-4">
						<div class="col-8 offset-2">
							<label for="nickname" class="form-label" style="color: white; font-size: 25px; font-weight: bold">&nbsp;&nbsp;닉네임 </label>
							<input type="text" class="form-control border border-white border-3" name="nickname" id="nickname" 
							style="background: white; border-radius: 10px; color: black;" value="${sessionScope.member.nickname}">
						</div>
					</div>
					<div class="row mt-4">
						<div class="col-7 offset-2">
							<label for="zipcode" class="form-label" style="color: white; font-size: 25px; font-weight: bold">&nbsp;&nbsp;주소 </label>
							<div class="row">
								<div class="col-8">
									<input type="text" class="form-control border border-white border-3" name="zipcode" id="zipcode" maxlength="5" 
									style="background: white; border-radius: 10px; color: black;" value="${sessionScope.member.zipcode}" readonly>
								</div>
								<div class="col-3">
									<input type="button" class="btn border-white" id="btnZipcode" value="우편번호 검색" 
									style="width: 220%; height: 45px; color: white; border-radius: 10px;">
								</div>
							</div>
						</div>
					</div>
					<div class="row my-2">
						<div class="col-8 offset-2">
							<!-- <label for="address1" class="form-label">Address </label> -->
							<input type="text" class="form-control border border-white border-3" name="address1" id="address1" 
							style="background: white; border-radius: 10px; color: black;" value="${sessionScope.member.address1}" readonly>
						</div>
					</div>
					<div class="row my-2">
						<div class="col-8 offset-2">
							<!-- <label for="address2" class="form-label">Detail Address </label> -->
							<input type="text" class="form-control border border-white border-3" name="address2" id="address2" 
							style="background: white; border-radius: 10px; color: black;" value="${sessionScope.member.address2}" >
						</div>
					</div>
					<div class="row my-4">
						<div class="col-8 offset-2">
							<label for="job" class="form-label" style="color: white; font-size: 25px; font-weight: bold">&nbsp;&nbsp;직업 </label>
							<div class="row">
								<div class="col">
							<select name="job" class="form-select"> 
									<option value="${ sessionScope.member.job }">직업을 선택하세요</option>
									<option value="관리자" ${sessionScope.member.job == "CEO" ? "selected" : ""}>관리자</option>
									<option value="개발자" ${sessionScope.member.job == "programmer" ? "selected" : ""}>개발자</option>
									<option value="PM" ${sessionScope.member.job == "PM" ? "selected" : ""}>PM</option>
									<option value="디자이너" ${sessionScope.member.job == "designer" ? "selected" : ""}>디자이너</option>
									<option value="보안전문가" ${sessionScope.member.job == "security_specialist" ? "selected" : ""}>보안전문가</option>
									<option value="연구원" ${sessionScope.member.job == "researcher" ? "selected" : ""}>연구원</option>
									<option value="금융전문가" ${sessionScope.member.job == "financial_specialist" ? "selected" : ""}>금융전문가</option>
									<option value="작가" ${sessionScope.member.job == "writer" ? "selected" : ""}>작가</option>
									<option value="회계사" ${sessionScope.member.job == "accounter" ? "selected" : ""}>회계사</option>
									<option value="데이터분석가" ${sessionScope.member.job == "dataResearcher" ? "selected" : ""}>데이터분석가</option>
									<option value="마케터" ${sessionScope.member.job == "marketer" ? "selected" : "" }>마케터</option>
									<option value="건축가" ${sessionScope.member.job == "architect" ? "selected" : "" }>건축가</option>
									<option value="교육자" ${sessionScope.member.job == "teacher" ? "selected" : "" }>교육자</option>
									<option value="프로듀서" ${sessionScope.member.job == "PD" ? "selected" : "" }>프로듀서</option>
							</select>
								</div>
							</div>
						</div>
					</div>
					<div class="row my-4">
						<div class="col-8 offset-2">
							<label for="phone" class="form-label" style="color: white; font-size: 25px; font-weight: bold">&nbsp;&nbsp;연락처 </label> 
							<div class="row">
								<div class="col">
									<input type="text" class="form-control border border-white border-3" name="phone" id="phone" maxlength="20" placeholder="010-0000-0000" 
									style="background: white; border-radius: 10px; color: black;" value="${sessionScope.member.phone}">
								</div>
							</div>
						</div>
					</div>
					<div class="row justify-content-center" style="margin-top: 100px;">
						<div class="col-4"> 
							<input type="submit" value="update" class="btn border border-white border-3" style="background: white; width: 100px; height: 55px; border-radius: 15px;">&nbsp;&nbsp;
						</div>
						<div class="col-4 text-end"> 
							<input type="button" value="Back" class="btn border border-3" style="border-radius: 15px; width: 100px; height: 55px; color: white" onclick="location.href='scrap'">
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>