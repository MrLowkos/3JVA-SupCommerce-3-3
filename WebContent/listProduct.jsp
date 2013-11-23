<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.supinfo.sun.supcommerce.bo.SupProduct"%>   
<%@ page import="com.supinfo.sun.supcommerce.doa.SupProductDao"%>
<%@ page import="java.util.List"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<c:set var="errorMessage" value="No product registered !"/>

<% final List<SupProduct> products = SupProductDao.getAllProducts(); %>
<% request.setAttribute("products", products); %>

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
 	<link rel="stylesheet" href="<c:url value="/css/style.css"/>" >					
</head>
 					
<body>

<jsp:include page="/WEB-INF/template/header.jsp">
	<jsp:param name="rootPath" value="${pageContext.servletContext.contextPath}" />
</jsp:include>

<section id="main-container" class="container">
	<div class="row">
		<h1 class="col-sx-12 col-sm-12 col-md-12 col-lg-12">Product List</h1>
		<c:choose>
			<c:when test="${empty products}">
				<div class="alert alert-danger col-sx-12 col-sm-12 col-md-12 col-lg-12">
					<h3><span class="glyphicon glyphicon-warning-sign"></span>&nbsp; <c:out value="${errorMessage}"/></h3>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="p" items="${products}">
					<div class="col-sx-12 col-sm-6 col-md-4 col-lg-3">
						<article class="panel panel-primary">												
							<header class="panel-heading">
								<form class="pull-right" action="<c:url value="/auth/removeProduct?id=${p.id}"/>" method="post">
									<button type="submit" class="close" >&times;</button>
								</form>
								<h3>
									<a href="<c:url value="/showProduct.jsp?id=${p.id}"/>" >
										<span class="glyphicon glyphicon-tag"></span>&nbsp; Product Id: <c:out value="${p.id}"/>
									</a>
								</h3>
							</header>
							<section class="panel-body">
						       <p>Product name: <c:out value="${p.name}"/></p>
						       <p class="description">Product description: <c:out value="${p.content}"/></p>
						       <p>Product price: <fmt:formatNumber value="${p.price}" type="currency"/></p>
						    </section>
					    </article>
				   </div>
			   </c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</section>

<jsp:include page="/WEB-INF/template/footer.jsp"/>

</body>
</html>