$(function() {
	
	$(function(){
	    // 나의 게시물 버튼 클릭 이벤트
	    $("#scrap_li1").on("click", function(){
	        $(".content-section").hide(); // 모든 섹션을 숨깁니다.
	        $("#myPostsContent").show(); // 나의 게시물 섹션만 표시합니다.
	    });
	    
	    // 나의 스크랩 버튼 클릭 이벤트
	    $("#scrap_li2").on("click", function(){
	        $(".content-section").hide(); // 모든 섹션을 숨깁니다.
	        $("#myScrapsContent").show(); // 나의 스크랩 섹션만 표시합니다.
	    });
	
	    // 팔로우 목록 버튼 클릭 이벤트
	    $("#scrap_li3").on("click", function(){
	        $(".content-section").hide(); // 모든 섹션을 숨깁니다.
	        $("#followListContent").show(); // 팔로우 목록 섹션만 표시합니다.
	        
	        // AJAX 요청을 통해 팔로우 목록 데이터를 가져오고 표시합니다.
	        // 여기에 AJAX 요청 코드를 넣습니다.
	    });
	});
////////////////////////////////////////////////////////////////////////////		
	$(function(){
	    // 모든 nav-link에 대한 클릭 이벤트
	    $('.nav-link').on('click', function() {
	        // 모든 nav-link에서 active 클래스 제거
	        $('.nav-link').removeClass('active');
	        // 클릭된 nav-link에 active 클래스 추가
	        $(this).addClass('active');
	    });
	});
////////////////////////////////////////////////////////////////////////////		
	$("#scrap_li1").on("click", function(){
		$.ajax({
        url: '/api/scrap', 
        type: 'GET',
        dataType: 'json', 
        success: function(followList) {
            
            var contentHtml = '';
            
            followList.forEach(function(follower) {
                contentHtml +=
                    '<div class="row">' +
                        '<div class="col">' +
                            '<div class="row">' +
                                '<div class="col">' +
                                    '<img src="resources/images/profile/' + follower.picture + '" id="scrap_follower_picture">' +
                                '</div>' +
                                '<div class="col" id="scrap_follower_nickname">' +
                                    follower.nickname +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                    '</div>';
            });
            
            $('#followListContent').html(contentHtml);
        },
        error: function(xhr, status, error) {
            console.error("Error: " + error);
        }
    	});
	});
////////////////////////////////////////////////////////////////////////////		
	$("#scrap_li2").on("click", function(){
		$.ajax({
        url: '/api/scrap', 
        type: 'GET',
        dataType: 'json', 
        success: function(followList) {
            
            var contentHtml = '';
            
            followList.forEach(function(follower) {
                contentHtml +=
                    '<div class="row">' +
                        '<div class="col">' +
                            '<div class="row">' +
                                '<div class="col">' +
                                    '<img src="resources/images/profile/' + follower.picture + '" id="scrap_follower_picture">' +
                                '</div>' +
                                '<div class="col" id="scrap_follower_nickname">' +
                                    follower.nickname +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                    '</div>';
            });
            
            $('#followListContent').html(contentHtml);
        },
        error: function(xhr, status, error) {
            console.error("Error: " + error);
        }
    	});
	});
////////////////////////////////////////////////////////////////////////////		
	$("#scrap_li3").on("click", function(){
		$.ajax({
        url: '/api/scrap', 
        type: 'GET',
        dataType: 'json', 
        success: function(followList) {
            
            var contentHtml = '';
            
            followList.forEach(function(follower) {
                contentHtml +=
                    '<div class="row">' +
                        '<div class="col">' +
                            '<div class="row">' +
                                '<div class="col">' +
                                    '<img src="resources/images/profile/' + follower.picture + '" id="scrap_follower_picture">' +
                                '</div>' +
                                '<div class="col" id="scrap_follower_nickname">' +
                                    follower.nickname +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                    '</div>';
            });
            
            $('#followListContent').html(contentHtml);
        },
        error: function(xhr, status, error) {
            console.error("Error: " + error);
        }
    	});
	});
////////////////////////////////////////////////////////////////////////////		
	
	$(".#scrap_li2").on("click", function (e) {
    e.preventDefault();
    $.ajax({
        url: "myScraps",
        type: "POST",
        dataType: "json",
        success: function (res) {
            $("#myList").empty();
            console.log(res.scList);
            $(res.scList).each(function (v, i) {
                const scrapDate = new Date(i.scrapDate);
                const formattedDate = `${scrapDate.getFullYear()}-${(scrapDate.getMonth() + 1).toString().padStart(2, '0')}-${scrapDate.getDate().toString().padStart(2, '0')}`;

                // 동적으로 생성된 HTML을 담을 변수
                let scrapItemHTML = `
                    <div class="col-3 m-4 rounded-4" style="background: #F3F3F3; width: 29%;">
                        <!-- Scrap 썸네일 -->
                        <a href="storyDetail?storyNo=${i.storyNo}">
                            <div class="row rounded-top-4" style="height: 200px; background-size: cover; background-position: center; background-image: url('resources/images/desk/${i.fileName}');">
                                <div class="col"></div>
                            </div>
                        </a>
                        <!-- 프로필, 닉네임, 날짜 -->
                        <div class="row">
                            <div class="col" style="color: #636363; margin-left: 2%; margin-top: 5%; font-weight: 700;">
                                <img src="resources/images/profile/${i.picture}" 
                                    style="width: 50px; height: 50px; object-fit: cover; border-radius: 70%; border: 1px solid #5E5E5E; cursor: pointer;"
                                    id="main_picture"
                                    tabindex="0" 
                                    data-bs-html="true" 
                                    data-bs-placement="bottom" 
                                    data-bs-toggle="popover" 
                                    data-bs-trigger="focus"
                                    data-bs-title="${i.nickname}"
                                    data-bs-content="
                                        <a href='otherScrap?email=${i.email}&nickname=${i.nickname}&picture=${i.picture}&categoryName=${i.categoryName}&categoryName=${i.categoryName}'
                                            class='text-decoration-none text-dark'>프로필 보러가기</a>
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
                                &nbsp;${i.nickname}
                            </div>
                            <div class="col text-end" style="color: #5E5E5E; margin-top: 2%;">
                                ${formattedDate}
                            </div>
                        </div>
                        <!-- 제목 -->
                        <div class="row">
                            <div class="col" style="font-weight: bold; margin-left: 2%; margin-top: 11%; font-size: 21px; font-weight: 800;">
                                <a href="storyDetail?storyNo=${i.storyNo}" class="link-dark link-underline-opacity-0">${i.title}</a>
                            </div>
                        </div>
                        <div class="row" style="width: 99%; border-bottom: 2px solid #bfbfbf; margin-left: 1%; margin-top: 20px;">
                            <div class="col justify-content-center"></div>
                        </div>
                        <!-- 태그 -->
                        <div class="row">
                            <div class="col mt-3 mb-4" style="color:#5E5E5E; margin-left: 2%;">
                                `;

                // JSTL 루프에서 생성된 태그 목록을 처리
                $(i.tags).each(function (tagIndex, tag) {
                    scrapItemHTML += `#${tag.tagName} `;
                });

                scrapItemHTML += `</div>
                        </div>
                        <!-- 조회수, 좋아요 -->
                        <div class="row">
                            <div class="col py-3" id="main_story_category_area" style="color: #5E5E5E;">
                                &nbsp;
                                <img src="resources/images/icon/name_tag_full.png" id="main_story_category_btn" style="width: 20px; height: 20px;">
                                &nbsp;${i.categoryName}
                            </div>
                            <div class="col text-end py-3" style="color:#5E5E5E; font-size: smaller;">
                                <img src="resources/images/icon/eye_eyes_view_count.png" id="icon_count" style="width: 20px;">
                                ${i.readCount}&nbsp;&nbsp;
                                <img src="resources/images/icon/heart.png" id="icon_heart" style="width: 20px;">
                                ${i.thank}
                            </div>
                        </div>
                    </div>`;
                $("#myList").append(scrapItemHTML);
            });
        },
        error: function () {
            console.log("err");
        }
    });
});
	




	
	
}) ;  
    

    
