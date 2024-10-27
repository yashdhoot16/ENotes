<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.User.UserDetails"%>
<%
UserDetails user2 = (UserDetails) session.getAttribute("userD");
if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HomePage</title>
<%@include file="all_component/allcss.jsp"%>

<style>
* {
	font-family: Verdana, sans-serif;
}

html, body {
	height: 100%;
	margin: 0;
}

body {
	display: flex;
	flex-direction: column;
}

.container-fluid {
	flex: 1;
}

.row img {
	height: 40vh;
	max-width: 500px;
}

.navbar {
	background-color: #574e42;
}
</style>
</head>
<body>
	<div>
		<%@include file="all_component/navbar.jsp"%>
	</div>
	<div class="container-fluid">
		<div class="row text-center py-5">
			<div class="col-md-12">
				<img src="img/paperpencil.png">
				<h1 class="mt-5">Start Taking Your Notes...</h1>
				<a href="addNotes.jsp" class="btn btn-outline-primary mt-2">Start
					Here</a>
			</div>
		</div>

	</div>
	<div class="mt-5">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>