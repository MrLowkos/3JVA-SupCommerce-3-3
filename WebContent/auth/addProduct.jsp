<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
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
 	<title>ListProduct - JSP</title>
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
		<h1 class="col-sx-12 col-sm-12 col-md-12 col-lg-12">Add Product</h1>
		
		<div class="col-sm-12 col-md-12 col-lg-12">
			<article class="panel panel-primary">
				<header class="panel-heading">
					<h4>Fill product's fields</h4>
				</header>
				<section class="panel-body">
					<form class="form-horizontal" action="addProduct" method="post">
						<div class="form-group <%= (nameError != null)? "has-error" : "" %>">
							<div class="col-xs-offset-2 col-xs-8">
								<div class="input-group">
									<span class="input-group-addon label-fix"><label for="product-name" class="control-label">Product Name</label></span>
									<input type="text" name="product-name" id="product-name" class="form-control" value="<%= (name != null)? name : ""%>" />
								</div>
							</div>
							<div class="col-xs-2">
								<% if(nameError != null) { %>
									<span class="help-block"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <%= nameError %></span>
								<% } %>
							</div>
						</div>
						<div class="form-group <%=(contentError != null)? "has-error" : "" %>">
							<div class="col-xs-offset-2 col-xs-8">
								<div class="input-group">
									<span class="input-group-addon label-fix"><label for="product-content" class="control-label">Product Description</label></span>
									<input type="text" name="product-content" id="product-content" class="form-control" value="<%= (content != null)? content : ""%>" />
								</div>								
							</div>
							<div class="col-xs-2">
								<% if(contentError != null) { %>
									<span class="help-block"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <%= contentError %></span>
								<% } %>
							</div>
						</div>
						<div class="form-group <%=(priceError != null)? "has-error" : "" %>">
							<div class="col-xs-offset-2 col-xs-8">
								<div class="input-group">
									<span class="input-group-addon label-fix"><label for="product-price" class="control-label">Product Price</label></span>
									<input type="number" step="0.01" min="0" max="1000000" name="product-price" id="product-price" class="form-control" value="<%= (price != null)? price : ""%>" />
									<span class="input-group-addon">€</span>
								</div>
							</div>
							<div class="col-xs-2">
								<% if(priceError != null) { %>
									<span class="help-block"><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <%= priceError %></span>
								<% } %>
							</div>
						</div>
						<div class="form-group">
						    <div class="col-xs-offset-2 col-xs-10">
						      	<button type="submit" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-plus"></span>&nbsp; Add</button>
						    </div>
					  	</div>						
					</form>
				</section>			
			</article>
		</div>
	</div>
</section>
	
<jsp:include page="/WEB-INF/template/footer.jsp"/>

</body>
</html>