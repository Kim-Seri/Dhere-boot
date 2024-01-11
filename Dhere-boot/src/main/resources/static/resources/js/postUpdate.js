

let isAddingMarker = false; // 마커를 추가 중인지 여부를 나타내는 변수
let searchBox;
let marker;
let isMakerBtn = false; //마커 등록 뒤 클릭하면 보여주

let adjustedX;
let adjustedY;

let markerData = new Array();

let topResult;




// 마커 추가 시작
function startAddingMarker() {
	isAddingMarker = true;
	console.log(isAddingMarker);

	// ##############################################
	// ##############################################
	// 문제점 - 이미지가 여러 개 선택될 때 마커 추가 버튼은 하나만 생김 - id 선택자를 사용하면 않됨
	// ##############################################
	//마커 추가 버튼 엘리먼트
	const addMarkerButton = $("#addMarkerButton");
	addMarkerButton.text("편집 완료");
	document.getElementById('addMarkerButton').setAttribute('id', 'finishMarkerButton');
}

// 마커 추가 완료
function finishAddingMarker() {
	isAddingMarker = false;
	const finishMarkerButton = $("#finishMarkerButton");

	console.log(isAddingMarker);
	finishMarkerButton.text("마커 추가");
	document.getElementById('finishMarkerButton').setAttribute('id', 'addMarkerButton');
}



//엔터 누르면 해시태그 추가
function enterkey() {
	if (window.event.keyCode == 13) {
		addHashtag();
	}
}

//해시태그 삭제
function removeHashtag(hashtag) {
	document.getElementById(hashtag).remove();
}

//해시태그 추가
function addHashtag() {
	let hashtag = $("#hashtag").val();
	let item = getHashtagItem(hashtag);
	$("#hashtagList").append(item);
	$("#hashtag").val("");
}

//해시태크 부분 동적 생성 코드
function getHashtagItem(hashtag) {
	let item = `<div class="col-auto hashtag" id="${hashtag}">
			<div class="row my-3">
				<div class="col border border-primary-subtle pe-0">
					<span class="hashtag-value text-primary"  value="${hashtag}">#${hashtag}</span>&nbsp;
		  			<input type="hidden" name="hashtag" value="${hashtag}">
					<button type="button" class="btn btn-outline-primary border border-0 " onclick="removeHashtag('${hashtag}')">×</button>
				</div>&nbsp;&nbsp;
			</div>
		</div>`;

	return item;
}



function adjustDiv1Height() {
	// 각각의 .div1과 .postImg에 대해 반복
	$('.div1').each(function(index) {
		// 현재 .postImg에 대응하는 높이를 가져옴
		var imgHeight = $('.postImg').eq(index).height();
		// 현재 .div1의 높이를 .postImg에 대응하는 높이로 설정
		 console.log('Image ' + (index + 1) + ' Height:', imgHeight);
		$(this).height(imgHeight);
	});
}


$(function() {

	

	

	function addMarker(x, y) {
		// 동적으로 마커를 추가하는 로직 작성

		console.log(x);
		console.log(y);

		//console.log("x 좌표," + leftX);
		//console.log("y 좌표," + topY);

		// 마커를 추가할 부모 컨테이너
		//const markerContainer = $("<div class='marker-container'></div>");
		marker = $(`<div class='marker' id='marker'><button type='button' class='btn btn-primary rounded-circle' id='markerBtn'>+</button></div>`);
		searchBox = $(`
    							<div class='row search-box py-3 z-3  bg-white border border-primary-subtle rounded ' id='searchBox '  >
    								<img src='resources/images/icon/cancel_red.png' class='deleteMakerBtn' id='deleteMaker'>
    								
	    							<div class='col' id='searchBoxCol'>
		    							<div class='row my-3'>
			    							<div class='col text-center'>
			    								<input type='text' id='searchInput'  class='form-control'>
			    							</div>
			    							
			    						</div>
			    						<div class='row my-2 overflow-scroll' style='height:400px; width:350px;'>
			    							<div class='col text-center' id='autoCompleteResults'>
			    								 <h5 class="text-black">제품명을 검색해주세요</h5>
			    							</div>
			    						</div>
		    						</div>
    							</div>`);

		// 이미지의 크기
		const imageWidth = $('#div1').width();
		const bodyHeight = $("#div1").height();

		console.log(imageWidth);
		console.log(bodyHeight);


		// 마커의 위치 조절
		adjustedX = (x / imageWidth) * 100;  // 이미지의 가로 방향 상대 위치
		adjustedY = (y / bodyHeight) * 100; // body의 세로 방향 상대 위치

		console.log(adjustedX);
		console.log(adjustedY);




		marker.css({
			position: "absolute",
			top: `${adjustedY}%`, // 클릭한 위치에 상대적인 세로 위치
			left: `${adjustedX}%`, // 클릭한 위치에 상대적인 가로 위치
		});

		searchBox.css({
			position: "absolute",
			top: `${adjustedY + 3}%`, // 마커 아래에 위치
			left: `${adjustedX}%`,
			// display: "none", // 현재는 숨김 처리
		});

		$("#div1").append(marker);
		$("#div1").append(searchBox);

		// 마커를 이미지가 아닌 별도의 컨테이너에 추가
		//$(".div1").append(markerContainer);




		// 마커 클릭 시 상자 표시
		marker.on("click", function() {
			if (!isMakerBtn) {
				searchBox.show();
				isMakerBtn = true;
				console.log(isMakerBtn);
			} else {
				searchBox.hide();
				isMakerBtn = false;
			}
		});

		// 마커에서 마우스 나갈 시 검색 상자 숨김
		/*marker.on("mouseout", function () {
		 searchBox.hide();
		});*/
	}

	//이미지 구분을 위한 변수
	var deleteBtnNum = 0;
	var imageDivNum = 0;
	var updatingMarker = false;

	//게시글 번호 가져오기
	var storyNo = $("#storyNo").val().trim();
	console.log("storyNo : ", Number(storyNo));


	// 마커를 서버로 전송하기 위한 배열
	let markers = [];

	var marker;
	var searchBox;

	//생성되어있는 마커 클릭 시 searchbox 보여줌
	$(".markerBtn").on("click", function() {
		console.log("Marker Button Clicked");
		if (!updatingMarker) {
			$(this).parent().next().show();
			updatingMarker = true;
		} else {
			$(this).parent().next().hide();
			updatingMarker = false;
		}
	})

	// 마커를 객체 생성자 함수
	function Marker(markerNo, storyNo, left1, top1, imageNo, productNo) {
		this.markerNo = markerNo;
		this.storyNo = storyNo;
		this.left1 = left1;
		this.top1 = top1;
		this.imageNo = imageNo;
		this.productNo = productNo;
	}

	//image 리스트를 호출해서 갯수만큼 위의 변수에 대입
	$.ajax({
		url: "markerData",
		data: "storyNo=" + storyNo,
		type: "POST",
		dataType: "json",
		success: function(res) {
			console.log("res : ", res);
			res.forEach((element) => {
				console.log(element.top1);
				markers.push(new Marker(0, 0, element.left1, element.top1, 0, element.productNo))
			});
			console.log("markers : " + markers);
		},
		error: function(error) {
			console.log("이미지 리스트를 가져오는 중 오류 발생", error);
		}
	})

	// postWriteForm 폼이 전송될 때
	$("#postUpdateForm").on("submit", function(e) {
		//e.preventDefault();
		// 폼이 sumbit 될 때 마커 정보를 직렬화하여 markers라는 이름을 가진 hidden 필드에 추가된다.
		$("#markers").val(JSON.stringify(markers));

		// 아래에 유효성 검사 코드가 필요함
	});





	//image 리스트를 호출해서 갯수만큼 위의 변수에 대입
	$.ajax({
		url: "imageListajax",
		data: "storyNo=" + storyNo,
		type: "POST",
		dataType: "json",
		success: function(res) {
			deleteBtnNum = res.length;
			imageDivNum = res.length;
			console.log("imageDivNum :" + imageDivNum);
			console.log("deleteBtnNum :" + deleteBtnNum);
		},
		error: function(error) {
			console.log("이미지 리스트를 가져오는 중 오류 발생", error);
		}
	})


	//ajax로 페이지 로딩 시에 제품 데이터 가져오기
	$.ajax({
		url: "productList",
		method: "GET",
		success: function(products) {
			console.log(products)
			console.log(products[0].productName);
			window.productList = products;

			// ###################################
			/* 여기 map 함수는 필요하지 않음
			var result = products.map(function(object, index) {				
				window.productList = products;
			});
			*/
			// ###################################
		},
		error: function(error) {
			console.log("제품명 데이터를 가져오는 중 오류 발생", error);
		}
	})

	// 검색어 입력 이벤트 감지
	$("#imageContainer").on("input", "#searchInput", function() {
		const userInput = $(this).val().toLowerCase();
		const matchingProducts = window.productList.filter(product =>
			product.productName.toLowerCase().includes(userInput)
		);

		var inputSearch = $("#searchInput").val();
		if (inputSearch.length == 0) {
			$("#autoCompleteResults").empty();
		}

		// 요거는 필요 없음 - matchingProducts는 배열이므로 brandName이 없음
		//console.log(matchingProducts.brandName);
		console.log(matchingProducts);

		displayAutoCompleteResults(matchingProducts);
	});



	//폼 엔터키 눌러도 자동으로submit 안되게 제한
	$("form").keydown(function() {
		if (event.keyCode === 13) {
			event.preventDefault();
		}
	});

	$("#categoryCarousel").carousel();


	// 사진추가 버튼 클릭시
	$("#addImageButton").on("click", function() {
		// 새로운 이미지 입력 필드를 생성하고 파일 선택 다이얼로그를 띄웁니다.

		deleteBtnNum++;
		imageDivNum++;
		console.log(deleteBtnNum);
		var imageInput = $(
			"<input type='file' class='form-control' name='additionalImages' style='display:none'>"
		);
		$("#imageContainer").append(imageInput);
		imageInput.click();

		// 이미지 업로드 인풋이 변경됐을 때의 이벤트 핸들러
		imageInput.on("change", function() {
			if (!this.files.length) {
				return;
			}

			// 이미지 미리보기 업데이트
			var imagePreview = $(`<img class='img-thumbnail postImg' id='postImg${imageDivNum}'/>`);
			var div1 = $(`<div class='div1' id='div${imageDivNum}'></div>`);
			//      var changeButton = $(
			//        "<button type='button' class='btn btn-outline-primary' id='changeImageButton'>사진 수정하기</button>"
			//      );
			var imageDivRow = $(`<div class='row my-3'></div>`);
			var imageDivCol = $(`<div class='col my-3 position-relative'></div>`);
			var imageDivRow2 = $(`<div class='row my-3'></div>`);
			var imageDivCol2 = $(`<div class='col text-center position-relative div2' id='ImgDiv${imageDivNum}'></div>`);
			var imageDivRow3 = $(`<div class='row my-3'></div>`);
			var imageDivCol3 = $(`<div class='col text-center '></div>`);
			var deleteButton = $(`<button type='button' class='btn btn-secondary deleteBtn' id='deleteImageButton${deleteBtnNum}'>삭제하기</button>`);


			imageDivRow.append(imageDivCol);
			imageDivCol.append(imageDivRow2);
			imageDivRow2.append(imageDivCol2);

			imageDivCol2.append(div1);
			div1.append(imagePreview);
			div1.append(deleteButton);

			if (imageDivNum === 1) {
				var markerButton = $(`<button type='button' class='btn btn-secondary' id='addMarkerButton'>마커 편집</button>`);
				div1.append(markerButton);
			}

			imageDivCol.append(imageDivRow3);
			imageDivRow3.append(imageDivCol3);
			//      imageDivCol3.append(changeButton);
			$("#imageContainer").append(imageDivRow);

			displayImagePreview(this, imagePreview);


		});
	});

	//이미지 삭제하기 버튼 눌렸을 때
	$("#imageContainer").on("click", ".deleteBtn", function() {
		$(this).parent().parent().parent().parent().parent().prev().remove();
		$(this).parent().parent().parent().parent().parent().remove();
		$(this).parent().parent().parent().parent().prev().remove();
		$(this).parent().parent().parent().parent().remove();



		imageDivNum--;
		deleteBtnNum--;


		isAddingMarker = false;
		console.log(isAddingMarker);
	});

	// 첫번째 (마커추가가능한) 이미지 삭제하기 버튼 눌렸을 때
	$("#imageContainer").on("click", "#deleteImageButton1", function() {
		$(this).parent().parent().parent().parent().prev().remove();
		$(this).parent().parent().parent().parent().remove();
		markers = [];
		console.log(markers);

		$(".marker-container").remove();


		isAddingMarker = false;
		console.log(isAddingMarker);
	});

	//마커 추가 버튼 클릭 시
	$("#imageContainer").on("click", "#addMarkerButton", function() {
		startAddingMarker();
	});

	// 마커 추가시 나타나는 검색창 삭제버튼 눌렀을 때(x) 
	$("#imageContainer").on("click", "#deleteMaker", function() {
		$(this).parent().prev().remove();
		$(this).parent().remove();

	});

	$("#imageContainer").on("click", "#deleteMaker1", function() {
		$(this).parent().prev().remove();
		$(this).parent().remove();
		console.log(Number($(this).next().children('#topMarkerResult').val()));
		let topMarkerResult = Number($(this).next().children('#topMarkerResult').val());

		let topIndex = markers.findIndex((v, i) => {
			console.log(v.top1);
			if (v.top1 == topMarkerResult) {
				console.log("x value", i);
				return true; // 수정된 부분
			}
			console.log(v, i);
		});

		console.log(topIndex);
		markers.splice(topIndex, 1);
		console.log(markers);
	});


	// 이미지 안에서 클리했을 때 마커를 추가하는 이벤트 핸들러
	$(document).on("click", "#postImg1", function(event) {
		if (isAddingMarker) {
			addMarker(event.offsetX, event.offsetY);
		}
	});

	//마커 편집 완료 버튼 클릭 시
	$("#imageContainer").on("click", "#finishMarkerButton", function() {
		finishAddingMarker();
	});

	// 마커의 검색 창에서 검색어 입력 실행될 때 실행되는 함수 - 위쪽의 검색어 입력 이벤트 감지에서 사용 
	function displayAutoCompleteResults(results) {
		// 결과를 표시할 UI 요소 선택 (예: 결과를 표시할 div)
		const autoCompleteDiv = $("#autoCompleteResults");

		// 이전 결과 지우기
		autoCompleteDiv.empty();

		// 일치하는 결과를 UI에 추가
		results.forEach(result => {
			const resultItem = $(`<div class='row my-2 p-3 '>
            						<button type='button' class='btn btn-outline-primary' id='productBtn'>
            						<div class='row my-3'>
	            						<div class='col-4'>
	            							<img src="resources/images/products/${result.productImage}" style='width:70px; height:70px;'>
	            						</div>
	            						<div class='col-4'>
	            							<div class='row mt-2'>
	            								<div class='col text-start'>
	            									${result.brandName}
	            								</div>
	            							</div>
	            							<div class='row'>
	            								<div class='col text-start'>
	            									${result.productName}
	            								</div>
	            							</div>
	            						</div>
	            						<div class='col-4'>
	            		
	            						</div>	
	            					</div>
            						</button>
            					</div>`);

			autoCompleteDiv.append(resultItem);


			// 마커 검색 결과 리스트에서 상품을 클릭했을 때 자동으로 폼검색 상자에 입력되도록 이벤트 처리
			resultItem.on("click", function() {

				// ##############################################
				// ##############################################
				// 마커 객체를 생성해 배열에 추가 - 여기서 생성된 객체 배열은 폼이 submit 될 때 직렬화되어 hidden 필드에 추가되고 서버로 전송된다.
				// 이미지를 구분할 데이터, 즉 마커가 어떤 이미지에 속한 것인지를 구분할 데이터가 필요함
				markers.push(new Marker(0, 0, adjustedX, adjustedY, 0, result.productNo));

				// ##############################################
				// ##############################################

				const searchBox1 = ($(this).parent().parent().parent().parent());
				// 텍스트 창 아래에 제품 정보 표시
				console.log(searchBox1.length);
				console.log(searchBox1.attr('id'));
				// 선택 후 자동 완성 결과 지우기
				autoCompleteDiv.empty();

				// 브랜드와 제품 이름을 표시할 UI 엘리먼트 생성
				const productElement = (`
									<img src='resources/images/icon/cancel_red.png' class='deleteMakerBtn' id='deleteMaker1'>
									<div class='col' id='productEle'>
										<input type='hidden' name='markerTop' id='topMarkerResult' value='${adjustedY}'>
										<button type='button' class='btn btn-outline-primary' onclick="location.href='productDetail?productNo=${result.productNo}'">
											<div class='row my-3'>
			            						<div class='col-4'>
			            							<img src="resources/images/products/${result.productImage}" style='width:70px; height:70px;'>
			            						</div>
			            						<div class='col-4'>
			            							<div class='row mt-2'>
			            								<div class='col text-start'>
			            									${result.brandName}
			            								</div>
			            							</div>
			            							<div class='row'>
			            								<div class='col text-start'>
			            									${result.productName}
			            								</div>
			            							</div>
			            						</div>
			            						<div class='col-4'>
			            							
			            						</div>	
			            					</div>
		            					</button>
									</div>`);
				searchBox1.hide();
				// UI 엘리먼트를 컨테이너에 추가
				searchBox1.html(productElement);
			});
		});
	}

	// 이미지 미리보기 업데이트 함수 - 위쪽의 사진추가 버튼 클릭시에 실행되는 함수
	function displayImagePreview(input, preview) {
		// 선택한 이미지를 미리보기로 업데이트
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				preview.attr("src", e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
		}
	}
});


