<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu_Cart</title>

<style type="text/css">

.product-image {
	width: 150px;
	height: 120px;
	text-align:center;
}
.product-preview-container {
    border: 1px solid #ccc;
    padding: 15px;
    width:250px;
    margin: 10px ;
    display: inline-block;
    text-align:left;
}

.product-container {
    border: 1px solid #ccc;
    padding: 15px;
    width: 250px;
    margin: 10px ;
    display: inline-block;
    text-align:left;
}
 
.product-container input {
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
   <fmt:setLocale value="en_US" scope="session"/>
 
   <div class="page-title">My Cart</div>
 
   <c:if test="${empty cartForm or empty cartForm.cartLines}">
       <h2>There is no items in Cart</h2>
       <a href="/foodmantra-menuList">Show
           Menu List</a>
   </c:if>
 
   <c:if test="${not empty cartForm and not empty cartForm.cartLines   }">
       <form:form method="POST" modelAttribute="cartForm"
           action="${pageContext.request.contextPath}/foodmantra-menuCart">
 
           <c:forEach items="${cartForm.cartLines}" var="cartLineInfo"
               varStatus="varStatus">
               <div class="product-preview-container">
                   <ul>
                       <img class="product-image"
                           src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" />
                       
                       <li>Code: ${cartLineInfo.productInfo.code} <form:hidden
                               path="cartLines[${varStatus.index}].productInfo.code" />
 
                       </li>
                       <li>Name: ${cartLineInfo.productInfo.name}</li>
                       <li>Price: <span class="price">
                      
                         <fmt:formatNumber value="${cartLineInfo.productInfo.price}" />Rs
                        
                       </span></li>
                       <li>Quantity: <form:input
                               path="cartLines[${varStatus.index}].quantity" /></li>
                       <li>Subtotal:
                         <span class="subtotal">
                        
                            <fmt:formatNumber value="${cartLineInfo.amount}" />Rs
                      
                         </span>
                       </li>
                       <li><a class="navi-item btn btn-dark text-light m-2 p-2 btn-sm "
                           href="${pageContext.request.contextPath}/foodmantra-menuCartRemoveProduct?code=${cartLineInfo.productInfo.code}">
                               Delete </a></li>
                   </ul>
               </div>
           </c:forEach>
           <div style="clear: both"></div>
           <input class="navi-item btn btn-dark text-light m-2 p-2 btn-sm " type="submit" value="Update Quantity" />
           <a class="navi-item btn btn-dark text-light m-2 p-2 btn-sm "
               href="/foodmantra-adduser">Enter
               Customer Info</a>

               
           <a class="navi-item btn btn-dark text-light m-2 p-2 btn-sm "
               href="/foodmantra-menuList">Continue
               Buy</a>
               
               
               
       </form:form>
 

   </c:if>
    </div>
 </body>
</html>