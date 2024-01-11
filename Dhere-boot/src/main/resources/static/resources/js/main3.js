// 01/10 오전 11시 45분 백

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
    
    // 글쓰기 버튼 - 로그인 후 사용 가능 (로그아웃 상태면 리다이렉션)
    document.getElementById("main_writeBtn").addEventListener("click", function () {
		
        if (isLogin2) {
            window.location.href = "postWriteForm";
        } else {
            alert("로그인 후 글쓰기가 가능합니다.");
            window.location.href = "loginForm";
        }
        
    });

   	
    
    // 직무 카테고리 선택
    $('.jobs').on("click", function () {

        let selectedJob = $(this).children().eq(0).text();
        let jobVal = $(this).attr("value");
        let offset = 0;
    	let limit = 6;
        console.log(selectedJob);
        console.log(jobVal);

        // 필터가 선택되어 있는 상황에서 필터 해제하기
        if ($(this).children().eq(1).text() == 'X') {
            $(this).children().eq(1).text("");
            $(this).css("background-color", "white");
            $(this).children().eq(0).css("color", "black");
            $(this).attr("value", "off");
            offset = 0; // 초기화

            $.ajax({
                url: "storyList",
                type: "POST",
                dataType: "json",
                data: {
                    offset: offset,
                    limit: limit
                },
                success: function (res) {
                    $("#jobSelectedCategory").empty();
                    if (res.resultList.length > 0) {
                        storyList(res.resultList);
                        offset += res.resultList.length; // 현재 불러온 데이터의 길이만큼 증가
                    } else {
                        $('#addBtn').hide(); // 더 이상 불러올 데이터가 없으면 버튼 숨기기
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
            offset = 0; // 초기화

            $.ajax({
                url: "storyList",
                data: {
                    selectedJob: selectedJob,
                    offset: offset,
                    limit: limit
                },
                type: "GET",
                dataType: "json",
                success: function (res) {
                    console.log(res.resultList);
                    console.log("res.resultList.length : " + res.resultList.length);

                    if (res.resultList.length > 0) {
                        $("#jobSelectedCategory").empty();
                        storyList(res.resultList);
                        console.log("offset : " + offset);
                        console.log("if 문 res.resultList.length : " + res.resultList.length);
                        offset += limit;
                        console.log("offset 더하고 : " + offset);

                        // 만약 가져온 데이터의 개수가 6개 미만이라면 더보기 버튼을 숨김
                        if (res.resultList.length < limit) {
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

    // 페이징 처리
    offset = 6;
    limit = 6;

    $("#addBtn").on("click", function() {
        $.ajax({
            url: "storyList",
            type: "GET",
            data: {
                offset: offset,
                limit: limit
            },
            success: function(res) {
                if (res.resultList.length > 0) {
                    storyList(res.resultList);
                    offset += res.resultList.length; // 현재 불러온 데이터의 길이만큼 증가
                } else {
                    $('#addBtn').hide(); // 더 이상 불러올 데이터가 없으면 버튼 숨기기
                }
            },
            error: function (xhr, status, error) {
                console.log("AJAX Error: " + status + " - " + error);
                console.log(xhr.responseText);
            }
        });
    });
    
    

    // 태그 검색

    // 정렬
});



function fetchData(offset, limit) {
        $.ajax({
            url: "storyList",
            data: {
                offset: offset,
                limit: limit
            },
            type: "GET",
            dataType: "json",
            success: function (res) {
                console.log(res.resultList);
                console.log("res.resultList.length : " + res.resultList.length);

                if (res.resultList.length > 0) {
                    $("#jobSelectedCategory").empty();
                    storyList(res.resultList);
                    console.log("offset : " + offset);
                    console.log("if 문 res.resultList.length : " + res.resultList.length);
                    offset += limit;
                    console.log("offset 더하고 : " + offset);

                    // 만약 가져온 데이터의 개수가 6개 미만이라면 더보기 버튼을 숨김
                    if (res.resultList.length < limit) {
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
    }

function storyList(res) {
	
	$(res).each(function(v, i) {
		$('[data-bs-toggle="popover"]').popover();

						let tags = '';
				        if (i.tags) { // i.tags가 존재하는지 확인
				            i.tags.forEach(function (tag) {
				                tags += `#${tag.tagName} &nbsp;`;
				            });
				        }
						//console.log("최종태그");
						//console.log(i.tags);
						
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
			</div>`) 
	});
	
}

function clearSelection(index) {
    const job = document.querySelector(`#jobCategories-${index}`);
    const label = document.querySelector(`#jobCategoriesLabel-${index}`);
    const closeButton = document.querySelector(`#jobCategories-${index} .close-btn`);

    job.checked = false;
    label.style.color = ''; // 원래의 색상으로 돌아가게 수정
    job.parentElement.classList.remove('selected');
    closeButton.style.display = 'none';
}