$(function (){
	


$("#btnPassCheck").on("click", function() {
	
	let email10 = $("#email").val();
	let pass10 = $("#pass10").val();

	$.ajax({
		"url": "passCheck.ajax", 
		"type": "post", 
		"data": {email:email10, pass:pass10},
		"dataType": "json",
		"success": function(resData) {
			if(resData.result) {
			alert("비밀번호가 확인되었습니다."); 
			window.location.href="scrap";
			 $("#update_mypage").focus();
		} else {
			alert("비밀번호가 다릅니다.\n비밀번호를 다시 확인해주세요"); 
			$("#pass").val("").focus();	
		} },
		"error": function(xhr, status, error) { 
			console.log("error", xhr, "=", status);
		} });
		
	});

});
	