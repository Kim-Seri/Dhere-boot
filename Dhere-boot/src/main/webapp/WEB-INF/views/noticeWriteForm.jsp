<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    








			
			
			
			<form name="noticeWrite" id="noticeWrite" action="noticeWrite" method="post" enctype="multipart/form-data">
				  <div class="col-10 offset-1 my-5">
				    <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요." style="font-size: 30px; font-weight: bold; border: none; border-radius: 0; border-bottom: 2px solid rgb(49, 108, 244); outline: none">
				  </div>
				  <div class="col-10 offset-1 my-5">
				  <input type="text" class="form-control" name="content" id="content" placeholder="내용을 입력해 주세요." style="border: none; height: 150px; border-radius: 0; border-bottom: 2px solid rgb(49, 108, 244); outline: none">
				    
				  </div>
				  <div class="col-10 offset-1">
				    <input type="file" name="imgFile" id="file" class="form-control" style="border: none; outline: none"></input>
				  </div>
				  <div class="col-10 offset-1 mt-5 text-center">
					<input type="submit" value="등록" class="btn btn-primary rounded-3" style="width: 90px; height: 45px; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				    
					<input type="button" value="취소" class="btn border-3 border-primary rounded-3" style="width: 90px; height: 45px; font-weight: bold; color:rgb(49, 108, 244)" onclick="goBack()">			    
				  </div>
			</form>