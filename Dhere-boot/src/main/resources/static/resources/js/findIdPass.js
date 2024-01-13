$(document).ready(function() {
    // 아이디 찾기 상자에 마우스 진입 이벤트
    $(".find-box").mouseenter(function() {
        $(this).css("background", "rgb(56, 96, 255)");
        $(this).find("img").attr("src", "resources/images/findId2.png");
        $(this).find(".box-title").css("color", "white");
    });

    // 아이디 찾기 상자에서 마우스 나가기 이벤트
    $(".find-box").mouseleave(function() {
        $(this).css("background", "");
        $(this).find("img").attr("src", "resources/images/findId.png");
        $(this).find(".box-title").css("color", "");
    });
});

$(document).ready(function() {
    // 비밀번호 찾기 상자에 마우스 진입 이벤트
    $(".find-pass-box").mouseenter(function() {
        $(this).css({
            "background": "rgb(56, 96, 255)",
            "border": "5px solid rgb(56, 96, 255)"
        });
        $(this).find("img").attr("src", "resources/images/findPass2.png");
        $(this).find(".box-title").css("color", "white");
    });

    // 비밀번호 찾기 상자에서 마우스 나가기 이벤트
    $(".find-pass-box").mouseleave(function() {
        $(this).css({
            "background": "",
            "border": "5px solid rgb(56, 96, 255)"
        });
        $(this).find("img").attr("src", "resources/images/findPass.png");
        $(this).find(".box-title").css("color", "");
    });
});