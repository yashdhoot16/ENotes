<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<%@include file="all_component/allcss.jsp"%>
<style>
* {
	font-family: Verdana, sans-serif;
}

.bg-img {
	background: url("img/Reg.jpg");
	width: 100%;
	height: 100vh;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}


</style>
</head>
<body>
	<div class="container-fluid bg-img">
		<%@include file="all_component/navbar.jsp"%>
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5 mb-6 transparent-card">
					<div class="card-header text-center text-black">
						<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
						<h2>Registration</h2>
					</div>



					<%
					String regMsg = (String) session.getAttribute("reg-success");

					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=regMsg%>Login<a
							href="login.jsp">Click here</a>
					</div>
					<%
					session.removeAttribute("reg-success");
					}
					%>

					<%
					String failedMsg = (String) session.getAttribute("failed-msg");

					if (failedMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=failedMsg%><a href="login.jsp">  login..</a></div>
					<%
					session.removeAttribute("failed-msg");
					}
					%>


					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="form-group">
								<label>Enter your full name</label> <input type="name"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="fname">
							</div>
							<div class="form-group">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail">
							</div>
							<div class="form-group">
								<label>Enter Password</label> <input type="password"
									class="form-control" id="exampleInputPassword1"
									name="upassword">
							</div>
							<button type="submit"
								class="btn btn-secondary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="all_component/footer.jsp"%>


</body>
</html>