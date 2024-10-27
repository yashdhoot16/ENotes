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

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		super.init();
		initializeDatabase();
	}

	private void initializeDatabase() {
		try {
			DBConnection.getConnection(); // Ensure the database and tables are created
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("fname");
		String email = request.getParameter("uemail");
		String password = request.getParameter("upassword");

		UserDetails ud = new UserDetails();
		ud.setName(name);
		ud.setEmail(email);
		ud.setPassword(password);

		try {
			UserDao UD = new UserDao(DBConnection.getConnection());

			HttpSession session = request.getSession();

			if (UD.userExists(email)) {
				session.setAttribute("failed-msg", "User with this email already exists..");
				response.sendRedirect("register.jsp");
			} else {
				boolean bool = UD.addUser(ud);

				if (bool) {
					session.setAttribute("reg-success", "Registration Successfully..");
					response.sendRedirect("register.jsp");

					// Call printAllUsers to print user data to the console
					UD.printAllUsers();

				} else {
					session.setAttribute("failed-msg", "Something went wrong on server...");
					response.sendRedirect("register.jsp");
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			response.sendRedirect("register.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}