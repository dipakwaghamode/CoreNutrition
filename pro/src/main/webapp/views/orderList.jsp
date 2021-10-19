<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>order-list</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
</head>
<body style="background: rgba(209, 228, 243, 0.986);">
	<jsp:include page="_header.jsp" />


	<fmt:setLocale value="en_US" scope="session" />
	<div class="container" align="center">
		<h3>Order List</h3>

		<div>Total Order Count: ${paginationResult.totalRecords}</div>


		<table id="a1"
			class="table table-hover border-top-1 border border-dark"
			cellpadding="5" border="1">
			<tr>
				<th>Order Num</th>
				<th>Order Date</th>
				<th>Customer Name</th>
				<th>Customer Address</th>
				<th>Customer Email</th>
				<th>Amount</th>
				<th>View</th>
			</tr>
			<c:forEach items="${paginationResult.list}" var="orderInfo">
				<c:if test="${param.q!= orderInfo.id}">

					<tr>
						<td>${orderInfo.orderNum}</td>
						<td><fmt:formatDate value="${orderInfo.orderDate}"
								pattern="dd-MM-yyyy HH:mm" /></td>
						<td>${orderInfo.customerName}</td>
						<td>${orderInfo.customerAddress}</td>
						<td>${orderInfo.customerEmail}</td>
						<td style="color: red;"><fmt:formatNumber
								value="${orderInfo.amount}" /></td>
						<td><a
							href="http://localhost:8080/admin/order?orderId=${orderInfo.id}">
								View</a></td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<c:if test="${paginationResult.totalPages > 1}">
			<div class="page-navigator">
				<c:forEach items="${paginationResult.navigationPages}" var="page">
					<c:if test="${page != -1 }">
						<a href="orderList?page=${page}" class="nav-item">${page}</a>
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