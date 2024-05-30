package managers;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.User;
import utils.DBManager;

public class UserManager {
    
    /*TODO: uncomment and adapt DB code*/
    
    private DBManager db = null ;
    
    public UserManager() {
        db = new DBManager();
    }
    
    public void finalize() {
        db.finalize();
    }
        
    // Add a new user
    public void addUser(User user) {
        String query = "INSERT INTO Users (name,usr,mail,date_of_birth,pwd,fav_singer,fav_song,pref_genre) VALUES (?,?,?,?,?,?,?,?)";
        
        PreparedStatement statement = null;
        try {
            statement = db.prepareStatement(query);
            statement.setString(1,user.getName());
            statement.setString(2,user.getUser());
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
        
        try {
            statement = db.prepareStatement("SELECT user_id FROM Users WHERE usr = ?;");
            statement.setString(1, user.getUser());
            ResultSet result = statement.executeQuery();
            if (result.next()){
            	user.setId(result.getInt("user_id"));
            	System.out.println(user.getId());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean checkUserNotRepeat(User user) {
        try {
			PreparedStatement q = db.prepareStatement("SELECT * FROM Users WHERE (usr = ? || mail = ?);");
			q.setString(1, user.getUser());
			q.setString(2, user.getMail());
			ResultSet result = q.executeQuery();
			if (result.next()) {
				if (result.getString("usr") == user.getUser()) {
					user.addErrors("user","User already exists");
					user.forceSetUser("");
				}
				if (result.getString("mail") == user.getMail()) {
					user.addErrors("mail","Mail already used!");
					user.forceSetMail("");
				}
				System.out.println(result.getString("usr") + "  " + result.getString("mail"));
				return false;
			}
			else {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
        return false;
    }
    
    public boolean checkUserValidity(User user) {
        try {
            PreparedStatement query = db.prepareStatement("SELECT * FROM Users WHERE usr = ? AND pwd = ?;");
            query.setString(1, user.getUser());
            query.setString(2, user.getPwd());
            ResultSet result = query.executeQuery();
            if (result.next()){
            	System.out.println("User was Valid");
            	user.setId(result.getInt("id"));
            	System.out.println(user.getId());
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("User was Not Valid");
        return false;
    }
    
    
    /*Check if all the fields are filled correctly */
    public boolean isRegisterComplete(User user) {
        return(hasValue(user.getUser()) &&
                   hasValue(user.getMail()) &&
                   hasValue(user.getPwd()) && 
                   hasValue(user.getName()) &&
                   hasValue(user.getBorn()));
        }
    
    
    public boolean isLoginComplete(User user) {
        return(hasValue(user.getUser()) &&
                   hasValue(user.getPwd()));
    }

    
    private boolean hasValue(String val) {
        return((val != null) && (!val.equals("")));
    }
    
    public User getUserByUsername(String username) {
        User user = null;
        String query = "SELECT * FROM Users WHERE usr = ?";
        try {
            PreparedStatement statement = db.prepareStatement(query);
            statement.setString(1, username);
            ResultSet result = statement.executeQuery();
            if (result.next()) {
                user = new User();
                user.setId(result.getInt("id"));
                user.setName(result.getString("name"));
                user.setUser(result.getString("usr"));
                user.setMail(result.getString("mail"));
                user.setBorn(result.getString("date_of_birth"));
                user.setFavSinger(result.getString("fav_singer"));
                user.setFavSong(result.getString("fav_song"));
                user.setPref(result.getString("pref_genre"));
            }
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    
}