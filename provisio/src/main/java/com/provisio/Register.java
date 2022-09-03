package com.provisio;

import com.security.AES;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet(description = "endpoint to register new users", urlPatterns = { "/register" })
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String firstName = request.getParameter("first-name");
		String lastName = request.getParameter("last-name");
		String email = request.getParameter("email");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String password = "";
		
		if (password1.equals(password2)) {
			 password = password1;
		} else {
			 password = "didNotMatch"; // return error but this should never happen b/c frontend validation.
		}
		
		  // Create String variables
//	    String originalString = "GeeksforGeeks";
//
//	    // Call encryption method
//	    String encryptedString = AES.encrypt(originalString);
//
//	    // Call decryption method
//	    String decryptedString = AES.decrypt(encryptedString);
//
//	    // Print all strings
//	    System.out.println(originalString);
//	    System.out.println(encryptedString);
//	    System.out.println(decryptedString);
		
		System.out.println("POST: firstName: " + firstName);
		System.out.println("POST: lastName: " + lastName);
		System.out.println("POST: email: " + email);
//		System.out.println("POST: password1: " + password1);
//		System.out.println("POST: password2: " + password2);
		System.out.println("POST: password: " + password);
		
		// create a new User object 
		User user = new User(firstName, lastName, email, AES.encrypt(password));
		
		// create register Dao
		RegisterDao rDao = new RegisterDao();
		String result = rDao.insert(user);
		response.getWriter().print(result);
		response.sendRedirect("/success.jsp");
		doGet(request, response);
	}

}
