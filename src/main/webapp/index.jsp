<%@page import="com.DB.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
* {
	font-family: Verdana, sans-serif;
}

.back-img {
	background: url("img/HomeScreenImage.jpg");
	width: 100%;
	height: 100vh;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid back-img">
		<%@include file="all_component/navbar.jsp"%>
		<div class="text-center mt-5 ">
			<h1 class="text-white">
				<i class="fa fa-book" aria-hidden="true"></i> ENotes - Save your
				notes...
			</h1>
			<a href="login.jsp" class="btn btn-light mr-1"><i
				class="fa fa-sign-in" aria-hidden="true"></i> Login</a> <a
				href="register.jsp" class="btn btn-light"><i
				class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>

</body>
</html>