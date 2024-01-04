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
<div class="col-3 m-3 p-1 rounded-4" style="width: 350px; height: 380px; background: #F3F3F3; cursor: pointer" onclick="location.href='productDetail?productNo=`+i.productNo+`'">
			<div class="row">
			    <div class="col d-flex justify-content-center align-items-center" style="height: 200px; overflow: hidden;">
			        <img src="resources/images/products/`+i.productImage+`" id="preview" class="img-fluid rounded-top-4" alt="`+i.productImage+`" style="width: 100%; height: 100%;">
			    </div>
			</div>

			<div class="row">
				<div class="col p-3">
					<div class="row">
					    <div class="col-10 offset-1 py-3" style="font-weight: bold; border-bottom: 2px solid #bfbfbf; color: #bfbfbf">
					        `+i.brandName+`
					    </div>
					</div>	

			
			<div style="width: 100%; height: 2px; color: black"></div>
			
			<div class="row">
			    <div class="col-10 offset-1 py-3" style="overflow: hidden; font-size: 23px">
			        <b>`+i.productName+`</b>
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