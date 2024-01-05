let isAddingMarker = false; // 마커를 추가 중인지 여부를 나타내는 변수


// 마커 추가 시작
function startAddingMarker() {
  isAddingMarker = true;
  console.log(isAddingMarker);
  
  //마커 추가 버튼 엘리먼트
  const addMarkerButton = $("#addMarkerButton"); 
  addMarkerButton.text("편집 완료");
  document.getElementById('addMarkerButton').setAttribute('id','finishMarkerButton');
}

// 마커 추가 완료
function finishAddingMarker() {
  isAddingMarker = false;
  const finishMarkerButton = $("#finishMarkerButton"); 

  console.log(isAddingMarker);
  finishMarkerButton.text("마커 추가");
  document.getElementById('finishMarkerButton').setAttribute('id','addMarkerButton');
  document.getElementById("marker")
  

}

// 마커 클릭 이벤트 처리
function handleMarkerClick(e) {
  if (isAddingMarker) {
	  console.log(isAddingMarker);
    addMarker(e.clientX, e.clientY);
  } else {
 
  }
}

//Marker addition function
function addMarker(x, y) {
	// 동적으로 마커를 추가하는 로직 작성
	
	// 마커를 추가할 부모 컨테이너
    const markerContainer = $("<div class='marker-container'></div>");
    const marker = $(`<div class='marker' id='marker'><button type='button' class='btn btn-primary rounded-circle' id='markerBtn'>+</button></div>`);
    const searchBox = $(`
    							<div class='row search-box bg-white border border-primary-subtle rounded ' id='search-box '>
	    							<div class='col'>
		    							<div class='row my-3'>
			    							<div class='col-8'>
			    								<input type='text' id='searchInput'  class='form-control'>
			    							</div>
			    							<div class='col text-end'>
			    								<button type='button' class='btn btn-danger' id='deleteMaker'>삭제</button> 
			    							</div>
			    						</div>
			    						<div class='row my-2'>
			    							<div class='col' id='autoCompleteResults'>
			    							</div>
			    						</div>
		    						</div>
    							</div>`);
    
    // 이미지의 크기
    const imageWidth = $('body').width();
    const bodyHeight = $("body").height();

    // 스크롤 위치
    const scrollY = window.scrollY;

	
 // 마커의 위치 조절
    const adjustedX = (x / imageWidth) * 100; // 이미지의 가로 방향 상대 위치
    const adjustedY = ((y + scrollY) / bodyHeight) * 100; // body의 세로 방향 상대 위치
    

    // 마커의 위치를 설정
    marker.css({
      position: "absolute",
//      top: y +window.scrollY + "px", 
      top: y +window.scrollY + "px", 
      left: `${adjustedX}%`,
    });
	
	searchBox.css({
	 position: "absolute",
	 top: y +window.scrollY + 30 + "px", // 마커 아래에 위치
	  left: `${adjustedX}%`,
//	 display: "none", // 일단 숨김
	});
	
	markerContainer.append(marker);
	markerContainer.append(searchBox);
	
	// 마커를 이미지가 아닌 별도의 컨테이너에 추가
    $("#imageContainer").append(markerContainer);
	
	
	// 마커에 마우스 오버 시 검색 상자 표시
	marker.on("mouseover", function () {
	 searchBox.show();
	});
	
	// 마커에서 마우스 나갈 시 검색 상자 숨김
//	marker.on("mouseout", function () {
//	 searchBox.hide();
//	});
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

$(function () {
	
	//ajax로 페이지 로딩 시에 제품 데이터 가져오기
	$.ajax({
		url: "productList",
		method:"GET",
		success:function(products){
			console.log(products)
			console.log(products[0].productName);
			var result=products.map(function(object,index){
			window.productList = products;	
			})
		},
		error : function (error){
			console.log("제품명 데이터를 가져오는 중 오류 발",error);	
		}
	})
	
	// 검색어 입력 이벤트 감지
    $("#imageContainer").on("input","#searchInput", function () {
        const userInput = $(this).val().toLowerCase();
        const matchingProducts = window.productList.filter(product =>
            product.productName.toLowerCase().includes(userInput)
        );
        
        var inputSearch=$("#searchInput").val();
        if(inputSearch.length==0){
			$("#autoCompleteResults").empty();
		}
        
		console.log(matchingProducts.brandName);
		
        displayAutoCompleteResults(matchingProducts);
    });
    
    
	
  //폼 엔터키 눌러도 자동으로submit 안되게 제한
  $("form").keydown(function () {
    if (event.keyCode === 13) {
      event.preventDefault();
    }
  });

  $("#categoryCarousel").carousel();

  $("#addImageButton").on("click", function () {
    // 새로운 이미지 입력 필드를 생성하고 파일 선택 다이얼로그를 띄웁니다.
	var postNumber=0;
	postNumber=postNumber+1;
    var imageInput = $(
      "<input type='file' class='form-control' name='additionalImages' style='display:none'>"
    );
    $("#imageContainer").append(imageInput);
    imageInput.click();

    // 이미지 업로드 인풋이 변경됐을 때의 이벤트 핸들러
    imageInput.on("change", function () {
      if (!this.files.length) {
        return;
      }

      // 이미지 미리보기 업데이트
      var imagePreview = $("<img class='img-thumbnail' id='postImg'/>");
//      var changeButton = $(
//        "<button type='button' class='btn btn-outline-primary' id='changeImageButton'>사진 수정하기</button>"
//      );
      var imageDivRow = $("<div class='row my-3'></div>");
      var imageDivCol = $("<div class='col my-3 position-relative'></div>");
      var imageDivRow2 = $("<div class='row my-3'></div>");
      var imageDivCol2 = $( "<div class='col text-center position-relative' id='ImgDiv'></div>");
      var imageDivRow3 = $("<div class='row my-3'></div>");
      var imageDivCol3 = $( "<div class='col text-center '></div>");
      var deleteButton = $("<button type='button' class='btn btn-secondary' id='deleteImageButton'>삭제하기</button>");
      var markerButton = $("<button type='button' class='btn btn-secondary' id='addMarkerButton'>마커 편집</button>");

      imageDivRow.append(imageDivCol);
      imageDivCol.append(imageDivRow2);
      imageDivRow2.append(imageDivCol2);

      imageDivCol2.append(imagePreview);
      imageDivCol2.append(markerButton);
      imageDivCol2.append(deleteButton);

      imageDivCol.append(imageDivRow3);
      imageDivRow3.append(imageDivCol3);
//      imageDivCol3.append(changeButton);
      $("#imageContainer").append(imageDivRow);

      displayImagePreview(this, imagePreview);


    });
  });

  //이미지 삭제하기 버튼 눌렸을 때
  $("#imageContainer").on("click", "#deleteImageButton", function () {
    $(this).parent().parent().parent().parent().prev().remove();
    $(this).parent().parent().parent().parent().remove();
    isAddingMarker=false;
    console.log(isAddingMarker);
  });

  //마커 추가 버튼 클릭 시
  $("#imageContainer").on("click", "#addMarkerButton", function () {
    startAddingMarker();
  });
  
  //마커 삭제버튼 눌렀을 시
  $("#imageContainer").on("click", "#deleteMaker", function () {
	    $(this).parent().parent().parent().parent().prev().remove()
	    $(this).parent().parent().parent().parent().remove()
	  });
  
  $(document).on("click", "#postImg", function(event) {
	    if (isAddingMarker) {
	        addMarker(event.clientX, event.clientY);
	    }
	});
  
  //마커 편집 완료 버튼 클릭 시
  $("#imageContainer").on("click", "#finishMarkerButton", function () {
	  finishAddingMarker();
  });
  
  
  function displayAutoCompleteResults(results) {
        // 결과를 표시할 UI 요소 선택 (예: 결과를 표시할 div)
        const autoCompleteDiv = $("#autoCompleteResults");

        // 이전 결과 지우기
        autoCompleteDiv.empty();

        // 일치하는 결과를 UI에 추가
        results.forEach(result => {
            const resultItem = $(`<div class='row my-2 p-3'>
            						<button type='button' class='btn btn-outline-primary'>
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

            // 결과를 클릭하면 자동으로 검색 상자에 입력되도록 이벤트 처리
            resultItem.on("click", function () {
                // 텍스트 창 아래에 제품 정보 표시
                displayProductInfo(result);

                // 선택 후 자동 완성 결과 지우기
                autoCompleteDiv.empty();
            });

            autoCompleteDiv.append(resultItem);
        });
    }

   
  // 이미지 미리보기 업데이트 함수
  function displayImagePreview(input, preview) {
    // 선택한 이미지를 미리보기로 업데이트
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        preview.attr("src", e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
});
