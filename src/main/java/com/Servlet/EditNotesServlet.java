package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.Dao.PostDao;

@WebServlet("/EditNotesServlet")
public class EditNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Integer noteid = Integer.parseInt(request.getParameter("noteid"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			PostDao PD = new PostDao(DBConnection.getConnection());
			boolean b = PD.PostUpdate(noteid, title, content);

			if (b) {
				System.out.println("Data updated successfully..");
				HttpSession session = request.getSession();
				session.setAttribute("UpdateMsg", "Notes updated successfully..");
				response.sendRedirect("showNotes.jsp");
			} else {
				System.out.println("Data not updated..");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
