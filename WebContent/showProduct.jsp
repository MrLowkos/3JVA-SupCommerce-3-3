<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.supinfo.sun.supcommerce.bo.SupProduct"%>
<%@ page import="com.supinfo.sun.supcommerce.doa.SupProductDao"%>
<%@ page import="com.supinfo.sun.supcommerce.exception.UnknownProductException"%>
<%@ page import="java.text.DecimalFormat"%>

<%
String error = "";
Boolean remove = false;
final Object id = request.getParameter("id");
final DecimalFormat priceFormat = new DecimalFormat("0.00 €");
SupProduct product = new SupProduct();

// Remove possibility
if(session.getAttribute("username") != null && session.getAttribute("username") instanceof String)
	remove = true;

// Retrieve product with "id" parameter requested
if(id != null && id instanceof String) {
	try {
		final Long idLong = Long.parseLong((String) id);
		product = SupProductDao.findProductById(idLong);
	} catch(UnknownProductException e) {
		error = e.getMessage();
	} catch(NumberFormatException e) {
		error = "\"id\" parameter should be a number !"; 
	}
} else {
	error = "No \"id\" parameter specified.";
}
%>

<!DOCTYPE html>
<html lang="en">
 				
<head>
 	<meta charset="UTF-8">
 	<meta content="IE=edge" http-equiv="X-UA-Compatible">
 	<meta content="width=device-width, initial-scale=1.0" name="viewport">
 	<title>ShowProduct - JSP</title>
 	<%-- CSS --%> 
 	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/sticky-footer.css">
 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">				
</head>
 					
<body>

<div id="wrap">	

	<%@include file="/WEB-INF/template/header.jsp" %>
	
	<section id="main-container" class="container">
			<div class="page-header">
				<h1>Product Details</h1>
			</div>
			<% if(!error.isEmpty()) { %>
				<p class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <%= error %></p>
			<% } else { %>			
				<ul class="list-group panel panel-primary">
					<li class="list-group-item panel-heading">
						<% if(remove) { %>
							<form action="${pageContext.servletContext.contextPath}/auth/removeProduct?id=<%= product.getId() %>" method="post">
								<button type="submit" class="close" >&times;</button>
							</form>
						<% } %>
						<span class="glyphicon glyphicon-tag"></span>&nbsp; <%= product.getId() %>
					</li>
					<li class="list-group-item">Name: <span class="text-muted"><%= product.getName() %></span></li>
					<li class="list-group-item">Description: <span class="text-muted"><%= product.getContent() %></span></li>
					<li class="list-group-item">Price: <span class="text-muted"><%= priceFormat.format(product.getPrice()) %></span></li>
				</ul>			    
			<% } %>		
		
	</section>
	
	<div id="push"></div>
	
</div>
	 
<%@include file="/WEB-INF/template/footer.jsp" %>

</body>
</html>