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
//	$("#noticeUpdate").on("click", function() {
//	$("#noticeDetailForm").attr("action", "noticeUpdate");
//	$("#noticeDetailForm").submit();
	
});
	


