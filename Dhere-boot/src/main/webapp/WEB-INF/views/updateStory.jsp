<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<link href="resources/css/postUpdate.css" rel="stylesheet">
<script src="resources/js/postUpdate.js"></script>



<c:choose>
	<c:when test="${story.email eq sessionScope.member.email}">

		<div class="row p-5 my-5 border border-primary rounded-4 border-3">
			<div class="col">
				<form action="updateStoryProcess" method="post" id="postWriteForm"
					name="postWriteForm" enctype="multipart/form-data">

					<input type="hidden" name="storyNo" id="storyNo"
						value="${story.storyNo}">

					<div class="row ">
						<div class="col text-start">
							<h3 class="text-secondary">직종 선택</h3>
						</div>
					</div>
					<div class="row">
						<div class="col-6 offset-3 text-center">
							<c:forEach var="jList" items="${jList}" varStatus="status">
								<input type="radio" class="btn-check" name="categoryNo"
									id="category${jList.categoryNo}" value="${jList.categoryNo} ">
								<label class="btn btn-outline-primary"
									for="category${jList.categoryNo}">${jList.categoryName}</label>
							</c:forEach>
						</div>
					</div>

					<div class="row my-5">
						<div class="col">
							<h3 class="text-primary fw-bold">제목</h3>
							<input type="text" class="form-control form-control-lg"
								name="title" value="${story.title}" id="postTitle"
								style="height: 100px; border: 1px solid #4370FF;">
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
							<div class="row hashtagList" id="hashtagList">
								<c:forEach var="tag" items="${tList}">
									<div class="col-auto hashtag" id="${tag.tagName}">
										<div class="row my-3">
											<div class="col border border-primary-subtle pe-0">
												<span class="hashtag-value text-primary"
													value="${tag.tagName}">#${tag.tagName}</span>&nbsp; <input
													type="hidden" name="hashtag" value="${tag.tagName}">
												<button type="button"
													class="btn btn-outline-primary border border-0 "
													onclick="removeHashtag('${tag.tagName}')">×</button>
											</div>
											&nbsp;&nbsp;
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

					<div class="row ">
						<div class="col text-start">
							<h3 class="text-secondary">사진 등록</h3>
						</div>
					</div>

					<div class="row">
						<div class="col" id="imageContainer">
							<c:forEach var="image" items="${iList}" varStatus="status">
								<input type='file' class='form-control' name='additionalImages'
									style='display: none'>
								<div class='row my-3'>
									<div class='col my-3 position-relative'>
										<div class='row my-3'>
											<div class='col text-center position-relative div2'
												id='ImgDiv${status.count}'>
												<div class='div1' id='div${status.count}'></div>
											</div>
										</div>
									</div>
									<div class='row my-3'>
										<div class='col text-center '>
											<div class='div1' id='div${status.count}'>
												<img class='img-thumbnail postImg'
													src="resources/images/desk/${ image.fileName }"
													id='postImg${status.count}' />
												<button type='button' class='btn btn-secondary deleteBtn'
													id='deleteImageButton${status.count}'>삭제하기</button>
												<c:if test="${status.count == 1}">
													<button type='button' class='btn btn-secondary'
														id='addMarkerButton'>마커 편집</button>
												</c:if>
												<c:if test="${status.count == 1 }">
													<c:forEach var="m" items="${mList}" varStatus="status">
														<div class='marker' id='marker'
															style="position: absolute; top:${m.top1}%; left: ${m.left1}%;">
															<button type='button'
																class='btn btn-primary rounded-circle markerBtn' id='markerBtn'>+</button>
														</div>
														<div
															class='row search-box py-3 z-3  bg-white border border-primary-subtle rounded '
															id='searchBox' style="position: absolute; top:${m.top1+3}%; left: ${m.left1}%; display:none;">
															<img src='resources/images/icon/cancel_red.png'
																class='deleteMakerBtn' id='deleteMaker1'>
															<div class='col' id='productEle'>
																<input type='hidden' name='markerTop'
																	id='topMarkerResult' value='${m.top1}'>
																<button type='button' class='btn btn-outline-primary'
																	onclick="location.href='productDetail?productNo=${m.productNo}'">
																	<div class='row my-3'>
																		<div class='col-4'>
																			<img
																				src="resources/images/products/${m.productImage}"
																				style='width: 70px; height: 70px;'>
																		</div>
																		<div class='col-4'>
																			<div class='row mt-2'>
																				<div class='col text-start'>
																					${m.brandName}</div>
																			</div>
																			<div class='row'>
																				<div class='col text-start'>
																					${m.productName}</div>
																			</div>
																		</div>
																		<div class='col-4'></div>
																	</div>
																</button>
															</div>
														</div>
													</c:forEach>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
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
									<textarea class="form-control fs-4" name="content1"
										id="floatingTextarea2"
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
									<textarea class="form-control fs-4" name="content2"
										id="floatingTextarea2"
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
									<textarea class="form-control fs-4" name="content3"
										id="floatingTextarea2"
										style="height: 200px; border: 1px solid #4370FF;">${story.content3}</textarea>
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
									<textarea class="form-control fs-4" name="content4"
										id="floatingTextarea2"
										style="height: 200px; border: 1px solid #4370FF;">${story.content4}</textarea>
								</div>
							</div>
						</div>
					</div>

					<div class="row my-5">
						<div class="col text-center ">
							<input type="submit" class="btn btn-primary" value="수정 완료"
								id="btnWrite">
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











