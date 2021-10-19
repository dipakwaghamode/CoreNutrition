<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	
	
	
	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>menu-list</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<style type="text/css">
.product-image {
	width: 150px;
	height: 120px;
	text-align:center;
}

.product-preview-container {
    border: 1px solid #ccc;
    padding: 15px;
    width: 250px;
    margin: 10px ;
    display: inline-block;
    text-align:left;
}
 
.product-preview-container input {
    width: 50px;
}

.page-title  {
    font-size:120%;
    text-align: left;
    margin:10px 0px;
}

</style>


</head>
<body style="background: rgba(209, 228, 243, 0.986);">
	<jsp:include page="_header2.jsp" />
	<div class="container">

	<fmt:setLocale value="en_US" scope="session" />

	<div class="page-title">Menu List</div>



	<c:forEach items="${paginationProducts.list}" var="prodInfo">
		<div class="product-preview-container">
			<ul>
				<img class="product-image"
					src="${pageContext.request.contextPath}/productImage?code=${prodInfo.code}" />
				
				<li>Name: ${prodInfo.name}</li>
				<li>Price: <fmt:formatNumber value="${prodInfo.price}"
						 />Rs</li>
				<div >
					<a class="navi-item btn btn-dark text-light m-2 p-2 btn-sm "
						href="${pageContext.request.contextPath}/foodmantra-buyProduct?code=${prodInfo.code}">
						Buy Now</a>
				</div >
				<!-- For Manager edit Product -->
				<security:authorize access="hasRole('ROLE_MANAGER')">
					<li><a style="color: red;"
						href="/admin/product?code=${prodInfo.code}">
							Edit Item</a></li>
				</security:authorize>
			</ul>
		</div>

	</c:forEach>
	<br />


	<c:if test="${paginationProducts.totalPages > 1}">
		<div class="page-navigator">
			<c:forEach items="${paginationProducts.navigationPages}" var="page">
				<c:if test="${page != -1 }">
					<a href="foodmantra-menuList?page=${page}" class="nav-item">${page}</a>
				</c:if>
				<c:if test="${page == -1 }">
					<span class="nav-item"> ... </span>
				</c:if>
			</c:forEach>

		</div>
	</c:if>
	</div>
</body>
</html>