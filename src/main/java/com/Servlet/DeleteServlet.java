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
import com.Dao.PostDao;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			Integer id = Integer.parseInt(request.getParameter("note_id"));
			PostDao PD = new PostDao(DBConnection.getConnection());
			boolean f = PD.deleteNotes(id);
			HttpSession session = null;

			if (f) {
				session = request.getSession();
				session.setAttribute("DeleteMsg", "Notes deleted successfully..");
				response.sendRedirect("showNotes.jsp");
			} else {
				session = request.getSession();
				session.setAttribute("wrongMsg", "Error while deleting the data..");
				response.sendRedirect("showNotes.jsp");
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {

			e.printStackTrace();
		}

	}

}
