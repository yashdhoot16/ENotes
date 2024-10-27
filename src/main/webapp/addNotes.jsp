<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");
if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
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

.container {
	flex: 1;
}

.navbar {
	background-color: #574e42;
}
</style>
</head>
<body>
	<%@page import="com.User.UserDetails"%>
	<div>
		<%@include file="all_component/navbar.jsp"%>
	</div>
		<div class="container py-5">
			<h1 class="text-center">Add you notes..</h1>
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
						<div class="form-group">

							<%
							UserDetails ud = (UserDetails) session.getAttribute("userD");
							if (ud != null) {
							%>
							<input type="hidden" value=<%=ud.getId()%> name="uid">
							<%
							}
							%>

							<label for="exampleInputEmail1">Enter Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter title here"
								name="title" required="required">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Content</label>
							<textarea rows="9" cols="" class="form-control"
								placeholder="Enter your content here" name="content"
								required="required"></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Add
								Notes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	<div class="mt-5">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>