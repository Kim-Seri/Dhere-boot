$(function (){

$("#btnPassCheck").on("click", function() {
	
	let email10 = $("#email").val();
	let pass10 = $("#pass10").val();
	if(pass10.length <= 0) {
		alert('비밀번호를 입력해 주세요');
		return false;
	}

	$.ajax({
		"url": "passCheck.ajax", 
		"type": "post", 
		"data": {email:email10, pass:pass10},
		"dataType": "json",
		"success": function(resData) {
			if(resData.result) {
				window.location.href="mypageUpdateForm";
			 	
			} else {
				alert("비밀번호가 다릅니다.\n비밀번호를 다시 확인해주세요"); 
				$("#pass").val("").focus();	
			} 
		},
		"error": function(xhr, status, error) { 
			console.log("error", xhr, "=", status);
		} });
		
	});

});
	
	