<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.supinfo.sun.supcommerce.doa.SupProductDao"%>
<%@ page import="com.supinfo.sun.supcommerce.exception.UnknownProductException"%>
<%@ page import="java.text.DecimalFormat"%>

<% String error = ""; %>
<% final Object idParam = request.getParameter("id"); %>
<% final DecimalFormat priceFormat = new DecimalFormat("0.00 €");%>
<jsp:useBean id="reqProduct" class="com.supinfo.sun.supcommerce.bo.SupProduct"/>

<%
// Retrieve product with "id" parameter requested
if(idParam != null && idParam instanceof String) {
	try {
		final Long idLong = Long.parseLong((String) idParam);
		// Set Suproduct Bean to use it with EL
		pageContext.setAttribute("reqProduct", SupProductDao.findProductById(idLong));
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
 	<%-- CSS bootstrap 3.0 --%> 
 	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
 	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">					
</head>
 					
<body>

<jsp:include page="/WEB-INF/template/header.jsp">
	<jsp:param name="rootPath" value="${pageContext.servletContext.contextPath}"/>
</jsp:include>

<section id="main-container" class="container">
	<div class="row">
		<h1 class="col-sx-12 col-sm-12 col-md-12 col-lg-12">Product Details</h1>
		<% if(!error.isEmpty()) { %>
			<div class="alert alert-danger col-sx-12 col-sm-12 col-md-12 col-lg-12">
				<h3><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <%= error %></h3>
			</div>			
		<% } else { %>
			<div class="col-sx-12 col-sm-6 col-md-4 col-lg-3">
				<article class="panel panel-primary">												
					<header class="panel-heading">
						<h3><span class="glyphicon glyphicon-tag"></span>&nbsp; Product ID: ${reqProduct.id}</h3>
					</header>
					<section class="panel-body">
				       <p>Product name: ${reqProduct.name}</p>
				       <p class="description">Product description: ${reqProduct.content}</p>
				       <p>Product price: <%=  priceFormat.format(reqProduct.getPrice()) %></p>
				    </section>
			    </article>
		    </div>
		<% } %>		
	</div>
</section>
		 
<jsp:include page="/WEB-INF/template/footer.jsp"/>

</body>
</html>