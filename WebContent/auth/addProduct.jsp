<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
String appPath = request.getServletContext().getContextPath();

String name = (String) request.getAttribute("name");
String nameError = (String) request.getAttribute("error-name");
String content = (String) request.getAttribute("content");
String contentError = (String) request.getAttribute("error-content");
String price = (String) request.getAttribute("price");
String priceError = (String) request.getAttribute("error-price"); 
%>

<!DOCTYPE html>
<html lang="en">
 				
<head>
 	<meta charset="UTF-8">
 	<meta content="IE=edge" http-equiv="X-UA-Compatible">
 	<meta content="width=device-width, initial-scale=1.0" name="viewport">
 	<title>AddProduct - JSP</title>
 	<%-- CSS bootstrap 3.0 --%> 
 	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap-theme.min.css">
 	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/sticky-footer.css">
 	<link rel="stylesheet" href="<%= application.getContextPath() %>/css/style.css">					
</head>
 					
<body>

<div id="wrap">
    
	<%@include file="/WEB-INF/template/header.jsp" %>
	
	<section id="main-container" class="container">
		<div class="page-header">
			<h1>Add Product <small>Fill product fields</small></h1>
		</div>
		<form class="form-horizontal" action="addProduct" method="post">
		
			<div class="row form-group <%= (nameError != null)? "has-error" : "" %>">	
				<div class="form-group input-group col-xs-6">
					<span class="input-group-addon label-fix"><label for="product-name" class="control-label">Name</label></span>
					<input type="text" name="product-name" id="product-name" class="form-control" value="<%= (name != null)? name : ""%>" required="required"/>
				</div>
				<div class="col-xs-6">
					<% if(nameError != null) { %>
						<span class="help-block"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <%= nameError %></span>
					<% } %>
				</div>
			</div>
			
			<div class="row form-group <%= (contentError != null)? "has-error" : "" %>">	
				<div class="form-group input-group col-xs-6">
					<span class="input-group-addon label-fix"><label for="product-content" class="control-label">Description</label></span>
					<input type="text" name="product-content" id="product-content" class="form-control" value="<%= (content != null)? content : ""%>" required="required"/>
				</div>
				<div class="col-xs-6">
					<% if(contentError != null) { %>
						<span class="help-block"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <%= contentError %></span>
					<% } %>
				</div>
			</div>
			
			<div class="row form-group <%=(priceError != null)? "has-error" : "" %>">
				<div class="form-group input-group col-xs-6">
					<span class="input-group-addon label-fix"><label for="product-price" class="control-label">Price</label></span>
					<input type="number" step="0.01" min="0" max="1000000" name="product-price" id="product-price" class="form-control" value="<%= (price != null)? price : ""%>" placeholder="0.00" required="required"/>
					<span class="input-group-addon">€</span>					
				</div>
				<div class="col-xs-6">
					<% if(priceError != null) { %>
						<span class="help-block"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <%= priceError %></span>
					<% } %>
				</div>
			</div>
			
			<div class="form-group">
			     <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>&nbsp; Add</button>
		  	</div>
		
		</form>
		
</section>

<div id="push"></div>

</div>
	
<%@include file="/WEB-INF/template/footer.jsp" %>

</body>
</html>