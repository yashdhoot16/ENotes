<%@page import="com.User.UserDetails"%>
<style>
* {
	font-family: Verdana, sans-serif;
}
</style>
<nav
	class="navbar navbar-expand-lg navbar-dark shadow-5-strong navbar-custom">
	<a href="index.jsp" class="navbar-brand"><i class="fa fa-book"
		aria-hidden="true"></i> ENotes</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse navbar-inner"
		id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i
					class="fa fa-home" aria-hidden="true"></i> Home <span
					class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="addNotes.jsp"><i
					class="fa fa-plus-circle" aria-hidden="true"></i> Add Notes</a></li>
			<li class="nav-item"><a class="nav-link" href="showNotes.jsp"><i
					class="fa fa-address-book-o" aria-hidden="true"></i> Show Notes</a></li>
		</ul>
		<%
		UserDetails user = (UserDetails) session.getAttribute("userD");
		if (user != null) {
		%>
		<a href="#" class="btn btn-light my-2 my-sm-0 mr-2"
			data-toggle="modal" data-target="#exampleModal" type="button"><i
			class="fa fa-user-circle-o" aria-hidden="true"></i> <%=user.getName()%></a>
		<a href="LogoutServlet" class="btn btn-light my-2 my-sm-0"
			type="button"><i class="fa fa-sign-out" aria-hidden="true"></i>
			Logout</a>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container">
							<i class="fa fa-user fa-3x"></i>
							<table class="table"> 
								<tbody>
									<tr>
										<th>User ID</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th>Full Name</th>
										<td><%=user.getName()%></td>
									</tr>
									<tr>
										<th>Email ID</th>
										<td><%=user.getEmail()%></td>
									</tr>
								</tbody>
							</table>
							<div>
								<button type="button" class="btn btn-outline-primary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
		} else {
		%>
		<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
			type="button"><i class="fa fa-sign-in" aria-hidden="true"></i>
			Login</a> <a href="register.jsp" class="btn btn-light my-2 my-sm-0"
			type="button"><i class="fa fa-user-plus" aria-hidden="true"></i>
			Register</a>
		<%
		}
		%>
	</div>
</nav>
