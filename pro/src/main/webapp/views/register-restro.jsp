<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Restro</title>
</head>
<style>
    .contain{
        width: 400px;
    margin: 15px auto 0;
    border:6px solid yellow;
    background: rgb(0, 0, 0);
    color: yellow;

    }
    .form{
        margin: 40px ;
        font-size: large;
        font-weight: bolder;
        font-size: 18px;
        color: yellow;
        
    }
    .head{
    text-align: center;
    }
    body{
        background-image: url("loc.jpg");
        background-repeat:no-repeat;
        background-size: cover;
    }
</style>

<body>
<jsp:include page="_header.jsp" />

 

<div class="head">
   
 <div class="contain">  
   <h1>Add Restro</h1>
   
   
   
   <form action="register-restro" method="post" class="" style="width:50%">
				
			<table class="form">		
				
			<tr>
			<td>Restro_Name</td>
				<td><input name="restro_name" type="text" placeholder="add restro..." /></td>
			</tr>	
	
			<tr>
			<td>Restro_Address</td>
				<td><input name="restro_address" type="text" placeholder="add restro address..." /></td>
			</tr>	
				
			<tr>
			<td>Area_id	</td>
				<td><input name="area_id" type="text" placeholder="area_id" /></td>
			</tr>	
				
			<tr>
				<td><input type="submit" value="Submit"></td>
			</tr>
				
				

		
				
	</table>	
			</form>	
   
   
   
   
   
   
   
      </div>
 
</div>
 
</body>
</html>