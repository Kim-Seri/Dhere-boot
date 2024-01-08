window.onload = function() {
	showInfo(0);
}
 
 function showInfo(index) {
   var contentBoxes = document.querySelectorAll('.infoContent');
   
   // Hide all content boxes
   contentBoxes.forEach(function(box) {
     box.classList.remove('active');
   });

   // Show the selected content box
   contentBoxes[index].classList.add('active');
 }
 
 $("#btnPassCheck").click(function() {
	 var passCheckEmail = $("email").val();
	 var passCheckPass = $("pass").val();
	 
	 if($.trim(passCheckPass).length == 0) {
		 alert("개인정보를 수정하기 위해 비밀번호를 입력해주세요");
		 return false;
	 }
	 
	 var data = passCheckEmail + passCheckPass;
	 console.log(data);
	 
	 $.ajax({
		 "url" : "PassCheck.ajax",
		 "type" : "method",
		 "data" : data,
		 "dataType" : "json",
		 "success" : function(resData) {
			 if(resData.result) {
				 alert("비밀번호가 확인되었습니다.");
				 window.location.href = "scrap.jsp";
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
 


