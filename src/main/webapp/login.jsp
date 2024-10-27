<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Login Page</title>
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
						<i class="fa fa-sign-in fa-2x" aria-hidden="true"></i>
						<h2>Login Page</h2>
					</div>

					<%
					String invalidMsg = (String) session.getAttribute("login-failed");

					if (invalidMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=invalidMsg%></div>

					<%
					session.removeAttribute("login-failed");
					}
					%>
					
					<%
					String withOutLogiMsg = (String) session.getAttribute("login-error");

					if (withOutLogiMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=withOutLogiMsg%></div>

					<%
					session.removeAttribute("login-error");
					}
					%>
					
					
					<%
					String logOutMsg = (String) session.getAttribute("logoutMsg");

					if (logOutMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=logOutMsg%></div>

					<%
					session.removeAttribute("logoutMsg");
					}
					%>
					
					
					
		


					<div class="card-body">
						<form action="loginServlet" method="post">
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
								class="btn btn-secondary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>