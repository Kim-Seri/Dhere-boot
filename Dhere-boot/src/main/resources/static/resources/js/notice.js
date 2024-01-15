$(function(){
	$("noticeWriteForm").on("submit", function(){
		if($("#title").val().length <= 0) {
			alert("제목이 입력되지 않았습니다.");
			$("#title").focus();
			return false;
		}	
		if($("#content").val().length <= 0) {
			alert("내용이 입력되지 않았습니다.");
			$("#content").focus();
			return false;
		}
	});
});

let date = new Date((n.regDate));						
let formattedDate = date.getFullYear() + "-" + ('0' + (date.getMonth() +1)).slice(-2) + "-" + ('0' + date.getDate()).slice(-2);