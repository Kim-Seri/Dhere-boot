<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    






<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Dhere 사이트 소개</title>
<style>
body {
    background-color: white;
    color: #4370FF;
    font-family: 'Arial', sans-serif;
}

#logoBox {
    text-align: center;
    margin-top: 5%;
    text-align: center;
    
	padding-left: 70px;
	padding-top: 40px;
	padding-bottom: 30px;
}

#logoImg {
	width: 40%;
}

#titleBox {
	margin-top: 3%;
	margin-left: 10%;
}

h1, h2 {
	color: #4370FF;
    font-size: 2em;
    opacity: 0;
    transition: opacity 2s;
}

.content-visible {
    opacity: 1 !important;
}

.big-bold {
    font-size: 6.5em; /* 이 값을 조정하여 원하는 크기로 설정하세요 */
    font-weight: bold;
    transition: all 2s;
}

@keyframes fadeIn {
	from {opacity: 0;}
	to {opacity: 50;}
}

#mainContentBox {
    background-color: white;
	margin-top: -10%;
	font-size: 18px;
	color: black;
	padding-top: 10%;
}
@keyframes slideInFromRight {
    0% {
        transform: translateX(100%);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

.slide-in {
    animation-name: slideInFromRight;
    animation-duration: 2s;
    animation-fill-mode: forwards;
}

.content-hidden {
    opacity: 0;
}

#contentBox {
    margin-top: 10%;
    margin-bottom: 20%;
    padding-left: 10%;
}

#greeting1, #greeting2, #greeting3 {
	font-size: 30px;
	font-weight: 900;
	color: #4370FF;
}


</style>
</head>
<body>
<div class="row bg-warning">
	<div class="col">





<div class="row" id="logoBox">
	<div class="col">
		<img src="resources/images/icon/logo4.png" id="logoImg">
	</div>
</div>

<div class="row">
	<div class="col" id="titleBox">
	    <h1 id="title" class="content-hidden">Welcome to Dhere!</h1>
    	<h2 id="subtitle" class="content-hidden">Our Site</h2>
	</div>
</div>

<div class="row">
    <div class="col-4">
    	<img src="resources/images/carousel/3d-casual-life-collegues-working-at-the-desk.png" class="mt-5 ms-5 d-block w-100" alt="...">
    </div>
    <div class="col-8" id="contentBox">
        <p id="greeting1" class="content-hidden">
        	당신만의 특별한 데스크셋업을
        </p>
        <p id="greeting2" class="content-hidden" style="padding-left: 15%;">
        	다른 사용자들과 공유하세요.
        </p>
        <p id="greeting3" class="content-hidden" style="padding-left: 30%;">
        	그 모든 것을 Dhere에서 만나보세요!
        </p>
    </div>
</div>


<div class="row"  id="mainContentBox">
	<div class="col text-center">
		<br>
		<br>
		우리의 삶은 우리가 보낸 시간과 공간에 의해 구성됩니다. 
		<br>
		<br>
		그 중에서도 우리가 일을 하는 곳, 즉 데스크는 우리의 삶을 크게 좌우합니다. 
		<br>
		<br>
		책상 위에 놓인 아이템 하나하나는 우리의 성격, 취향, 그리고 일에 대한 태도를 반영합니다. 
		<br>
		우리는 이러한 데스크셋업을 공유하는 공간을 만들어, 서로의 삶을 이해하고 영감을 주고받는 커뮤니티를 만들고자 합니다.
		<br>
		<br>
		여러분이 Dhere에서 새로운 영감을 얻고, 자신만의 완벽한 작업 공간을 찾아가는 과정을 돕고자 합니다.
		<br>
		<br>
		Dhere에서 시작하여, 여러분의 일상을 더욱 특별하게 만들어보세요. 
		<br>
		<br>
		우리는 여러분의 여정을 기대하고 있습니다.
		<br>
		<br>
		감사합니다.
		<br>
		<br>
		<br>
		<br>
		<b class="fs-3">Dhere Team 일동</b>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<img src="resources/images/carousel/carousel02.png" class="d-block w-100" alt="...">
	</div>
</div>


	</div>
</div>
 <script>
    window.onload = function() {
        var title = document.getElementById('title');
        var subtitle = document.getElementById('subtitle');
        title.classList.add('content-visible');
        subtitle.classList.add('content-visible');
    }

    window.onscroll = function() {
        var title = document.getElementById('title');
        var subtitle = document.getElementById('subtitle');
        var greeting1 = document.getElementById('greeting1');
        var greeting2 = document.getElementById('greeting2');
        var greeting3 = document.getElementById('greeting3');
        
        if (window.pageYOffset > 400) { // Adjust this value
            title.classList.add('big-bold');
            subtitle.classList.add('big-bold');
        }
        
        if (window.pageYOffset > 800) { 
            greeting1.classList.remove('content-hidden');
            greeting1.classList.add('slide-in');
            greeting2.classList.remove('content-hidden');
            greeting2.classList.add('slide-in');
            greeting3.classList.remove('content-hidden');
            greeting3.classList.add('slide-in');
        }
    }
</script>
</body>
</html>