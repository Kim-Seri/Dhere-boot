
document.addEventListener("DOMContentLoaded", function () {
    // 글쓰기 버튼 스크롤
    let button = document.querySelector(".fixed-write-button");

    window.addEventListener("scroll", function () {
        if (window.scrollY > 200) {
            button.style.display = "block";
        } else {
            button.style.display = "none";
        }
    });
    
   	
    
    // 직무 카테고리 선택
    $('.jobs').on("click", function () {

        let selectedJob = $(this).children().eq(0).text();
        let jobVal = $(this).attr("value");

        //console.log(selectedJob);
        //console.log(jobVal);
        
        $("#hiddenJob").val(selectedJob);
        $("#addBtn").attr("data-page", "1");
        $("#hiddenOffset").val(0);
        
        console.log($("#categorySearchForm").serialize());
        
        // 필터가 선택되어 있는 상황에서 필터 해제하기
        if ($(this).children().eq(1).text() == 'X') {
            $(this).children().eq(1).text("");
            $(this).css("background-color", "white");
            $(this).children().eq(0).css("color", "black");
            $(this).attr("value", "off");
            $("#hiddenJob").val("");
            $("#hiddenOffset").val(0);			

            $.ajax({
                url: "storyList",
                type: "POST",
                dataType: "json",
                data: $("#categorySearchForm").serialize(),                
                success: function (res) {
					console.log(res);
                   if (res.resultList.length > 0) {
                        $("#jobSelectedCategory").empty();
                        storyList(res.resultList);                        

                        // 만약 가져온 데이터의 개수가 6개 미만이라면 더보기 버튼을 숨김
                        if (res.resultList.length < 6) {
                            $('#addBtn').hide();
                        }
                    } else {

                        $("#jobSelectedCategory").empty();
                        if (res.resultList.length === 0) {

                            $("#jobSelectedCategory").append("<div class=\"row m-5\">\r\n" +
                                "		<div class=\"col text-center\">\r\n" +
                                "			게시물이 없습니다.\r\n" +
                                "		</div>\r\n" +
                                "		</div>");

                            $('#addBtn').hide(); // 더 이상 불러올 데이터가 없으면 버튼 숨기기
                        }
                    }
                },
                error: function (xhr, status, error) {
                    console.log("AJAX Error: " + status + " - " + error);
                    console.log(xhr.responseText);
                }
            });

            // 필터가 선택되지 않은 상황에서 필터 걸기
        } else {
            // 다른 필터 선택 해제
            $('.jobs').not(this).each(function () {
                $(this).children().eq(1).text("");
                $(this).css("background-color", "white");
                $(this).children().eq(0).css("color", "black");
                $(this).attr("value", "off");
            });

            // 선택된 필터 표시 및 스타일 변경
            $(this).children().eq(1).text("X");
            $(this).children().eq(0).css("color", "white");
            $(this).css("background-color", "#4370FF");
            $(this).attr("value", "on");            

            $.ajax({
                url: "storyList",
                data: $("#categorySearchForm").serialize(),
                type: "POST",
                dataType: "json",
                success: function (res) {
                    //console.log(res.resultList);
                    //console.log("res.resultList.length : " + res.resultList.length);

                    if (res.resultList.length > 0) {
                        $("#jobSelectedCategory").empty();
                        storyList(res.resultList);                        

                        // 만약 가져온 데이터의 개수가 6개 미만이라면 더보기 버튼을 숨김
                        if (res.resultList.length < 6) {
                            $('#addBtn').hide();
                        }
                    } else {

                        $("#jobSelectedCategory").empty();
                        if (res.resultList.length === 0) {

                            $("#jobSelectedCategory").append("<div class=\"row m-5\">\r\n" +
                                "		<div class=\"col text-center\">\r\n" +
                                "			게시물이 없습니다.\r\n" +
                                "		</div>\r\n" +
                                "		</div>");

                            $('#addBtn').hide(); // 더 이상 불러올 데이터가 없으면 버튼 숨기기
                        }
                    };
                },
                error: function (xhr, status, error) {
                    console.log("AJAX Error: " + status + " - " + error);
                    console.log(xhr.responseText);
                }
            });

        }
    });


    $("#addBtn").on("click", function() {
		
		let page = $(this).attr("data-page");
		let offset = Number(page) * 6;
		$("#hiddenOffset").val(offset);
		
        $.ajax({
            url: "storyList",
            type: "POST",
            data: $("#categorySearchForm").serialize(),
            success: function(res) {
				console.log(res);
                if (res.resultList.length > 0) {
                    storyList(res.resultList);                    
                    
                    // 만약 가져온 데이터의 개수가 6개 미만이라면 더보기 버튼을 숨김
                    if (res.resultList.length < 6) {
                        $('#addBtn').hide();
                    }
                    
                } else {
                    $("#jobSelectedCategory").empty();
                    if (res.resultList.length === 0) {

                        $("#jobSelectedCategory").append("<div class=\"row m-5\">\r\n" +
                            "		<div class=\"col text-center\">\r\n" +
                            "			게시물이 없습니다.\r\n" +
                            "		</div>\r\n" +
                            "		</div>");

                        $('#addBtn').hide(); // 더 이상 불러올 데이터가 없으면 버튼 숨기기
                    }
                }
            },
            error: function (xhr, status, error) {
                console.log("AJAX Error: " + status + " - " + error);
                console.log(xhr.responseText);
            }
        });
    });

    // 태그 검색 (검색 버튼)
       $("#TagSearchBtn").on("click", function(){
		
		if(event.type ==="keypress" && event.key != "Enter") {
			return;
		}
		
		let searchKeyword = $("#TagSearchBox").val();
		
        // 키워드를 입력하지 않는다면, 전체 리스트 출력
        if(searchKeyword.length <= 0) {
			console.log("키워드 없음!");
			
			$.ajax({
                url: "storyList",
                data: $("#categorySearchForm").serialize(),
                type: "POST",
                dataType: "json",
                success: function (res) {
                    console.log(res.resultList);
                    console.log("res.resultList.length : " + res.resultList.length);

                    if (res.resultList.length > 0) {
                        $("#jobSelectedCategory").empty();
                        storyList(res.resultList);                        

                        // 만약 가져온 데이터의 개수가 6개 미만이라면 더보기 버튼을 숨김
                        if (res.resultList.length < 6) {
                            $('#addBtn').hide();
                        }
                    } else {

                        $("#jobSelectedCategory").empty();
                        if (res.resultList.length === 0) {

                            $("#jobSelectedCategory").append("<div class=\"row m-5\">\r\n" +
                                "		<div class=\"col text-center\">\r\n" +
                                "			게시물이 없습니다.\r\n" +
                                "		</div>\r\n" +
                                "		</div>");

                            $('#addBtn').hide(); // 더 이상 불러올 데이터가 없으면 버튼 숨기기
                        }
                    };
                },
                error: function (xhr, status, error) {
                    console.log("AJAX Error: " + status + " - " + error);
                    console.log(xhr.responseText);
                }
            });
			
		} else {
			// 키워드가 존재한다면, 키워드가 포함된 게시물 출력
			$("#hiddenKeyword").val(searchKeyword);
	       	$("#addBtn").attr("data-page", "1");
	        $("#hiddenOffset").val(0);
	        console.log("여기!!!!!!");
	        console.log($("#categorySearchForm").serialize());
        	
        	$.ajax({
                url: "storyList",
                data: $("#categorySearchForm").serialize(),
                type: "POST",
                dataType: "json",
                success: function (res) {
					
					console.log(res.resultList);

	            // 클라이언트 측에서 검색어 필터링
	            let filteredList = res.resultList.filter(function (story) {
	                if (story.tags) {
	                    return story.tags.some(function (tag) {
	                        return tag.tagName.includes(searchKeyword);
	                    });
	                }
	                return false;
	            });
	
	            if (filteredList.length > 0) {
	                $("#jobSelectedCategory").empty();
	                storyList(filteredList);
	
	                // 만약 가져온 데이터의 개수가 6개 미만이라면 더보기 버튼을 숨김
	                if (filteredList.length < 6) {
	                    $('#addBtn').hide();
	                }
	            }
	            
	             if (filteredList.length == 0) {
	                $("#jobSelectedCategory").empty();
	                
	                $("#jobSelectedCategory").append(`
							<div class="row m-5">
							<div class="col text-center">
								`+searchKeyword+` 키워드에 해당하는 게시물이 없습니다.
							</div>
							</div>
					`);

                            $('#addBtn').hide(); // 더 이상 불러올 데이터가 없으면 버튼 숨기기
	                
	                //console.log("그런 데이터 없음");
	                //console.log(searchKeyword);
	             }
	            
				
				$("#TagSearchBox").val("");
				


                },
                error: function (xhr, status, error) {
                    console.log("AJAX Error: " + status + " - " + error);
                    console.log(xhr.responseText);
                }
                	
            });

		}
	});
	
	 // 태그 검색 (엔터)
	$("#TagSearchBox").on("keypress", function(){
		
		if(event.type ==="keypress" && event.key != "Enter") {
			return;
		}
		
		let searchKeyword = $("#TagSearchBox").val();
		
        // 키워드를 입력하지 않는다면, 전체 리스트 출력
        if(searchKeyword.length <= 0) {
			console.log("키워드 없음!");
			
			$.ajax({
                url: "storyList",
                data: $("#categorySearchForm").serialize(),
                type: "POST",
                dataType: "json",
                success: function (res) {
                    console.log(res.resultList);
                    console.log("res.resultList.length : " + res.resultList.length);

                    if (res.resultList.length > 0) {
                        $("#jobSelectedCategory").empty();
                        storyList(res.resultList);                        

                        // 만약 가져온 데이터의 개수가 6개 미만이라면 더보기 버튼을 숨김
                        if (res.resultList.length < 6) {
                            $('#addBtn').hide();
                        }
                    } else {

                        $("#jobSelectedCategory").empty();
                        if (res.resultList.length === 0) {

                            $("#jobSelectedCategory").append("<div class=\"row m-5\">\r\n" +
                                "		<div class=\"col text-center\">\r\n" +
                                "			게시물이 없습니다.\r\n" +
                                "		</div>\r\n" +
                                "		</div>");

                            $('#addBtn').hide(); // 더 이상 불러올 데이터가 없으면 버튼 숨기기
                        }
                    };
                },
                error: function (xhr, status, error) {
                    console.log("AJAX Error: " + status + " - " + error);
                    console.log(xhr.responseText);
                }
            });
			
		} else {
			// 키워드가 존재한다면, 키워드가 포함된 게시물 출력
			$("#hiddenKeyword").val(searchKeyword);
	       	$("#addBtn").attr("data-page", "1");
	        $("#hiddenOffset").val(0);
	        console.log("여기!!!!!!");
	        console.log($("#categorySearchForm").serialize());
        	
        	$.ajax({
                url: "storyList",
                data: $("#categorySearchForm").serialize(),
                type: "POST",
                dataType: "json",
                success: function (res) {
					
					console.log(res.resultList);

	            // 클라이언트 측에서 검색어 필터링
	            let filteredList = res.resultList.filter(function (story) {
	                if (story.tags) {
	                    return story.tags.some(function (tag) {
	                        return tag.tagName.includes(searchKeyword);
	                    });
	                }
	                return false;
	            });
	
	            if (filteredList.length > 0) {
	                $("#jobSelectedCategory").empty();
	                storyList(filteredList);
	
	                // 만약 가져온 데이터의 개수가 6개 미만이라면 더보기 버튼을 숨김
	                if (filteredList.length < 6) {
	                    $('#addBtn').hide();
	                }
	            }
	            
	             if (filteredList.length == 0) {
	                $("#jobSelectedCategory").empty();
	                
	                $("#jobSelectedCategory").append(`
							<div class="row m-5">
							<div class="col text-center">
								`+searchKeyword+` 키워드에 해당하는 게시물이 없습니다.
							</div>
							</div>
					`);

                            $('#addBtn').hide(); // 더 이상 불러올 데이터가 없으면 버튼 숨기기
	                
	                //console.log("그런 데이터 없음");
	                //console.log(searchKeyword);
	             }
	            
				
				$("#TagSearchBox").val("");
				


                },
                error: function (xhr, status, error) {
                    console.log("AJAX Error: " + status + " - " + error);
                    console.log(xhr.responseText);
                }
                	
            });

		}
		
	});
    
    // 정렬
    $("#selectBox").on("change", function() {
		
			let sort = $("#selectBox").val();
			$("#hiddenSort").val(sort);
	       	$("#addBtn").attr("data-page", "1");
	        $("#hiddenOffset").val(0);
			console.log(sort);
			
			$.ajax({
				url: "storyList",
				data: $("#categorySearchForm").serialize(),
				type: "POST",
				dataType: "json",
				success: function(res) {
					
					if(res.resultList.length > 0) {
						
						$("#jobSelectedCategory").empty();
						 storyList(res.resultList);    
						 
						 if(res.resultList.length <6) {
							  $('#addBtn').hide();
						 }
						
					}
					
					        
					
				}, error: function(xhr, status, error) {
					console.log("AJAX Error: " + status + " - " + error);
                    console.log(xhr.responseText);
				}	
			});
			
	});
    

});


function storyList(res) {
	
	$(res).each(function(v, i) {
		$('[data-bs-toggle="popover"]').popover();
		
		let tags = '';
        if (i.tags) { // i.tags가 존재하는지 확인
            i.tags.forEach(function (tag) {
                tags += `#${tag.tagName} &nbsp;`;
            });
        }
		// console.log("최종태그");
		// console.log(i.tags);
		
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
			</div>`); 
	});
	
	let page = $("#hiddenOffset").val() == 0 ? 1 :  $("#hiddenOffset").val() / 6 + 1;
	$("#addBtn").attr("data-page", page);	
	if(! $("#addBtn").is(":visible")) {
		$("#addBtn").css("display", "inline-block");
	}
	
}
