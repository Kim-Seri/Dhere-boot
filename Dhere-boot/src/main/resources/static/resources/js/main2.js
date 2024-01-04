document.addEventListener("DOMContentLoaded", function () {
	// 글쓰기 버튼 스크롤 위치 설정
	let button = document.querySelector(".fixed-write-button");
	let isLogin = false;

	window.addEventListener("scroll", function () {
    // 특정 위치 (예: 200px)에서 버튼이 나타나도록 설정
    if (window.scrollY > 200) {
      button.style.display = "block";
    } else {
      button.style.display = "none";
    }
  });
//	
//	button.addEventListener("click", function() {
//		  if(!isLogin) {
//			  alert("로그인 먼저 진행해주세요.");
//			  // 여기 오류 잡아야 함 
//			 history.back();
//			 return null; 
//		  } 
//	})


	/*
	document.querySelectorAll('.jobs').forEach(function (job, index) {
        job.addEventListener('click', function () {
            toggleSelection(index);
        });
    });*/
	

	
	
	
	$('.jobs').on("click", function(){
		
		let jobTxt = $(this).children().eq(0).text();
		
		// 필터가 선택되어 있는 상황에서 필터 해제하기
		if($(this).children().eq(1).text() == 'X') {
			$(this).children().eq(1).text("");
			$(this).css("background-color", "white");
			$(this).children().eq(0).css("color", "black");
			let index = jobTxt.indexOf($(this).children().eq(0).text());

		// 필터가 선택되지 않은 상황에서 필터 걸기
		} else {
			$(this).children().eq(1).text($(this).children().eq(1).text()+"X");
			$(this).children().eq(0).css("color", "white");
			$(this).css("background-color", "#4370FF");


				// ajax : 카테고리가 PD인 데이터를 서버에서 받기, 눌린 버튼은 배열에 들어가도록하고 그 배열을 넘겨
				$.ajax ({
					url : "jobSelectedCategory",
					data : "selectedJob=" + jobTxt,
					type: "POST",
					dataType: "json",
					success: function(res) {
					
					console.log(res);
					$("#jobSelectedCategory").empty();

					$(res.category).each(function(v,i) {
						
						let tags = '';
						i.tags.forEach(function (tag) {
							tags += `#${tag.tagName} &nbsp;`;
						});
						
						$("#jobSelectedCategory").append(`
								
				<div class="col-3 m-4 rounded-4" style="background: #F3F3F3; width: 29%;">
			
				<div class="row rounded-top-4" style="height: 200px; background-size: cover; background-position: center; background-image: url('resources/images/desk/`+i.fileName+`');">
				<div class="col">				
				</div>
				</div>
				
				<div class="row">
				<div class="col" style="color: #636363; margin-left: 2%; margin-top: 5%; font-weight: 700;">
					<img src="resources/images/profile/`+i.picture+`" 
							id="main_picture"
							tabindex="0" 
							data-bs-html="true" 
							data-bs-placement="bottom" 
							data-bs-toggle="popover" 
							data-bs-trigger="focus"
							data-bs-title=`+i.nickname+`"
							data-bs-content="
										<a href='otherScrap?email=`+i.email+`&nickname=`+i.nickname+`&picture=`+i.picture+`'class='text-decoration-none text-dark'>프로필 보러가기</a>
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
					<fmt:formatDate value="`+i.regDate+`" pattern="yyyy-MM-dd" var="formattedDate" />
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
				<div class="col text-end py-3" style="color:#5E5E5E; font-size: smaller;">
					<img src="resources/images/icon/eye_eyes_view_count.png" id="icon_count" style="width: 20px;">
					`+i.readCount+` &nbsp;&nbsp;
					<img src="resources/images/icon/heart.png" id="icon_heart" style="width: 20px;">
					`+i.thank+`
				</div>
				</div>

			
			</div>

								`) 
					});
				}, error: function() {
					console.log("err");
				}
				
				});
				
			
			
		}
		
		
	});
	
	
	
});

// 별도 함수 생성
function toggleSelection(index) {
    const job = document.querySelector(`#jobCategories-${index}`);
    const label = document.querySelector(`#jobCategoriesLabel-${index}`);
    const closeButton = document.querySelector(`#jobCategories-${index} .close-btn`);

    if (job.checked) {
        // 이미 선택된 경우 해제
        job.checked = false;
        clearSelection(index);
    } else {
        // 선택되지 않은 경우 선택
        job.checked = true;
        label.style.color = '#FFFFFF';
        job.parentElement.classList.add('selected');
        closeButton.style.display = 'block';
    }
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
