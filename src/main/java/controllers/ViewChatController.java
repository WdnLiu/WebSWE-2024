package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import managers.UserManager;

/**
 * Servlet implementation class ViewTweetsController
 */
@WebServlet("/ViewChatController")
public class ViewChatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewChatController() {
        super();

        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "ViewTweetsNotLogged.jsp"; 
		System.out.print("ViewChatController: ");

		HttpSession session = request.getSession(false);
		User usuario = (User) session.getAttribute("login");
		UserManager um = new UserManager();
		
		if (usuario!=null) {
			usuario = um.getForceUser(usuario.getId());
			System.out.println(usuario.getId());
			System.out.println(usuario.getUser());
			System.out.println("forwarding to ViewChat");
			view = "ViewChat.jsp";
		}
		else {
			System.out.println("forwarding to ViewTweetsNotLogged ");
		}
		request.setAttribute("usuario",usuario);
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		um.finalize();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
