<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Welcome - JSP</title>
	<!-- CSS bootstrap 3.0 --> 
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/sticky-footer.css">
	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/style.css">					
</head>
					
<body>

<div id="wrap">	
			
	<%@include file="/WEB-INF/template/header.jsp" %>
	
	<section id="main-container" class="container">
	
			<div class="jumbotron">
				<h1>Welcome <%= (session.getAttribute("username") != null) ? (session.getAttribute("username") + ",<br/>enjoy ") : "to " %>SupCommerce<br/>
				<small>A product manager site.</small></h1>
			</div>
			
	</section>
	
	<div id="push"></div>
	
</div>		
			
<%@include file="/WEB-INF/template/footer.jsp" %>

</body>			
</html>