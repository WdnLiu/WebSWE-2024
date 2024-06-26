package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import managers.ManageTweets;
import managers.UserManager;
import models.Tweet;
import models.User;

/**
 * Servlet implementation class DelTweet
 */
@WebServlet("/DelTweet")
public class DelTweet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelTweet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("DelTweet: ");
		Tweet tweet = new Tweet();
		ManageTweets tweetManager = new ManageTweets();
		UserManager userManager = new UserManager();
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("login");

		try {
			if (session != null || user != null) {
				BeanUtils.populate(tweet, request.getParameterMap());
				System.out.println("Tweet" + tweet.getId() + "deleted");
				if (userManager.isAdmin(user.getId())) {
					tweetManager.deleteTweetAdmin(tweet.getId());
				} else {
					tweetManager.deleteTweet(tweet.getId(),user.getId());
				}
				
			}
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		tweetManager.finalize();
		userManager.finalize();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
