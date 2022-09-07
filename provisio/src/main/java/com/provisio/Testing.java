package com.provisio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Testing
 */
@WebServlet("/testing")
public class Testing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Testing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: GET").append(request.getContextPath());
	
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String group = request.getParameter("group");
		String pass = request.getParameter("pass");
		
		System.out.println("POST: name: " + name);
		System.out.println("POST: group: " + group);
		System.out.println("POST: pass: " + pass);
		// do logic and save to database etc.
				
		
		// Then forward the request to a page that includes the parameter data if you want 
		// or just send to a thank you page.
		request.getRequestDispatcher("/register.jsp").forward(request, response); 
		return;
		
//		doGet(request, response);
	}

}
