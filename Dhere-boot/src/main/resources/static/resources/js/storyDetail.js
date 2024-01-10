document.addEventListener('DOMContentLoaded', function () {
    // 팝오버 초기화
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl);
    });
});

$(document).ready(function() {
    var isScrapped = false;

    $("#scrapBtn").on("click", function() {
        if (!isScrapped) {
            if (confirm("이 게시물을 스크랩하시겠습니까?")) {
                $("#scrapForm").submit();
                $("#scrapBtn").prop("disabled", true);
            }
        } else {
            alert("이미 스크랩한 게시물입니다.");
        }
    });
});




