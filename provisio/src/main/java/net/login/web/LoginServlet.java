package net.login.web;

import com.security.AES;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.login.bean.LoginBean;
import net.login.database.LoginDao;

/**
 * @email Jimmy Easter
 */

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao loginDao;

	public void init() {
		loginDao = new LoginDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(AES.encrypt(password));

		try {
			if (loginDao.validate(loginBean)) {
				String userId = loginDao.getUserID(loginBean);
				System.out.println("LoginDao: (userId): " + userId);
				request.setAttribute("userId", userId);
				request.setAttribute("username", username);
				request.setAttribute("authenticated", "true");
				getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
			} else {
				request.setAttribute("username", username);
				request.setAttribute("authenticated", "false");
				getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
