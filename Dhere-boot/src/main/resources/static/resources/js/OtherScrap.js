/*document.addEventListener("DOMContentLoaded", function () {
    let page = $(this).attr("s-data-page");
    console.log(page);
    let oOffset = Number(page) * 6;
    console.log(oOffset);

    $("#hiddenoOffset").val(oOffset);

    let userEmail = $("#hiddenEmail").val();
    $("#hiddenEmail").val(userEmail);
    console.log(userEmail);
    console.log(oOffset);
    console.log($("#otherScrapForm").serialize());

    $.ajax({
        url: "otherScrap",
        type: "POST",
        data: $("#otherScrapForm").serialize(),
        dataType: "json",
        success: function(res) {
            console.log(res);
            console.log(res.userStories);
            if (res.userStories.length > 0) {
                console.log(res.userStories);
                storyList(res.userStories);

                // 만약 가져온 데이터의 개수가 6개 미만이라면 더보기 버튼을 숨김
                if (res.userStories.length < 6) {
                    $('#addStoryBtn').hide();
                }
            } else {
                $("#jobSelectedCategory").empty();
                if (res.userStories.length === 0) {
                    $("#jobSelectedCategory").append("<div class=\"row m-5\">\r\n" +
                        "		<div class=\"col text-center\">\r\n" +
                        "			게시물이 없습니다.\r\n" +
                        "		</div>\r\n" +
                        "		</div>");
                    $('#addStoryBtn').hide(); // 더 이상 불러올 데이터가 없으면 버튼 숨기기
                }
            }
        },
        error: function(xhr, status, error) {
            console.log("AJAX Error: " + status + " - " + error);
            console.log(xhr.responseText);
        }
    });
});
*/