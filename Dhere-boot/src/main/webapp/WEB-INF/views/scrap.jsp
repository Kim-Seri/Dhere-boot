<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="resources/css/scrap.css">
<html xmlns:th="http://www.thymeleaf.org">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width">
   <head>
         <title>마이페이지</title>
<link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="resources/js/member.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/formcheck.js"></script>

   </head>
<body>
	<!-- 전체 컨테이너 시작 -->
<div class="container mt-5">
	 <!-- 탑 메뉴버튼 -->
 	 <div class="d-flex justify-content-center" id="myInfo">
	    <ul class="nav nav-pills text-center">
	        <li class="nav-item"  style="width: 140px; font-size: 18px">
	            <a class="nav-link active text-center" id="tab1-tab" data-bs-toggle="pill" href="#tab1" 
	            role="tab" aria-controls="tab1" aria-selected="true">회원정보</a>
	        </li>
	        <li class="nav-item"  style="width: 140px; font-size: 18px">
	            <a class="nav-link text-center" id="tab2-tab" data-bs-toggle="pill" href="#tab2" 
	       	   onclick="location.href='mypageUpdate'"
	            role="tab" aria-controls="tab2" aria-selected="false">회원정보수정</a>
	        </li>
	        <li class="nav-item"  style="width: 140px; font-size: 18px">
	            <a class="nav-link text-center" id="tab3-tab" data-bs-toggle="pill" href="#tab3" 
	            role="tab" aria-controls="tab3" aria-selected="false">1:1문의하기</a>
	        </li>
	        <li class="nav-item"  style="width: 140px; font-size: 18px">
	            <a class="nav-link text-center" id="logoutButton" href="logout" role="button">
	            로그아웃</a>
	        </li>	
	        </ul>
	    </div>
	<!-- 내용 -->
    
    <!-- 탑 메뉴 끝 -->
    <!-- 컨텐츠 내용 시작 -->
    <div class="row tab-content">
        <div class="col tab-pane fade show active d-flex justify-content-center" id="tab1" role="tabpanel" aria-labelledby="tab1-tab">
            <div class="row" style="width:700px; height: 300px; border:10px solid rgb(49, 108, 244); border-radius: 20px">
            <div class="col my-5" style="margin-left: 80px">
            <div class="row">
                <div class="col-4">
                    <c:if test="${ empty sessionScope.member.picture }">
                    <img src="resources/images/icon/86683729.png" id="defaultPicture"
                     style="width: 150px; height: 150px; object-fit: cover; border-radius: 70%; border: 3px solid blue" />
                    </c:if>
                    <c:if test="${ not empty sessionScope.member.picture }">
                        <div class="col">
                        <img src="resources/upload/${sessionScope.member.picture}" alt="150*150 크기 이미지" 
                        style="width: 150px; height: 150px; object-fit: cover; border-radius: 70%; border: 3px solid blue"></div>
                    </c:if>           
                </div>
           <!-- 글자컨텐츠 -->
           <div class="col-8">
                <!-- 닉네임 -->
                <div class="row">
                <div class="col" style="font-size: 35px; color: rgb(49, 108, 244); font-weight: bold">
                    ${sessionScope.member.nickname}
                </div>
                </div>
                <!-- 이메일 -->
                <div class="row">
                <div class="col" style="font-size: 25px; color: rgb(49, 108, 244)">
                    (${sessionScope.member.email})
                </div>
                </div>
                <!-- 직업 -->
                <div class="row">
                <div class="col my-1" style="font-size: 25px; color: rgb(49, 108, 244)">
                    ${sessionScope.member.job}
                </div>
                </div>
                <!-- 하트 시작 -->
                <div class="row">
                <div class="col my-1" style="color: rgb(49, 108, 244)">
                    <img src="resources/images/icon/heart.png" style="width: 30px; height: 30px"> 개
                </div>
               	</div>
                <!-- 하트 끝 -->
          		 </div>
                <!-- 글자컨텐츠 끝 -->
                </div>
                </div>
  	            </div>
      			</div>
 <!-- 개인정보 수정하기 폼 -->
		<div class="col tab-pane fade show active d-flex justify-content-center" id="tab2" role="tabpanel" aria-labelledby="tab2-tab">
            <div class="row" style="width:700px; height: 300px; border:10px solid rgb(49, 108, 244); border-radius: 20px">
            <div class="col my-5" style="margin-left: 80px">
           
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
							<input type="password" class="form-control border border-3" name="Pass" id="Pass1" 
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
        </div>
 <!-- 1:1상담하기 -->
        <div class="col tab-pane fade show active d-flex justify-content-center" id="tab3" role="tabpanel" aria-labelledby="tab3-tab">
            <div class="row" style="width:700px; height: 300px; border:10px solid rgb(49, 108, 244); border-radius: 20px">
            <div class="col my-5" style="margin-left: 80px">
           상담해조!! 이야기 해조!!
	        </div>
	        </div>
        </div>
        
 <!-- 탑 컨텐츠 정리태그 -->
    </div>

   			  <!-- 내정보 끝 -->
			
			<!-- 게시물/스크랩/팔로잉 -->
              
         <div class="d-flex justify-content-center" id="scraping">
         <ul class="nav nav-underline offset">
            <li class="nav-item text-center" style="width: 170px">
              <a class="nav-link categoryBtn"  style="font-size: 25px; color: gray" data-bs-toggle="pill">나의 게시물</a>
            </li>
            <li class="nav-item text-center" style="width: 170px">
              <a class="nav-link categoryBtn"  
              style="font-size: 25px; color: gray" data-bs-toggle="pill">나의 스크랩</a>
            </li>
            <li class="nav-item text-center" style="width: 170px">
              <a class="nav-link categoryBtn"  style="font-size: 25px; color: gray" data-bs-toggle="pill">팔로잉 목록</a>
            </li>
         </ul>
         <div class="row justify-content-center" id="categoryList">
         <c:forEach var="p" items="${pList}">
         <div class="col-3 m-3 p-1 rounded-4" style="width: 350px; height: 380px; background: #F3F3F3; cursor:pointer;" onclick="location.href='productDetail?productNo=${p.productNo}'">
            <div class="row">
                <div class="col d-flex justify-content-center align-items-center" style="height: 200px; overflow: hidden;">
                    <img src="resources/images/products/${p.productImage}" id="preview" class="img-fluid rounded-top-4" alt="${p.productImage}" style="width: 100%; height: 100%;">
                </div>
            </div>
   
            <div class="row">
               <div class="col p-3">
                  <div class="row">
                <div class="col d-flex justify-content  mb-3" style="overflow: hidden; font-size: 15px; color: #5E5E5E">
                   ${p.brandName}
               </div>
            </div>
            
            <div style="width: 100%; height: 2px; background-color: #5E5E5E"></div>
            
            <div class="row">
                <div class="col mt-3 d-flex justify-content" style="overflow: hidden; font-size: 23px">
                    <b>${p.productName}</b>
                </div>
            </div>
               </div>
            </div>
         </div>
         </c:forEach>
         </div>
         
         
	</div>
	<!-- 전체 컨테이너 끝 -->
         <input type="button" value="morepage">
      <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
      </div>
</body>
</html>