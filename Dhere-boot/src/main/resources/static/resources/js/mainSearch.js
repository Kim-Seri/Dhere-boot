document.addEventListener("DOMContentLoaded", function () {
	
	// 메인페이지 검색 기능 - 버튼 클릭
	$("#TagSearchBtn").on("click", searchResult);
	
	// 메인페이지 검색 기능 - 엔터 누르기
	$("#TagSearchBox").on("keypress", searchResult);
	
});


function searchResult() {
	
	if (event.type === "keypress" && event.key !== "Enter") {
        return; 
    }
    
	let searchTxt = $("#TagSearchBox").val();
       
       $.ajax({
		   
		   url: "searchTag",
		   data: "searchKeyword=" + searchTxt,
		   type: "GET",
		   dataType: "json",
		   success: function(res) {
			   
			   console.log(res);
			   
			   $("#jobSelectedCategory").empty();
			   
			   if(res.search.length === 0) {

					$("#jobSelectedCategory").append(`
							<div class="row m-5">
							<div class="col text-center">
								`+searchTxt+` 키워드에 해당하는 게시물이 없습니다.
							</div>
							</div>
					`);
				   
			   } else {
				   
				   	$(res.search).each(function(v,i) {
						   
						$('[data-bs-toggle="popover"]').popover();
						
						let tags = '';
						i.tags.forEach(function (tag) {
							tags += `#${tag.tagName} &nbsp;`;
						});
						
						let date = new Date((i.regDate));
						let formattedDate = date.getFullYear() + "-" + ('0' + (date.getMonth() +1)).slice(-2) + "-" + ('0' + date.getDate()).slice(-2);

						$("#jobSelectedCategory").append(`
								
				<div class="col-3 m-4 rounded-4" style="background: #F3F3F3; width: 29%;">
			
				<a href="storyDetail?storyNo=`+i.storyNo+`">
					<div class="row rounded-top-4" style="height: 200px; background-size: cover; background-position: center; background-image: url('resources/images/desk/`+i.fileName+`');">
					<div class="col">				
					</div>
					</div>
				</a>
				
				<div class="row">
				<div class="col" style="color: #636363; margin-left: 2%; margin-top: 5%; font-weight: 700;">
					<img src="resources/images/profile/`+i.picture+`" 
							id="main_picture"
							tabindex="0" 
							data-bs-html="true" 
							data-bs-placement="bottom" 
							data-bs-toggle="popover" 
							data-bs-trigger="focus"
							data-bs-title=`+i.nickname+`
							data-bs-content="
										<a href='otherScrap?email=`+i.email+`&nickname=`+i.nickname+`&picture=`+i.picture+`&categoryName=`+i.categoryName+`' class='text-decoration-none text-dark'>프로필 보러가기</a>
										<br>
									    <br>
									    <a href='scrap' class='text-decoration-none text-dark'>쪽지 보내기</a>
										<br>
									    <br>
									    <a href='scrap' class='text-decoration-none text-dark'>1:1 대화</a>
										<br>
									    <br>
									    <a href='scrap' class='text-decoration-none text-dark'>신고하기</a>
							">
					&nbsp;
					`+i.nickname+`
				</div>
				<div class="col text-end" style="color: #5E5E5E; margin-top: 2%;">
					`+formattedDate+`
				</div>
				</div>

				<div class="row">
					<div class="col" style="font-weight: bold; margin-left: 2%; margin-top: 11%; font-size: 21px; font-weight: 800;">
						<a href="storyDetail?storyNo=`+i.storyNo+`" class="link-dark link-underline-opacity-0">`+i.title+`</a>
					</div>
				</div>
				<div class="row" style="width: 99%; border-bottom: 2px solid #bfbfbf; margin-left: 1%; margin-top: 20px;">
					<div class="col justify-content-center">
						
					</div>
				</div>
				

				<div class="row">
				<div class="col mt-3 mb-4" style="color:#5E5E5E; margin-left: 2%;">
						${tags}
				</div>
				</div>
				
				<div class="row">
					<div class="col py-3" id="main_story_category_area">
						&nbsp;
						<img src="resources/images/icon/name_tag_full.png" id="main_story_category_btn">
						&nbsp;
						`+i.categoryName+`
					</div>
					<div class="col text-end py-3" style="color:#5E5E5E; font-size: smaller;">
						<img src="resources/images/icon/eye_eyes_view_count.png" id="icon_count" style="width: 20px;">
						`+i.readCount+` &nbsp;&nbsp;
						<img src="resources/images/icon/heart.png" id="icon_heart" style="width: 20px;">
						`+i.thank+`
					</div>
				</div>

			
			</div>

								`) 
					})
				   
			   }
			   
			   $("#TagSearchBox").val("");
			   
		   }, error: function() {
			   console.log("search err");
		   }
		   
	   });
}
