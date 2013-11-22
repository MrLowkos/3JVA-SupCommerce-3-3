<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
Boolean logged = false;

if(session.getAttribute("username") != null && session.getAttribute("username") instanceof String)
	logged = true;
%>
    
<div id="header" class="navbar navbar-fixed-top navbar-inverse">
	<div class="container">
		<header class="navbar-header">
			<button class="navbar-toggle collapsed" data-target=".navbar-collapse" data-toggle="collapse" type="button">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${param.rootPath}/">SupCommerce 3.3</a>
		</header>
		<nav class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<% if(logged) { %>
					<li class="active"><a href="${param.rootPath}/listProduct.jsp"><span class="glyphicon glyphicon-home"></span>&nbsp; ${sessionScope.username}</a></li>
				<% }
				else { %>
					<li><a href="${param.rootPath}/"><span class="glyphicon glyphicon-home"></span>&nbsp; Home</a></li>
				<% } %>
				<li><a href="${param.rootPath}/listProduct.jsp"><span class="glyphicon glyphicon-list"></span>&nbsp; Products List</a></li>
				<% if(logged) { %>
					<li><a href="${param.rootPath}/auth/basicInsert"><span class="glyphicon glyphicon-random"></span>&nbsp; Random Product</a></li>
					<li><a href="${param.rootPath}/auth/addProduct"><span class="glyphicon glyphicon-plus"></span>&nbsp; Add Product</a></li>
				<% } %>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<% if(logged) { %>
					<li class="rigth"><a href="${param.rootPath}/logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp; Logout</a></li>
				<% }
				else  {%>
					<li class="rigth"><a href="${param.rootPath}/login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp; Login</a></li>
				<% } %>
			</ul>
		</nav>
	</div>
</div>