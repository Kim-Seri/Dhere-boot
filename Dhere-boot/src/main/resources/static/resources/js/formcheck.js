document.addEventListener("DOMContentLoaded", function () {

    var offset = 0; // 이미 가져온 데이터의 수
    var limit = 8; // 한 번에 가져올 데이터의 수

    $('#addProductBtn').on('click', function() {
        $.ajax({
            url: '/getProductList',
            type: 'GET',
            data: {
                offset: offset,
                limit: limit
            },
            success: function(data) {
                if (data.length > 0) {
                    // 데이터를 리스트에 추가합니다.
                    data.forEach(function(productList) {
                        $('#categoryList').append(`
							<div class="col-3 m-3 p-1 rounded-4" style="width: 290px; height: 380px; background: #F3F3F3; cursor: pointer" onclick="location.href='productDetail?productNo=${productList.productNo}'">
								<div class="row">
									    <div class="col d-flex justify-content-center align-items-center" style="height: 200px; overflow: hidden;">
									        <img src="resources/images/products/${productList.productImage}" id="preview" class="img-fluid rounded-top-4" alt="${productList.productImage}" style="width: 100%; height: 100%;">
									    </div>
									</div>
									<div class="row">
										<div class="col p-3">
											<div class="row">
											    <div class="col-10 offset-1 py-3" style="font-weight: bold; border-bottom: 2px solid #bfbfbf; color: #bfbfbf">
											        ${productList.brandName}
											    </div>
											</div>	
											<div style="width: 100%; height: 2px; color: black"></div>
											<div class="row">
											    <div class="col-10 offset-1 mt-2" style="overflow: hidden; font-size: 23px">
											        <b>${productList.productName}</b>
											    </div>
											</div>
										</div>
									</div>
								</div>
                        `);
                    });
                    // offset을 업데이트합니다.
                    offset += data.length;
                } else {
                    // 더 이상 가져올 데이터가 없다면 "더보기" 버튼을 숨깁니다.
                    $('#addProductBtn').hide();
                }
            },
            error: function(xhr, status, error) {
                console.error("An error occurred: " + error);
            }
        });
    });
});
/////////////////////////////////////////////////////
// 카테고리 버튼 클릭 이벤트 설정
$('.categoryBtn').on('click', function() {
    var category = $(this).text(); // 선택된 카테고리
    offset = 0; // 새 카테고리를 선택했으므로 offset 초기화
    $('#categoryList').empty(); // 기존 목록을 비움
    loadProducts(category, offset, limit); // 새 카테고리의 제품 로드
});

// "더보기" 버튼 클릭 이벤트 설정
$('#addProductBtn').on('click', function() {
    loadProducts(currentCategory, offset, limit); // 현재 카테고리의 추가 제품 로드
});

// 제품 로드 함수 정의
function loadProducts(category, offset, limit) {
    $.ajax({
        url: '/getProductList', // 기존 엔드포인트 사용
        type: 'GET',
        data: {
            category: category, // 카테고리 추가
            offset: offset,
            limit: limit
        },
        // ... 이하 success 및 error 콜백은 동일
    });
}
/////////////////////////////////////////////////////
function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('preview').src = e.target.result;
      };
      reader.readAsDataURL(input.files[0]);
    } else {
      document.getElementById('preview').src = "";
    }
}
/////////////////////////////////////////////////////
 /*document.addEventListener("DOMContentLoaded", function() {
        // 여기에 답변 상태를 확인하고 설정하는 로직을 작성합니다.
        // isAnswered 변수는 답변이 있는지 여부를 나타냅니다.
        var isAnswered = true; // 답변이 있을 경우 true, 없을 경우 false로 설정

        // 답변 상태에 따라 라벨 내용을 동적으로 변경합니다.
        var statusLabel = document.getElementById("status");
        statusLabel.textContent = isAnswered ? "답변 완료" : "답변 대기 중";
    });*/
/////////////////////////////////////////////////////
function goBack() {
window.history.back();
}

// 링크 복사 버튼
function copyToClipboard() {
    var copyText = document.getElementById('copyTxt');
    
    copyText.select();
    
    try {
        var success = document.execCommand('copy');
    
        if (success) {
            alert('주소가 복사되었습니다.');
        } else {
            alert('복사에 실패했습니다. 텍스트를 선택한 후 수동으로 복사해주세요.');
        }
    } catch (err) {
        console.error('복사 동작이 지원되지 않습니다.', err);
        alert('이 브라우저에서는 복사 기능이 지원되지 않습니다. 텍스트를 선택한 후 수동으로 복사해주세요.');
    }
}





$(function() {
	
	// 삭제하기
	$("#deleteInquiry").off().on("click", function() {
		const no = $("#inquiryNo").val();
		console.log("클라이언트에서 no : " , no);
		
		if(confirm("정말로 삭제하시겠습니까?")){	
			location.href="/deleteInquiry?inquiryNo=" + no;
		};
		
	});
			
	 

        //제품 카테고리 별 리스트 출력
	    $(".categoryBtn").on("click", function() {
	    	let productCategory = $(this).text();
	    	console.log(productCategory);
	    	$.ajax({
	    		url: "categoryList",
	    		data: "productCategory=" + productCategory,
	    		type: "POST",
	    		dataType: "json",
	    		success: function(res) {
	    		$("#categoryList").empty();
	    		console.log(res.category);
	    		$(res.category).each(function(v, i) {
		    		$("#categoryList").append(`
						<div class="col-3 m-3 p-1 rounded-4" style="width: 290px; height: 380px; background: #F3F3F3; cursor: pointer" onclick="location.href='productDetail?productNo=${i.productNo}'">
							<div class="row">
								    <div class="col d-flex justify-content-center align-items-center" style="height: 200px; overflow: hidden;">
								        <img src="resources/images/products/${i.productImage}" id="preview" class="img-fluid rounded-top-4" alt="${i.productImage}" style="width: 100%; height: 100%;">
								    </div>
								</div>
								<div class="row">
									<div class="col p-3">
										<div class="row">
										    <div class="col-10 offset-1 py-3" style="font-weight: bold; border-bottom: 2px solid #bfbfbf; color: #bfbfbf">
										        ${i.brandName}
										    </div>
										</div>	
										<div style="width: 100%; height: 2px; color: black"></div>
										<div class="row">
										    <div class="col-10 offset-1 mt-2" style="overflow: hidden; font-size: 23px">
										        <b>${i.productName}</b>
										    </div>
										</div>
									</div>
								</div>
							</div>
					`)
	    		})
	    	}, error: function() {
	    		console.log("err");
	    	}
	    	})
	    })
}
)