package controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import managers.UserManager;
import models.User;

@WebServlet("/ViewProfileController")
public class ViewProfileController extends HttpServlet {
	 
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("login");
        String view = "ViewProfile.jsp";
        if (user != null) {
            UserManager userManager = new UserManager();
    		System.out.println("forwarding to ViewProfile.jsp");
            System.out.println("User Details:");
            System.out.println("ID: " + user.getId());
            System.out.println("Name: " + user.getName());
            System.out.println("Username: " + user.getUser());
            System.out.println("Email: " + user.getMail());
            System.out.println("Date of Birth: " + user.getBorn());
            System.out.println("Favorite Singer: " + user.getFavSinger());
            System.out.println("Favorite Song: " + user.getFavSong());
            System.out.println("Preferred Genre: " + user.getPref());
    		request.setAttribute("userInfo", user);

        } else {
            view = "ViewLoginForm.jsp";
			System.out.println("forwarding to ViewLoginForm.jsp");

        }
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
    }
}

/*
public class ViewProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String view = "ViewProfile.jsp";

        if (session.getAttribute("login") != null) {
    		System.out.println("forwarding to ViewProfile.jsp");

        } else {
            view = "ViewLoginForm.jsp";
			System.out.println("forwarding to ViewLoginForm.jsp");

        }
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
    }
}
 */