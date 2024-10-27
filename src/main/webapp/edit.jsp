<%@page import="com.User.Post"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.Dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.User.UserDetails"%>
<%
UserDetails user4 = (UserDetails) session.getAttribute("userD");
if (user4 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Notes</title>
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
	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));
	PostDao PD = new PostDao(DBConnection.getConnection());
	Post p = PD.getDatabyId(noteid);
	%>

	<div>
		<%@include file="all_component/navbar.jsp"%>
	</div>
	<div class="container py-5">
		<h1 class="text-center">Edit your notes..</h1>
		<div class="row">
			<div class="col-md-12">
				<form action="EditNotesServlet" method="post">

					<input type="hidden" value="<%=noteid%>" name="noteid">
					<div class="form-group">
						<label for="exampleInputEmail1">Enter Title</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter title here"
							name="title" required="required" value="<%=p.getTitle()%>">
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Enter Content</label>
						<textarea rows="9" cols="" class="form-control"
							placeholder="Enter your content here" name="content"
							required="required"><%=p.getContent()%></textarea>
					</div>
					<div class="container text-center">
						<button type="submit" class="btn btn-outline-primary">Save
							Changes</button>
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