package com.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.Dao.UserDao;
import com.User.UserDetails;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("uemail");
		String password = request.getParameter("upassword");

		UserDetails ud = new UserDetails();
		ud.setEmail(email);
		ud.setPassword(password);

		UserDao UD;
		try {
			UD = new UserDao(DBConnection.getConnection());
			UserDetails user = UD.loginUser(ud);

			if (user!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("userD", user);
				response.sendRedirect("home.jsp");
				UD.printAllUsers();
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("login-failed", "Invalid username or password");
				response.sendRedirect("login.jsp");

			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			e.printStackTrace();
		}

	}

}
