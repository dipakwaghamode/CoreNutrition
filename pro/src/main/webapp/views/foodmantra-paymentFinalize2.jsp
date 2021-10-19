<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>user Cart</title>
</head>
<body style="background: rgba(209, 228, 243, 0.986);">
	<jsp:include page="_header2.jsp" />







	<div class="container">
		
			

				<div>
					<div style="align: center;">


						<pre>
							<h4>Thank you for Order,
          		your order will be ready in 20 minutes. 
          		We are waiting for you</h4>
						</pre>
						Your order number is: ${lastOrderedCart.orderNum}
					</div>

				</div>
		

		
	</div>







</body>
</html>