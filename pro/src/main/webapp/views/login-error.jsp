<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<style>

.contain{
            width: 400px;
        margin: 15px auto 0;
        border:5px solid yellow;
        background:url("https://images.designtrends.com/wp-content/uploads/2015/12/15055407/Grey-Floral-Background.jpg");
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
  <jsp:include page="_header.jsp" />



<section id="hero1">
<div class="head">
       
    </div>
    <div class="contain">
       
       
 <div style="color: red; margin: 10px 0px;">
 
               Login Failed!!!<br />
           </div>
 
       
           <form method="POST"
            action="${pageContext.request.contextPath}/j_spring_security_check" class="form">
          
            <div>
             <h1>Login</h1>
              <div>
                <lebel>  Username</lebel><br>
                 <input name="userName" placeholder="Enter username" id="username" class="hand"/><br>
                <span ></span><br>
            </div>
              
            <div>
              <lebel> Password </lebel><br>
                <input type="password" name="password" placeholder="Enter password" id="pass" class="hand"/><br>
                <span></span><br>
            </div>
            
           
            <div>
                <input type="submit" value="Login" />
                <input type="reset"  value="Reset" />
           </div>
            
             <p>
                Don't have an account? <a
                    href="http://localhost:8080/admin" target="_self">Register
                    here</a>
            </p>
        </form>

    </div>
  


</section>
             
             
  
         
       

       

</body>
</html>