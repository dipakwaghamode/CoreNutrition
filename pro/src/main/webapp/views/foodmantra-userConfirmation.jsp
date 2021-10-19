<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User order confirm</title>

<style type="text/css">

.customer-info-container {
    text-align: left;
    border: 1px solid #ccc;
    padding: 0px 5px;
}

.product-preview-container {
    border: 1px solid #ccc;
    padding: 15px;
    width: 250px;
    margin: 10px ;
    display: inline-block;
    text-align:left;
}

.product-image {
	width: 150px;
	height: 120px;
	text-align:center;
}


.product-preview-container input {
    width: 50px;
}
</style>

</head>
<body style="background: rgba(209, 228, 243, 0.986);">
 <jsp:include page="_header2.jsp" />
 
 <div>
 &nbsp;
 </div>
 
<div class="container">
      <a class="navi-item btn btn-dark text-light  btn-sm"
          href="http://localhost:8080/foodmantra-userConfirmation?payment=1 ">Payment gateway</a>
 </div>



<c:if test="${param.payment == '1'}">


<div class="container">
  <fmt:setLocale value="en_US" scope="session"/>
 
 
 
<div class="container-fluid">
    <div class="row d-flex justify-content-center">
       
        <div class="col-5">
            <div class="card mx-auto">
                                
				
            
            
                <center> <h4 class="heading">PAYMENT DETAILS</h4> </center>
                <form class="pl-3" action="/foodmantra-userConfirmation" method="post">
                    <div class="form-group mb-0">
                        <p class="mb-0">Card Number</p> <input type="text" name="cardnum" placeholder="1234 5678 9012 3457"  Pattern= "[0-9]{12}" required autocomplete="off" title="Card number should have 12 digits.."> <img src="https://img.icons8.com/color/48/000000/visa.png" width="64px" height="60px" />
                    </div>
                    <div class="form-group">
                        <p class="mb-0">Cardholder's Name</p> <input type="text" name="name" placeholder="Name" pattern="[A-Za-z\s]{1,40}"  required autocomplete="off" title="Only characters are allowed..">
                    </div>
                    <div class="form-group pt-2">
                        <div class="row d-flex">
                            <div class="col-5">
                                <p class="mb-0">Expiration</p> <input type="text" name="exp" placeholder="MM/YY" id="exp" required  title="Only digits allowed">
                            </div>
                            <div class="col-4">
                                <p class="mb-0">Cvv</p> <input type="password" name="cvv" placeholder="&#9679;&#9679;&#9679;" required pattern="[0-9]{3}" title="Only 3 digits allowed">
                            </div>
                            <div class="col-2 pt-0 mt-3 ml-2"> <button type="submit" class="btn btn-primary"><i class="fas fa-arrow-right px-3 py-1"></i></button> </div>
                        </div>
                    </div>
                    
                    
                </form>
                
            </div>
        </div>
    </div>
</div>

</c:if> 
<div>

<pre>


</pre>
<div>
 <div class="container">
 

 
  <div class="customer-info-container">
      <h3>Customer Information:</h3>
      <ul>
          <li>Name: ${myCart.customerInfo.name}</li>
          <li>Email: ${myCart.customerInfo.email}</li>
          <li>Phone: ${myCart.customerInfo.phone}</li>
          <li>Address: ${myCart.customerInfo.address}</li>
      </ul>
      <h3>Cart Summary:</h3>
      <ul>
          <li>Quantity: ${myCart.quantityTotal}</li>
          <li>Total:
          <span class="total">
            <fmt:formatNumber value="${myCart.amountTotal}" />
          </span></li>
      </ul>

 

 

 
      <c:forEach items="${myCart.cartLines}" var="cartLineInfo">
          <div class="product-preview-container">
              <ul>
                  <img class="product-image"
                      src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" />
                  <li>Code: ${cartLineInfo.productInfo.code} <input
                      type="hidden" name="code" value="${cartLineInfo.productInfo.code}" />
                  </li>
                  <li>Name: ${cartLineInfo.productInfo.name}</li>
                  <li>Price: <span class="price">
                     <fmt:formatNumber value="${cartLineInfo.productInfo.price}" />Rs
                  </span>
                  </li>
                  <li>Quantity: ${cartLineInfo.quantity}</li>
                  <li>Subtotal:
                    <span class="subtotal">
                       <fmt:formatNumber value="${cartLineInfo.amount}" /> Rs
                    </span>
                  </li>
              </ul>
           </div>
      </c:forEach>
 

 </div>
 </div>
 
 <div class="container">
   <form method="POST"
      action="/foodmantra-userConfirmation">
 
      <!-- Edit Cart -->
      <a class="navi-item btn btn-dark text-light  btn-sm"
          href="${pageContext.request.contextPath}/foodmantra-menuCart">Edit Cart</a>
 
      <!-- Edit Customer Info -->
      <a class="navi-item btn btn-dark text-light  btn-sm"
          href="${pageContext.request.contextPath}/foodmantra-adduser">Edit
          Customer Info</a>
 
     
      
      
      
  </form>
  
  
   </div>
   
   <div>
   
   <pre>
   
   
   
   </pre>
   
   </div>
   </div> 
   
    </div>
</body>
</html>