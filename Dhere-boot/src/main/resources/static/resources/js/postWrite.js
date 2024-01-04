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
function handleMarkerClick(event) {
  if (isAddingMarker) {
	  console.log(isAddingMarker);
    addMarker(event.clientX, event.clientY);
  } else {
 
  }
}

//Marker addition function
function addMarker(x, y) {
	// 동적으로 마커를 추가하는 로직 작성
	
	// 마커를 추가할 부모 컨테이너
    const markerContainer = $("<div class='marker-container'></div>");
    const marker = $("<div class='marker' id='marker'><button type='button' class='btn btn-primary rounded-circle' id='markerBtn'>+</button></div>");
    const searchBox = $("<div class='row search-box' id='search-box'>"
	    							+ "<div class='col'>"
		    							+ "<div class='row'>"
			    							+ "<div class='col'>"
			    								+ "<input type='text' class='form-control'>"
			    							+ "</div>"
			    							+ "<div class='col'>"
			    								+ "<button type='button' class='btn btn-danger' id='deleteMaker'>삭제</button> "
			    							+ "</div>"
			    						+ "</div>"
		    						+ "</div>"
    							+ "</div>");

	
    marker.css({
        position: "absolute", // 스크롤과 상관없이 화면에 고정
        top: y + window.scrollY + "px", // 현재 스크롤 위치 고려
        left: x + "px",
      });
	
	searchBox.css({
	 position: "absolute",
	 top: y +window.scrollY + 20 + "px", // 마커 아래에 위치
	 left: x + "px",
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
	marker.on("mouseout", function () {
	 searchBox.hide();
	});
}

//엔터 누르면 해시태그 추가
function enterkey() {
  if (window.event.keyCode == 13) {
    addHashtag();
  }
}

//해시태그 삭제
//해시태그 삭제
function removeHashtag(hashtag) {
  document.getElementById(hashtag).remove();
}

//해시태그 추가
//해시태그 추가
function addHashtag() {
  let hashtag = $("#hashtag").val();
  let item = getHashtagItem(hashtag);
  $("#hashtagList").append(item);
  $("#hashtag").val("");
}

//해시태크 부분 동적 생성 코드
//해시태크 부분 동적 생성 코드
function getHashtagItem(hashtag) {
  let item = `<div class="col-auto hashtag" id="${hashtag}">
			<div class="row my-3">
				<div class="col border border-primary-subtle pe-0">
					<span class="hashtag-value text-primary"  value="${hashtag}">#${hashtag}</span>&nbsp;
		  			<input type="hidden" name="hashtag" value="${hashtag}">
					<span class="hashtag-value text-primary"  value="${hashtag}">#${hashtag}</span>&nbsp;
		  			<input type="hidden" name="hashtag" value="${hashtag}">
					<button type="button" class="btn btn-outline-primary border border-0 " onclick="removeHashtag('${hashtag}')">×</button>
				</div>&nbsp;&nbsp;
			</div>
		</div>`;

  return item;
}

$(function () {
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
      var imageDivCol2 = $( "<div class='col my-3 text-center position-relative'></div>");
      var imageDivCol2 = $( "<div class='col my-3 text-center position-relative'></div>");
      var imageDivRow3 = $("<div class='row my-3'></div>");
      var imageDivCol3 = $( "<div class='col my-3 text-center position-relative'></div>");
      var deleteButton = $("<button type='button' class='btn btn-secondary' id='deleteImageButton'>삭제하기</button>");
      var markerButton = $("<button type='button' class='btn btn-secondary' id='addMarkerButton'>마커 편집</button>");

      var imageDivCol3 = $( "<div class='col my-3 text-center position-relative'></div>");
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
//      imageDivCol3.append(changeButton);
      $("#imageContainer").append(imageDivRow);

      displayImagePreview(this, imagePreview);


      // 이미지 미리보기와 버튼을 감싸는 부모 요소에 CSS 적용
      imageDivCol.css({
        position: "relative",
        overflow: "hidden",
        position: "relative",
        overflow: "hidden",
      });

      imageDivCol2.css({
        position: "fixed",
        top: 0,
        left: 0,
        width: "100%",
        height: "100%",
        display: "flex",
        flexDirection: "column",
        justifyContent: "space-between",
        alignItems: "center",
      });
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
  
  $(document).on("click", "#postImg", function(event) {
	    if (isAddingMarker) {
	        addMarker(event.clientX, event.clientY);
	    }
	});
  
  //마커 편집 완료 버튼 클릭 시
  $("#imageContainer").on("click", "#finishMarkerButton", function () {
	  finishAddingMarker();
  });
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
  
  $(document).on("click", "#postImg", function(event) {
	    if (isAddingMarker) {
	        addMarker(event.clientX, event.clientY);
	    }
	});
  
  //마커 편집 완료 버튼 클릭 시
  $("#imageContainer").on("click", "#finishMarkerButton", function () {
	  finishAddingMarker();
  });

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
