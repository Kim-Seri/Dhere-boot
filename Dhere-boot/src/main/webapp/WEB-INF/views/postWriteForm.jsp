<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link href="resources/css/postWrite.css" rel="stylesheet">
<script src="resources/js/postWrite.js"></script>


<div class="row p-5 my-5 border border-primary rounded-4 border-3">
	<div class="col">
		<form action="postWrite" method="post" id="postWriteForm"
			name="postWriteForm" enctype="multipart/form-data">
			<div class="row ">
				<div class="col text-start">
					<h3 class="text-secondary">직종 선택</h3>
				</div>
			</div>

			<div class="row">
                <div class="col-6 offset-3 text-center">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                            <c:forEach var="jList" items="${jList}">
                                <div class="swiper-slide">
                                    <input type="checkbox" class="btn-check" name="category" id="category${jList.categoryNo}" value="${jList.categoryNo}">
                                    <label class="btn btn-outline-primary" for="category${jList.categoryNo}">${jList.categoryName}</label>
                                </div>
                            </c:forEach>
                        </div>
                        <!-- 이전/다음 버튼 -->
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                    </div>
                </div>
            </div>
            
            

			<div class="row my-5">
				<div class="col text-center ">
					<input type="text"
						class="form-control form-control-lg border-0 border-bottom"
						name="title" placeholder="제목을 입력하세요" id="postTitle"
						name="postTitle" style="height: 100px">
				</div>
			</div>
			
			<div class="my-5">
				<div class="col">
					<div class="row my-3">
						<div class="col">
							<h3 class="text-primary">Q. 태그 입력</h3>
						</div>

					</div>
					<div class="row">
						<div class="col-3 text-center ">
							<input type="text" class="form-control border-0 border-bottom"
								id="hashtag" onkeyup="enterkey()" placeholder="태그를 입력하세요"
								name="tagName">
						</div>
						<div class="col">
							<input type="button" class="btn btn-primary" id="hashtageAdd"
								onclick="addHashtag()" value="태그추가">
						</div>
					</div>
					<!-- 추가한 해시 태그 리스트 -->
					<div class="row hashtagList" id="hashtagList"></div>
				</div>
			</div>

			<div class="row ">
				<div class="col text-start">
					<h3 class="text-secondary">사진 등록</h3>
				</div>
			</div>

			<div class="row">
				<div class="col" id="imageContainer" >
					
				</div>
			</div>
			<div class="row my-5">
				<div class="col text-center">
					<button type="button" class="btn btn-outline-primary"
						id="addImageButton">+사진 추가</button>
				</div>
			</div>
			<div class="row my-5">
				<div class="col">
					<div class="row my-3">
						<div class="col">
							<h3 class="text-primary fw-bold">Q. 당신의 데스크셋업은 어떤 생각으로
								구성했나요?</h3>
						</div>
					</div>
					<div class="row">
						<div class="col text-center fw-bold">
							<textarea class="form-control fs-4 " placeholder="내용을 입력하세요"
								name="content1" id="floatingTextarea2" style="height: 400px"></textarea>
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
							<textarea class="form-control fs-4 " placeholder="내용을 입력하세요"
								name="content2" id="floatingTextarea2" style="height: 300px"></textarea>
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
							<textarea class="form-control fs-4 " placeholder="내용을 입력하세요"
								name="content3" id="floatingTextarea2" style="height: 200px"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="row my-5">
				<div class="col">
					<div class="row my-3">
						<div class="col">
							<h3 class="text-primary">Q. 당신의 데스크셋업에서 보완하고 싶은 부분이 있다면
								무엇인가요?</h3>
						</div>
					</div>
					<div class="row">
						<div class="col text-center ">
							<textarea class="form-control fs-4 " placeholder="내용을 입력하세요"
								name="content4" id="floatingTextarea2" style="height: 200px"></textarea>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row my-5">
				<div class="col text-center ">
					<input type="submit" class="btn btn-outline-primary" value="작성하기"
						id="btnWrite"> &nbsp;&nbsp; <input type="button"
						class="btn btn-outline-primary" value="뒤로가기"
						onclick="location.href='main'">

				</div>
			</div>

		</form>
	</div>
</div>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 4, // 한 화면에 보여질 슬라이드 개수
        spaceBetween: 10, // 슬라이드 간의 간격
        slidesPerGroup: 1, // 그룹 당 슬라이드 개수
        loop: true, // 무한 루프
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    });
});
</script>