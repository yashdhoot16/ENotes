package com.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.DBConnection;
import com.Dao.PostDao;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		try 
		{
			PostDao PD = new PostDao(DBConnection.getConnection());
			boolean f = PD.AddNotes(title, content, uid);
			
			if(f)
			{
				System.out.println("Data inserted successfully..");
				response.sendRedirect("showNotes.jsp");
			}
			else {
				System.out.println("Data not inserted..");
			}
		} 
		catch (ClassNotFoundException | SQLException | IOException e) {
			
			e.printStackTrace();
		}
		

	}

}
