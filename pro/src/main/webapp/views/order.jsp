<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
	<style type="text/css">
	.customer-info-container {
    text-align: left;
    border: 1px solid #ccc;
    padding: 0px 5px;
}
	
	</style>
	
	
</head>
<body style="background: rgba(209, 228, 243, 0.986);">
<jsp:include page="_header.jsp" />

 <div class="container"  > 
   <fmt:setLocale value="en_US" scope="session"/>
 

 
   <div class="customer-info-container">
       <h3>Customer Information:</h3>
       <ul>
           <li>Name: ${orderInfo.customerName}</li>
           <li>Email: ${orderInfo.customerEmail}</li>
           <li>Phone: ${orderInfo.customerPhone}</li>
           <li>Address: ${orderInfo.customerAddress}</li>
       </ul>
       <h3>Order Summary:</h3>
       <ul>
           <li>Total:
           <span class="total">
           <fmt:formatNumber value="${orderInfo.amount}" />
           </span></li>
       </ul>
   </div>
    
   <br/>
   <div class="container"  align="center"> 
   <table id="a1" class="table table-hover border border-dark" border="1" cellpadding="5" border="1">
     
      <tr>
      <thead>
       <tr>
           <th>Product Code</th>
           <th>Product Name</th>
           <th>Quantity</th>
           <th>Price</th>
           <th>Amount</th>
       </tr>
       </thead>
       <tbody>
       
       <c:forEach items="${orderInfo.details}" var="orderDetailInfo">
           <tr>
               <td>${orderDetailInfo.productCode}</td>
               <td>${orderDetailInfo.productName}</td>
               <td>${orderDetailInfo.quanity}</td>
               <td>
                <fmt:formatNumber value="${orderDetailInfo.price}" />
               </td>
               <td>
                <fmt:formatNumber value="${orderDetailInfo.amount}" />
               </td>  
           </tr>
       </c:forEach>
       
       </tbody>
        </tr>
   </table>
  </div>
   <c:if test="${paginationResult.totalPages > 1}">
       <div class="page-navigator">
          <c:forEach items="${paginationResult.navigationPages}" var = "page">
              <c:if test="${page != -1 }">
                <a href="orderList?page=${page}" class="nav-item">${page}</a>
              </c:if>
              <c:if test="${page == -1 }">
                <span class="nav-item"> ... </span>
              </c:if>
          </c:forEach>
            
       </div>
   </c:if>


 
<a href="http://localhost:8080/admin/order-del?q=${orderInfo.id}">
                  COMPLETED</a>

 
 
  </div>
 
 

</body>
</html>