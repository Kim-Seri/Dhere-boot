<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
 <%
    String clientId = "1VaS1gkFztuW3nMdEM8H";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8088/main", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
         + "&client_id=" + clientId
         + "&redirect_uri=" + redirectURI
         + "&state=" + state;
    session.setAttribute("state", state);
 %>


<link rel="stylesheet" href="resources/css/login.css">
<script src="resources/js/member.js"></script>
<style>
</style>
<div class="row align-items-center h-100">
	<div class="col">
		<div class="row ">
			<div class="col text-center">
				<h2 class="text-light">Login</h2>
			</div>
		</div>
		<form class= "justify-content-center" action="login" name="loginForm" id="loginForm" method="post">
			<div class="row my-5  ">
				<div class="col-4 offset-4">
					<input type="text" class="form-control rounded-pill" name="email" id="email">
				</div>
			</div>
			<div class="row mt-5   ">
				<div class="col-4 offset-4">
					<input type="password" class="form-control rounded-pill" name="pass1" id="pass1">
				</div>
			</div>
			<div class="row mt-3 mb-5">
				<div class="col-2 offset-4 ">
					<a href="joinForm" class="text-decoration-underline text-body-secondary fw-bold">Join Us</a>
				</div>
				<div class="col-2  text-end">
					<a href="main" class="text-decoration-underline text-body-secondary fw-bold">Forget ID or Password?</a>
				</div>
			</div>
			<div class="row my-5">
				<div class="col text-center">
					<input type="submit" class="btn btn-light text-primary fw-bold" value="Login">
					<input type="button" class="btn btn-outline-light fw-bold" value="back" onclick="location.href='main'">
				</div>
			</div>
			  <div class="row text-center" >
			  	<div class="col">
			  		<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
			  	</div>
			  </div>
		</form>
	</div>
</div>










 