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

//아이디찾기
$(function() {
	let member;
	let code2;
	$("#findIdSendBtn").on("click", function() {
		let findIdName = $("#findIdName").val();
		let findIdPhone = $("#findIdPhone").val();


		$.ajax({
			type: "POST", // post 형식으로 발송
			url: "findCheckId", // controller 위치
			data: {
				findIdName: findIdName,
				findIdPhone: findIdPhone  // findIdPhone 데이터 추가
			},// 전송할 ㅔ이터값
			dataType: "json",
			success: function(data) {
				alert("회원님의 핸드폰으로 인증번호가 전송되었습니다.");
				member = data; // 성공하면 데이터저장
				phoneNum = member.phone
				$.ajax({
					type: "POST", // post 형식으로 발송
					url: "authenNumCheck", // controller 위치
					data: { phoneNum: phoneNum }, // 전송할 ㅔ이터값
					dataType: "json",
					success: function(data) {
						code2 = data; // 성공하면 데이터저장
						console.log(code2);
					},
					error: function(xhr, statusText, err) {
						console.error("error …");
					},
				});
			},
			error: function(xhr, statusText, err) {
				console.error("error …");
				alert("회원정보가 일치하지 않습니다.");
			}
		});

	});
	//휴대폰 인증번호 대조
	$("#findIdChekchBtn").click(function() {
		if ($("#findIdChekch").val() == code2) {
			// 위에서 저장한값을 ㅣ교함
			alert(`인증에 성공하였습니다 회원님의 이메일은 ${member.email} 입니다.`);
			
		} else {
			alert(`인증에 실패하였습니다.`);
		}
	});

})

//비밀번호찾기
$(function() {
	let member2;
	let code3;
	$("#findPassSendBtn").on("click", function() {
		let findPassName = $("#findPassName").val();
		let findPassPhone = $("#findPassPhone").val();

		$.ajax({
			type: "POST", // post 형식으로 발송
			url: "findCheckPass", // controller 위치
			data: {
				findPassName: findPassName,
				findPassPhone: findPassPhone  // findIdPhone 데이터 추가
			},// 전송할 ㅔ이터값
			dataType: "json",
			success: function(data) {
				alert("회원님의 핸드폰으로 인증번호가 전송되었습니다.");
				member2 = data; // 성공하면 데이터저장
				phoneNum = member2.phone
				$.ajax({
					type: "POST", // post 형식으로 발송
					url: "authenNumCheck", // controller 위치
					data: { phoneNum: phoneNum }, // 전송할 ㅔ이터값
					dataType: "json",
					success: function(data) {
						code3 = data; // 성공하면 데이터저장
						console.log(code3);
					},
					error: function(xhr, statusText, err) {
						console.error("error …");
					},
				});
			},
			error: function(xhr, statusText, err) {
				console.error("error …");
				alert("회원정보가 일치하지 않습니다.");
			},
		});
	})
	
	//휴대폰 인증번호 대조
	$("#findPassBtnCheck").click(function() {
		if ($("#findPassCheck").val() == code3) {
			// 위에서 저장한값을 ㅣ교함
			alert(`인증에 성공하였습니다 회원님의 비밀번호는 ${member2.pass} 입니다.`);
		} else {
			alert(`인증에 실패하였습니다.`);
		}
	});
})