function findZipcode() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
            	addr = data.roadAddress;
                // addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                addr += extraAddr;
            
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#zipcode").val(data.zonecode);
            $("#address1").val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $("#address2").focus();
        }
    }).open();
}

$(function() {
	$("#btnZipcode").on("click", findZipcode);
});



// DOM이 준비되면-----------로그아웃

$(function() {
	$("#memberUpdateForm").on("submit", function() {
		// 비밀번호 확인했는지 체크
		if(!$("#btnPassCheck").prop("disabled")) {
			alert("먼저 비밀번호 확인을 해주세요");
			return false;
		}
		
		return joinFormCheck();
	});
});

$(function() {

	$("#joinForm").on("submit", function() {
		
		let regExp = /^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$/gi;
		
		if($("#email").val().length <= 0) {
			alert("이메일을 입력해 주세요.");
			
			return false;
		}
		if($("#pass1").val().length <= 0) {
			alert("비밀번호를 입력해 주세요.");
			
			return false;
		}
		if($("#name").val().length <= 0) {
			alert("이름을 입력해 주세요.");
			
			return false;
		}
		if($("#nickname").val().length <= 0) {
			alert("닉네임을 입력해 주세요.");
			
			return false;
		}
		if($("#zipcode").val().length <= 0) {
			alert("우편번호를 입력해 주세요.");
			
			return false;
		}
		if($("#address1").val().length <= 0) {
			alert("주소를 입력해 주세요.");
			
			return false;
		}
		if($("#address2").val().length <= 0) {
			alert("주소를 입력해 주세요.");
			
			return false;
		}
		if(regExp.test($("#job").val())) {
			alert("직업을 입력해 주세요.");
			
			return false;
		}
		if($("#phone").val().length <= 0) {
			alert("연락처를 입력해 주세요.");
			
			return false;
		}
		
		alert("회원가입에 성공했습니다.");
		
	});
	//회원가입 아이디 중복검사
	$("#btnOverlapEmail").on("click",function(){
		var id=$("#email").val()
			if(id == '' || id.length == 0) {
	    		$("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
	    		return false;
	    	}
		var idCheck=$("#isIdCheck").val();
		
		//Ajax로 전송
		$.ajax({
			url:"ConfirmId",
			data:{id : id},
			type:"POST",
			dataType:"json",
			success:function(resData){
				console.log(resData.result);
				console.log(resData);
				if(resData.result) {
					$("#label1").css("color", "black").text("사용 가능한 ID 입니다.");
					$("#isIdCheck").val("true");
					console.log(id);
					
				}else {
					$("#label1").css("color", "red").text("사용 불가능한 ID 입니다.");
    				$("userId").val('');
				}
			},
			"error": function(xhr, statusText, err) {
				console.error("error …");
			}
		});
	});
		
	
	
	
	$("#btnOverlapPass").on("click",function(){
		var pass1=$("#pass1").val()
		var pass2=$("#pass2").val()
			if(pass1 == pass2) {
	    		$("#label2").css("color", "black").text("비밀번호가 일치합니다.");
	    		return false;
	    	} else {
	    		$("#label2").css("color", "red").text("비밀번호가 일치하지 않습니다.");
	    	}
	});
	
	
	
	$("#btnPassCheck").click(function() {
	var oldEamil = $("#email").val();
	var pass10 = $("#pass10").val();
	console.log(pass10);
	
	if(pass10.length == 0) {
	alert("기존 비밀번호가 입력되지 않았습니다.\n기존 비밀번호를 입력해주세요"); 
	return false;
	}
	var data = "pass="+oldPass; 
	console.log("data : " + data);
	
	$.ajax({
		"url": "passCheck.ajax", 
		"type": "POST",
		"data": data,
		"dataType": "json",
		"success": function(resData) {
		
		if(resData.result) {
		alert("비밀번호가 확인되었습니다.\n비밀번호를 수정해주세요"); 
		$("#btnPassCheck").prop("disabled", true); 
		$("#oldPass").prop("readonly", true);
		$("#pass1").focus();
		} else {
		alert("비밀번호가 다릅니다.\n비밀번호를 다시 확인해주세요"); 
		$("#oldPass").val("").focus();
		} },
		"error": function() { console.log("error");
		} 
	});
});

	
	
	

	// 회원정보 수정 폼에서 수정하기 버튼이 클릭되면 유효성 검사를 하는 함수
	$("#memberUpdateForm").on("submit", function() {
		if(! $("#btnPassCheck").prop("disabled")) {
		alert("기존 비밀번호를 확인해야 비밀번호를 수정할 수 있습니다.\n"
		+ "기존 비밀번호를 입력하고 비밀번호 확인 버튼을 클릭해 주세요"); return false;
		}
		return joinF(); 
	});	

});