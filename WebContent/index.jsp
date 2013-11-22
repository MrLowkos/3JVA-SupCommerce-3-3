<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Welcome to SupCommerce | SupCommerce</title>
	<!-- CSS bootstrap 3.0 --> 
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
		<div class="jumbotron">
			<h1>Welcome to SupCommerce<br/>
			<small>A product's manager site.</small></h1>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/template/footer.jsp"/>

</body>			
</html>