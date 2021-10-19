<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ include file="Navbar-css.jsp"%>
<%@ include file="common-css-js.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food_Mantra</title>

</head>
<body>

	<header class="container-fulid sticky-top">
		<nav class="navbar navbar-expand-lg navbar-dark bg-info "
			style="height: 80px;" id="home">
			<a class="navbar-brand" href="http://localhost:8080/"><span
				class=" p-2 rounded"><h3>FOOD MANTRA</h3></span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto col-auto mt-4">

					<li class="nav-item"><a class="nav-link " href="/foodmantra-menuList">
							Menu </a></li>
					<li class="nav-item"><a class="nav-link " href="/foodmantra-menuCart">My
							order</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:8080/foodmantra-aboutus">About Us</a></li>


					<li class="nav-item"><c:if
							test="${pageContext.request.userPrincipal.name == null}">
							<a class="nav-link " href="http://localhost:8080/foodmantra/login">Login</a>
						</c:if> <c:if test="${pageContext.request.userPrincipal.name != null}">

							<a class="nav-link " href="http://localhost:8080/foodmantra/logout">Logout</a>

						</c:if></li>



					
				</ul>
			</div>
		</nav>
	</header>

</body>
</html>