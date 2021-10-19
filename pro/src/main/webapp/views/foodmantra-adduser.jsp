<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Infomation</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">

<style>

.contain{
            width: 400px;
        margin: 15px auto 0;
        border:5px solid;
        background:;
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
        background-color: gray;
        }
        body {
	
	background-size: cover;
	background-repeat: no-repeat;
	
}
        
</style>


</head>
<body style="background: rgba(209, 228, 243, 0.986);">
<jsp:include page="_header2.jsp" />


 <section id="hero1">

       
   
    <div class="contain">
   <form:form method="POST" modelAttribute="customerForm"
       action="/foodmantra-adduser">
 
          
             <h2 align="center">Add Customer </h2>
            
        
             
       <table align="center">
           <tr>
               <td>Name *</td>
               <td><form:input path="name" /></td>
               <td><form:errors path="name" class="error-message" /></td>
           </tr>
           <tr>
               <td>Email *</td>
               <td><form:input path="email" /></td>
               <td><form:errors path="email" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>Phone *</td>
               <td><form:input path="phone" /></td>
               <td><form:errors path="phone" class="error-message" /></td>
           </tr>
 		
 	
 
           <tr>
               <td>Address *</td>
               <td><form:input path="address" /></td>
               <td><form:errors path="address" class="error-message" /></td>
           </tr>
 		
 		
           <tr>
               <td>&nbsp;</td>
               <td><input type="submit" value="Submit" /> <input type="reset"
                   value="Reset" /></td>
           </tr>
 		
 		
       </table>
 
   </form:form>
 
     </div>
  


</section>

 
</body>
</html>