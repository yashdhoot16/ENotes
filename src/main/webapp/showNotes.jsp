<%@page import="com.User.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.Dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");
if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("login-error", "Please login...");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="all_component/allcss.jsp"%>
<style>
* {
	font-family: Verdana, sans-serif;
}

.row img {
	height: 30vh;
	max-width: 500px;
}

.navbar {
	background-color: #574e42;
}

p {
	font-size: 12px;
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
</style>
</head>
<body>
	<div>
		<%@include file="all_component/navbar.jsp"%>
	</div>
	<%
	String updateMsg = (String) session.getAttribute("UpdateMsg");
	if (updateMsg != null) {
	%>
	<div class="alert alert-success text-center" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("UpdateMsg");
	}
	%>
	
	<%
	String deleteMsg = (String) session.getAttribute("DeleteMsg");
	if (deleteMsg != null) {
	%>
	<div class="alert alert-success text-center" role="alert"><%=deleteMsg%></div>
	<%
	session.removeAttribute("DeleteMsg");
	}
	%>
	
	<%
	String wrongMsg = (String) session.getAttribute("wrongMsg");
	if (wrongMsg != null) {
	%>
	<div class="alert alert-danger text-center" role="alert"><%=wrongMsg%></div>
	<%
	session.removeAttribute("wrongMsg");
	}
	%>
	<div class="container p-0">
		<h2 class="text-center mt-3">All Notes</h2>
		<div class="row">
			<div class="col-md-12">
				<%
				if (user3 != null) {
					PostDao PD = new PostDao(DBConnection.getConnection());
					List<Post> post = PD.getData(user3.getId());
					for (Post po : post) {
				%>
				<div class="card mt-3">
					<img src="img/paperpencil.png" class="mt-2 mx-auto"
						style="max-width: 300px;">
					<div class="card-body p-4">
						<h6 class="card-title">
							<strong><%=po.getTitle()%></strong>
						</h6>
						<p><%=po.getContent()%></p>

						<p>
							<b class="text-success">Published By: <%=user3.getName()%></b></br> <b
								class="text-primary"></b>
						</p>

						<p>
							<b class="text-success">Published Date: <%=po.getPdate()%></b></br> <b
								class="text-success"></b>
						</p>

						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=po.getId()%>" class="btn btn-outline-danger mr-2">Delete</a> <a
								href="edit.jsp?note_id=<%=po.getId()%>"
								class="btn btn-outline-primary">Edit</a>
						</div>
					</div>
				</div>
				<%
				}

				}
				%>

			</div>

		</div>
	</div>
	<div class="mt-5">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>