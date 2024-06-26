package controllers;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import managers.ManageTweets;
import models.Tweet;
import models.User;

/**
 * Servlet implementation class AddTweetFromUser
 */
@WebServlet("/AddTweet")
public class AddTweet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTweet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("login");
		Tweet tweet = new Tweet();
		ManageTweets tweetManager = new ManageTweets();

		
		try {
			if (user != null)
			    System.out.print("UserID: ");
			    System.out.println(user.getId());
			    BeanUtils.populate(tweet, request.getParameterMap());
			    tweet.setUid(user.getId());
			    tweet.setTitle(user.getName());
			    tweet.setPostDateTime(new Timestamp(System.currentTimeMillis()));
			    tweetManager.addTweet(tweet);
			    tweetManager.finalize();
			    System.out.println("Tweet Content: " + tweet.getContent());

		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}