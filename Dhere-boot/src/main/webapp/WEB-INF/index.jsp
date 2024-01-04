<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/jquery-3.2.1.min.js"></script>
    
    <script src="resources/js/formcheck.js"></script>
    
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <title>Dhere</title>
</head>
<body>
         <%@ include file="template/header.jsp" %>     
        <div class="container">   
        	<jsp:include page="${param.body}" />
        </div>
        <%@ include file="template/footer.jsp" %>         
   
    
    

<script src="resources/bootstrap/bootstrap.bundle.min.js"></script>

	
<!-- 링크 공유 모달 -->
<div class="modal fade" id="shareModal" tabindex="-1" aria-labelledby="shareModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog" style="width: 500px">
			<div class="modal-content" style="border: 8px solid rgb(49, 108, 244)">
					<div class="modal-header text-white" style="text-align: center">
						<h1 class="modal-title fs-5 fw-bold" id="modalLabel" style="color: rgb(49, 108, 244); font-weight: bold">공유하기</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
			<form action="shareForm" method="post">
				<div class="row modal-body">
						<div class="col-9 offset-1 mb-3">
								<input type="text" class="form-control rounded-3" id="copyTxt" name="shareLink" style="border: 3px solid rgb(49, 108, 244)" value="${product.productLink}" readonly>
						</div>
						<div class="col-2">
								<img src="resources/images/copy.png" class="product-icon" style="width: 40px; cursor: pointer" onclick="copyToClipboard()">
						</div>
				</div>
					<div class="row my-3">
						<div class="col text-center">
							<button type="button" class="btn btn-outline-warning rounded-5" style="width: 250px; border-width: 3px; font-weight: bold; text-align: left">Share to KakaoTak</button>
						</div>
					</div>
					<div class="row my-3">
						<div class="col text-center">
							<button type="button" class="btn btn-outline-success rounded-5" style="width: 250px; border-width: 3px; font-weight: bold; text-align: left">Share to Google</button>
						</div>
					</div>
					<div class="row my-3">
						<div class="col text-center">
							<button type="button" class="btn btn-outline-primary rounded-5" style="width: 250px; border-width: 3px; font-weight: bold; text-align: left">Share to Facebook</button>
						</div>
					</div>
					</form>
			</div>	    
	</div>
</div>

</body>
</html>
