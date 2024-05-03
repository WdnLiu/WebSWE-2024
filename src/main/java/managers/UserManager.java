package managers;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import models.User;
import utils.DBManager;

public class UserManager {
	
	private DBManager db = null ;
	
	public UserManager() {
		db = new DBManager();
	}
	
	public void finalize() {
		db.finalize();
	}
		
	// Add a new user
	public void addUser(User user) {
		String query = "INSERT INTO users (name,usr,mail,date,pwd,fav_singer,fav_song,pref_genre) VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user.getUser());
			statement.setString(2,user.getMail());
			statement.setString(3,user.getMail());
			statement.setString(4,user.getBorn());
			statement.setString(5,user.getPwd());
			statement.setString(6,user.getFavSinger());
			statement.setString(7,user.getFavSong());
			statement.setString(8,user.getPref());

			statement.executeUpdate();
			statement.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/*Check if all the fields are filled correctly */
	public boolean isComplete(User user) {
	    return(hasValue(user.getUser()) &&
	    	   hasValue(user.getMail()) &&
	    	   hasValue(user.getPwd()) &&
	    	   hasValue(user.getName()) &&
	    	   hasValue(user.getBorn()));
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
	private boolean hasValue(LocalDate val) {
		return((val != null));
	}
}
