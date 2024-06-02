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

import managers.ManageTweets;
import models.Tweet;
import models.User;

/**
 * Servlet implementation class ViewTweetsController
 */
@WebServlet("/ViewOwnTweetsController")
public class ViewOwnTweetsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewOwnTweetsController() {
        super();

        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String view = "ViewTweetsNotLogged.jsp"; 
		List<Tweet> tweets = Collections.emptyList();
		System.out.print("ViewOwnTweetsController: ");
		
		HttpSession session = request.getSession(false);

		User user = (User) session.getAttribute("login");

		if (session != null || user != null) {
			System.out.println("forwarding to ViewTweets");
			view = "ViewTweets.jsp";

			ManageTweets tweetManager = new ManageTweets();
			tweets = tweetManager.getUserTweets(user.getId(),0,4);
			for (Tweet t : tweets) {
				System.out.println("username:" + t.getUser().getUser());
			}
			tweetManager.finalize();
		}
		request.setAttribute("tweets",tweets);
		request.setAttribute("login",user);
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
