<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<title>Login | SupCommerce</title>
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
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<form class="form-horizontal" action="login" method="post">
				<div class="form-group">
					<label for="username" class="col-xs-2 control-label">Username</label>
					<div class="col-xs-4 ">
						<input type="text" name="username" id="username" class="form-control" placeholder="Enter a username"/>
					</div>
				</div>
				<div class="form-group">
				    <div class="col-xs-offset-2 col-xs-10">
						<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-log-in"></span>&nbsp; LogIn</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
						
<jsp:include page="/WEB-INF/template/footer.jsp"/>

</body>					
</html>