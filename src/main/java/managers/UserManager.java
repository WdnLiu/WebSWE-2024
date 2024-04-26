package managers;


import java.sql.PreparedStatement;
import java.sql.SQLException;

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
		String query = "INSERT INTO users (usr,mail,gender,pwd) VALUES (?,?,?,?)";
		PreparedStatement statement = null;
		try {
			statement = db.prepareStatement(query);
			statement.setString(1,user.getUser());
			statement.setString(2,user.getMail());
			statement.setString(3,user.getGender());
			statement.setString(4,user.getPwd());
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
	    	   hasValue(user.getGender()) &&
	    	   hasValue(user.getPwd()) );
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
	
}
