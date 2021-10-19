<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
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

    <style>
        .contain{
            width: 400px;
        margin: 15px auto 0;
        border:6px solid yellow;
        background: rgb(0, 0, 0);
        color: yellow;
    
        }
        .form{
            margin: 30px ;
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
<body>
<jsp:include page="_header.jsp" />

 
   
<div class="head">
   
 <div class="contain">  
   <h3>Add Location</h3>
   <form action="register-area"  method="post" class="" style="width:50%">
				
		<table class="form">	
				
				
			<tr>
			<td>Location</td>
				<td><input name="area_name"  type="text" placeholder="add location..." /></td>
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