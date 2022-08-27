package provisio;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProvisioServlet
 */
@WebServlet(name="/ProvisioServlet", urlPatterns = {
		"",
		"/",
		"/about",
		"/locations",
		"/login",
		"/lookup",
		"/register",
		"/reservation",
		"/rewards",
		"/summary"
		}
)
public class ProvisioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String p = request.getRequestURI();
		String cp = getServletContext().getContextPath();
		System.out.println("Served: RequestURI: " + p);
		System.out.println("Served: ContextPath: " + cp);
		String url = request.getContextPath();
		
		if (p.equals("/") || p.equals("")) {
			request.setAttribute("page", "home");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		
		if (p.equals("/about")) {
			request.setAttribute("page", "about");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		
		if (p.equals("/locations")) {
			request.setAttribute("page", "locations");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		
		if (p.equals("/login")) {
			request.setAttribute("page", "login");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		
		if (p.equals("/lookup")) {
			request.setAttribute("page", "lookup");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		
		if (p.equals("/register")) {
			request.setAttribute("page", "register");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		
		if (p.equals("/reservation")) {
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		
		if (p.equals("/rewards")) {
			request.setAttribute("page", "rewards");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		
		if (p.equals("/summary")) {
			request.setAttribute("page", "summary");
			getServletContext().getRequestDispatcher("/index.jsp").forward(request,response);
		}
		
		
		getServletContext().getRequestDispatcher("/404.jsp").forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
