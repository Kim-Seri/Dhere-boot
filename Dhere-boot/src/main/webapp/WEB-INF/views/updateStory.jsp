<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<link href="resources/css/postUpdate.css" rel="stylesheet">
<script src="resources/js/postUpdate.js"></script>



<c:choose>
	<c:when test="${story.email eq sessionScope.member.email}">

		<div class="row p-5 my-5 border border-primary rounded-4 border-3">
			<div class="col">
				<form action="updateStoryProcess" method="post" id="postUpdateForm"
					name="postUpdateForm" enctype="multipart/form-data">

					<input type="hidden" name="storyNo" id="storyNo"
						value="${story.storyNo}"> <input type="hidden"
						name="markers" id="markers">

					<div class="row ">
						<div class="col text-start">
							<h3 class="text-secondary">직종 선택</h3>
						</div>
					</div>
					<!-- 카테고리 캐러셀 시작 -->
					<div class="row">
						<div class="col">
							<div id="categoryCarousel" class="carousel slide"
								data-bs-ride="false">
								<div class="carousel-inner">
									<!-- 페이지 수 계산 -->
									<c:set var="itemsPerPage" value="8" />
									<c:set var="totalItems" value="${fn:length(jList)}" />
									<c:set var="pageCount"
										value="${(totalItems div itemsPerPage) + (totalItems % itemsPerPage ne 0 ? 1 : 0)}" />

									<!-- 페이지별 캐러셀 아이템 생성 -->
									<c:forEach begin="0" end="${pageCount - 1}" var="pageIndex">
										<div class="carousel-item ${pageIndex == 0 ? 'active' : ''}">
											<div class="d-flex flex-row justify-content-center">
												<!-- 페이지별 카테고리 항목 생성 -->
												<c:forEach begin="${pageIndex * itemsPerPage}"
													end="${(pageIndex + 1) * itemsPerPage - 1}"
													varStatus="status" items="${jList}">
													<c:if test="${status.index lt totalItems}">
														<div class="category-item"
															style="cursor: pointer; position: relative; background-color: white;">
															<input type="radio" class="btn-check" name="categoryNo"
																id="category${jList[status.index].categoryNo}"
																value="${jList[status.index].categoryNo}"> <label
																class="btn btn-outline-primary"
																for="category${jList[status.index].categoryNo}">${jList[status.index].categoryName}</label>
														</div>
													</c:if>
												</c:forEach>
											</div>
										</div>
									</c:forEach>
								</div>
								<!-- 캐러셀 컨트롤 버튼 -->
								<button class="carousel-control-prev rounded-5" type="button"
									data-bs-target="#categoryCarousel" data-bs-slide="prev"
									id="previous">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Previous</span>
								</button>
								<button class="carousel-control-next rounded-5" type="button"
									data-bs-target="#categoryCarousel" data-bs-slide="next"
									id="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span>
									<span class="visually-hidden">Next</span>
								</button>
							</div>
						</div>
					</div>
					<!-- 카테고리 캐러셀 끝 -->

					<div class="row my-5">
						<div class="col">
							<h3 class="text-primary fw-bold">제목</h3>
							<input type="text" class="form-control form-control-lg"
								name="title" value="${story.title}" id="postTitle"
								style="height: 100px; border: 1px solid #4370FF;">
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
																	class='btn btn-primary rounded-circle markerBtn'
																	id='markerBtn'>+</button>
															</div>
															<div
																class='row search-box py-3 z-3  bg-white border border-primary-subtle rounded '
																id='searchBox'
																style="position: absolute; top:${m.top1+3}%; left: ${m.left1}%; display:none;">
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
																					<div class='col text-start'>${m.brandName}</div>
																				</div>
																				<div class='row'>
																					<div class='col text-start'>${m.productName}</div>
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











