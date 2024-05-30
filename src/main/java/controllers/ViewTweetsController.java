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

/**
 * Servlet implementation class ViewTweetsController
 */
@WebServlet("/ViewTweetsController")
public class ViewTweetsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewTweetsController() {
        super();

        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String view = "ViewTweetsNotLogged.jsp"; 
		
		
		System.out.print("ViewTweetsController: ");
		
		HttpSession session = request.getSession();

		if (session.getAttribute("user")!=null) {
			System.out.println("forwarding to ViewTweets");
			view = "ViewTweets.jsp";
		}
		else {
			
			System.out.println("forwarding to ViewTweetsNotLogged ");
			
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
