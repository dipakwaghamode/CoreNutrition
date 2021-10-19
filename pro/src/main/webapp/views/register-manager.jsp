<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Manager</title>
<style>
    .contain{
        width: 400px;
    margin: 15px auto 0;
    border:6px solid yellow;
    background: rgb(0, 0, 0);
    color: yellow;

    }
    .form{
        margin: 35px ;
        font-size: large;
        font-weight: bolder;
        font-size: 18px;
        color: yellow;
        
    }
    .head{
    text-align: center;
    }
    body{
        background-image: url(loc.jpg);
        background-repeat:no-repeat;
        background-size: cover;
    }
</style>

</head>
<body >
    <jsp:include page="_header.jsp" />


 
<div class="head">
 
  <div class="contain">  
    <h1>Manager Register</h1>
   <form action="register-manager"  method="post"  style="width:30%"  >	
            
		<table class="form">



				<tr>
					<td>Username</td>
					<td><input name="userName" type="text" placeholder="Username..."/></td>
				</tr>

				<tr>
					<td>Password</td>
					<td><input name="encrytedPassword" type="password" placeholder="Password..."/></td>
				</tr>

				<tr>
					<td>Active</td>
					<td><input name="active" type="text" placeholder="active...."/></td>
				</tr>

				<tr>
					<td>UserRole</td>
					<td><input name="userRole" tpe="text" placeholder="Role..."/></td>
				</tr>

				<tr>
					<td><input type="submit" value="Register"/></td>
				</tr>

				<tr>
					<td><input type="button" value="Cancel"/></td>
				</tr>

				<tr>
					<a href="login.jsp" class="btn btn-link">Sign In Here...</a>
				</tr>
			</table>	
        	
			</form>	
   
   
   
    </div>
   
   
   
 
 
</div>
 
</body>
</html>