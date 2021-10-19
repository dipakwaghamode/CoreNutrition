<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

.contain{
            width: 400px;
        margin: 15px auto 0;
        border:3px solid yellow;
        background-color:black;
        background-size: cover;
        background-repeat: no-repeat;

        }
        .form{
            margin: 60px ;
            font-size: medium;
            font-weight: bold;
            font-size: 15px;
            color: yellow;
            font-family: sans-serif;
           
        }
        .hero1{
        text-align: center;
        color: rgb(255, 0, 221);
       
        }
        body {
	background-size: cover;
	background-repeat: no-repeat;
	
}
        
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
</head>
<body style= "background-color:#ffffff;">
<jsp:include page="_header.jsp" />
<div class="container" align="center">



 
<h2>Add Product</h2>
  <div class="hero1">
   <div class="contain">
 
   <c:if test="${not empty errorMessage }">
     <div class="error-message">
         ${errorMessage}
     </div>
   </c:if>
 
   <form:form modelAttribute="productForm" method="POST" enctype="multipart/form-data" class="form">
       <table >
           <tr>
               <td>Code *</td>
               <td style="color:red;">
                  <c:if test="${not empty productForm.code}">
                       <form:hidden path="code"/>
                       ${productForm.code}
                  </c:if>
                  <c:if test="${empty productForm.code}">
                       <form:input path="code" />
                       <form:hidden path="newProduct" />
                  </c:if>
               </td>
               <td><form:errors path="code" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>Name *</td>
               <td><form:input path="name" /></td>
               <td><form:errors path="name" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>Price *</td>
               <td><form:input path="price" /></td>
               <td><form:errors path="price" class="error-message" /></td>
           </tr>
           <tr>
               <td>Image</td>
               <td>
               <img src="${pageContext.request.contextPath}/productImage?code=${productForm.code}" width="100"/></td>
               <td> </td>
           </tr>
           <tr>
               <td>Upload Image</td>
               <td><form:input type="file" path="fileData"/></td>
               <td> </td>
           </tr>
 
 
           <tr>
               <td>&nbsp;</td>
               <td><input type="submit" value="Submit" /> <input type="reset"
                   value="Reset" /></td>
           </tr>
       </table>
   </form:form>
   </div>
   </div>
 

 
 
  
    </div>
</body>
</html>