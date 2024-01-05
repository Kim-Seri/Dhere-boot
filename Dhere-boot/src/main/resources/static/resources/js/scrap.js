
	// 개인정보 관련 탭바
/*	
<script>
let key = "${param.key}";
console.log(key);
if(key === "tab1"){
	
	$("#tab2-tab").removeClass("active");
	$("#tab3-tab").removeClass("active");
	$("#tab1-tab").addClass("active");
	
	$("#tab2-tab").removeClass("show active");
	$("#tab3-tab").removeClass("show active");
	$("#tab1-tab").addClass("show active");
	
}else if(key === "tab2"){
	
	$("#tab2-tab").removeClass("active");
	$("#tab1-tab").removeClass("active");
	$("#tab3-tab").addClass("active");
	
	$("#tab1-tab").removeClass("show active");
	$("#tab3-tab").removeClass("show active");
	$("#tab2-tab").addClass("show active");
	
}else if(key === "tab3"){
	
	$("#tab1-tab").removeClass("active");
	$("#tab2-tab").removeClass("active");
	$("#tab3-tab").addClass("active");
	
	$("#tab2-tab").removeClass("show active");
	$("#tab1-tab").removeClass("show active");
	$("#tab3-tab").addClass("show active");
	
}*/
	

/*</script>


    // 나의 게시물/ 나의 스크랩/ 팔로잉 목록
	    $(".scrapBtn").on("click", function() {
	    	let scrapCategory = $(this).text();
	    	console.log(scrapCategory);
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

	    
	
} */