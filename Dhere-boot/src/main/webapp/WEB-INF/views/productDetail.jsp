<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
	<form class="mt-5 d-flex justify-content-center align-items-center">
	<input type="hidden" name="no" id="no" value="${product.productNo}"/>
	<%-- <input type="hidden" name="memberId" id="memberId" value="${product.email}"> --%>
		<div class="row bg-white m-3 p-5" style="width: 70%;">
			<div class="col">
				<div class="row mt-5 mb-5">
				    <div class="col-md-8 offset-md-2 text-center">
				        <img src="resources/images/products/${product.productImage}" id="preview" class="img-fluid" alt="${product.productImage}"/>
				    </div>
				</div>

				<div class="row mb-3 justify-content-center">
		        </div>
				<div class="row">
					<div class="col" style="font-size: 25px">
					    ${product.brandName}
					</div>
				</div>
				<div class="row my-3">
					<div class="col-8">
						<p style="font-weight: bold; font-size: 50px">${product.productName}</p>
					</div>
					<div class="col-4 d-flex justify-content-end align-items-center">
					    <img src="resources/images/share.png" class="product-icon" data-bs-toggle='modal' data-bs-target='#shareModal' style="width: 50px;cursor: pointer">&nbsp;&nbsp;&nbsp;&nbsp;
					    <img src="resources/images/link.png" class="product-icon" style="width: 50px; cursor: pointer" onclick="location.href='${product.productLink}'">
					</div>


				</div>
				
				<div style="width: 100%; height: 3px; background-color: rgb(49, 108, 244);"></div>
				
				<div class="row mt-2">
					<div class="col">
						<p>${product.productContent}<p>
					</div>
				</div>
				<div class="row mt-5">
					<div class="col-8 offset-2 text-center">
						<input type="button" value="뒤로가기" class="btn" style="border: 2px solid rgb(49, 108, 244); width: 100px; height: 50px; border-radius: 15px; color: rgb(49, 108, 244); font-weight: bold;" onclick="goBack()">
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
