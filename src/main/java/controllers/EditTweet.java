package controllers;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;

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
 * Servlet implementation class AddTweetFromUser
 */
@WebServlet("/EditTweet")
public class EditTweet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTweet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EditTweet: ");
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("login");
		Tweet tweet = new Tweet();
		ManageTweets tweetManager = new ManageTweets();
		UserManager userManager = new UserManager();
		
		try {
			if (user != null)
			    System.out.print("UserID: ");
			    System.out.println(user.getId());
			    BeanUtils.populate(tweet, request.getParameterMap());
			    System.out.print("ID: " + tweet.getId() + " New tweet Content: " + tweet.getContent());
			    System.out.println(" From user: " + user.getId());
			    tweet.setPostDateTime(new Timestamp(System.currentTimeMillis()));
			    if(userManager.isAdmin(user.getId())) {
			    	tweetManager.editTweetAdmin(tweet.getContent(), tweet.getId());
			    } else {
				    tweetManager.editTweet(tweet.getContent(), tweet.getId(), user.getId());
			    }
			    


		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
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