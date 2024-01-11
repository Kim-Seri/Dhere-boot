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
/*	$("#scrap_li1").on("click", function(){
		$.ajax({
        url: '/api/scrap', 
        type: 'GET',
        dataType: 'json', 
        success: function(followList) {
            
            var contentHtml = '';
            
            followList.forEach(function(follower) {
                contentHtml +=
                    `여기는 내 글 목록<br>`
            });
            
            $('#myPostsContent').html(contentHtml);
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
                    `여기`
            });
            
            $('#myScrapsContent').html(contentHtml);
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
	});*/
////////////////////////////////////////////////////////////////////////////		
}) ;  
    

    
