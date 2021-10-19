<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       
       
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
#hero {
	width: 100%;
	height: 90vh;
	background:url("https://images.designtrends.com/wp-content/uploads/2015/12/15055407/Grey-Floral-Background.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}

#hero .container {
	padding-top: 72px;
}

#a1{


  margin: 0 0 10px 0;
  font-size: 22px;
  font-weight: 100;
  line-height: 40px;
  color:yellow;
  background-color:black;


}


</style>

</head>
<body>

<jsp:include page="_menu.jsp" />


	<section id="hero" class="d-flex align-items-center">

	<div class="container" align="center">
		<table id="a1" class="table table-hover" border="1" cellpadding="5" style="text-align:center" >
			<tr>
			<thead>
				<tr>
					
					<th>Area Name</th>
					<th>List Restro</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${areaList}">
					<tr>
						
						<td><c:out value="${item.area_name}" /></td>
						<td><a href="http://localhost:8080/foodmantra-restro?code=${item.area_id }">Check</a></td>
						
					</tr>
				</c:forEach>

			</tbody>

			</tr>


		</table>
	</div>

	</section>



</body>
</html>      
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
