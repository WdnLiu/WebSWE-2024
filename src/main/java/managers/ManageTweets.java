package managers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import models.Tweet;
import utils.DBManager;


public class ManageTweets {
	
	private DBManager db = null ;
	
	public ManageTweets() {
		try {
			db = new DBManager();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void finalize() {
		try {
			db.finalize();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
	
	/* Add a tweet */
	public void addTweet(Tweet tweet) {
		String query = "INSERT INTO Tweets (tweet_id,parent_id,user_id,post_time,title,content) VALUES (?,?,?,?,?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setInt(1,tweet.getId());
	        if (tweet.getPid() == 0) {
	            statement.setNull(2, java.sql.Types.INTEGER);
	        } else {
	            statement.setInt(2, tweet.getPid());
	        }
			statement.setInt(3,tweet.getUid());
			statement.setTimestamp(4,tweet.getPostDateTime());
			statement.setString(5,tweet.getContent());
			statement.setString(6,tweet.getContent());
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/* Delete existing tweet */
	public void deleteTweet(Integer id,Integer uid) {
		String query = "DELETE FROM Tweets WHERE id = ? AND uid=?";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setInt(1,id);
			statement.setInt(2,uid);
			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	/* Get tweets from a user given start and end*/
	public List<Tweet> getUserTweets(Integer uid,Integer start, Integer end) {
		 String query = "SELECT Tweets.id,Tweets.uid,Tweets.postdatetime,Tweets.content,Users.name FROM Tweets INNER JOIN Users ON Tweets.uid = Users.id where Tweets.uid = ? ORDER BY Tweets.postdatetime DESC LIMIT ?,? ;";
		 PreparedStatement statement = null;
		 List<Tweet> l = new ArrayList<Tweet>();
		 try {
			 statement = db.prepareStatement(query);
			 statement.setInt(1,uid);
			 statement.setInt(2,start);
			 statement.setInt(3,end);
			 ResultSet rs = statement.executeQuery();
			 while (rs.next()) {
				 Tweet tweet = new Tweet();
       		     tweet.setId(rs.getInt("id"));
				 tweet.setUid(rs.getInt("uid"));
				 tweet.setPostDateTime(rs.getTimestamp("postdatetime"));
				 tweet.setContent(rs.getString("content"));
				 tweet.setTitle(rs.getString("name"));
				 l.add(tweet);
			 }
			 rs.close();
			 statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return  l;
	}
	
	
}