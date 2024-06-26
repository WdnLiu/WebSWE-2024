package controllers;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import managers.UserManager;
import models.User;

/**
 * Servlet implementation class GetFollows
 */
@WebServlet("/GetUsers")
public class GetUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUsers() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.print("GetUsers: ");
		List<User> users = Collections.emptyList();
		
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("login");

		if (session != null || user != null) {
		
			UserManager userManager = new UserManager();
			users = userManager.getUsers(0,4);
			userManager.finalize();
		
		}
		System.out.print("GetUsers: Viewing Users ");
		request.setAttribute("users",users);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ViewUsers.jsp"); 
		dispatcher.forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}