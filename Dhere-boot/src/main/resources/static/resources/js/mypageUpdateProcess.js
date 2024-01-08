 $("#btnPassCheck").click(function() {
	 var passCheckPass = $("pass").val();
	 
	 if($.trim(passCheckPass).length == 0) {
		 alert("개인정보를 수정하기 위해 비밀번호를 입력해주세요");
		 return false;
	 }
	 
	 var data = passCheckPass;
	 console.log(data);
	 
	 $.ajax({
		 "url" : "PassCheck.ajax",
		 "type" : "method",
		 "data" : data,
		 "dataType" : "json",
		 "success" : function(resData) {
			 if(resData.result) {
				 alert("비밀번호가 확인되었습니다.");
				 window.location = "scrap";
			 } else {
				 alert("비밀번호가 다릅니다. 비밀번호를 확인해주세요");
				 $("#passCheckPass").val("").focus();
			 }
		 },
		 "error" : function() {
			 console.log("error");
		 }
	 })
 })
 


