package models;


import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import utils.DBManager;
import java.sql.*;

public class User implements java.io.Serializable {
	
	/*
	 CREATE TABLE `users` (
  		`usr` varchar(255) NOT NULL,
  		`mail` varchar(255) NOT NULL,
  		`pwd` varchar(255) NOT NULL,
  		PRIMARY KEY (`usr`),
  		UNIQUE KEY `mail` (`mail`)
	 ); 
	*/
	
	private static final long serialVersionUID = 1L;
	
	private String user = "";
	private String mail = "";
	private String gender = "";
	private String pwd = "";
	
	private DBManager database;
	
	private HashMap<String, String> errors;
	

	public User() {
		errors = new HashMap<String, String>();
		database = new DBManager();
	}
	
	public String getUser() {
		return this.user;
	}
	
	public void setUser(String user) {
		/* We can simulate that a user with the same name exists in our DB and mark error[0] as true  */
		/* TODO: validate logical specifications and check uniquiness in DB */
		
		try {
			PreparedStatement query = database.prepareStatement("SELECT * FROM users WHERE usr = ?;");
			query.setString(1, user);
			ResultSet result = query.executeQuery();
			if (result.next()) {
				errors.put("user", "Name already exists.");
				System.out.println("Name already exists.");
			}
			else {
				System.out.println(user);
				this.user = user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// errors.put("user", "Error in the name.");


	}
	
	public String getMail() {
		return this.mail;
	}
	
	public void setMail(String mail) {
		String regex = "^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(mail);
		if (matcher.matches()) {
			try {
				PreparedStatement query = database.prepareStatement("SELECT * FROM users WHERE mail = ?;");
				query.setString(1, mail);
				ResultSet result = query.executeQuery();
				if (result.next()) {
					errors.put("user", "Mail already exists.");
					System.out.println("Mail already exists.");
				}
				else {
					System.out.println(user);
					this.mail = mail;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(mail);
		} else {
			errors.put("mail","Error in the mail.");
			System.out.println(mail);
		}
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getGender() {
		return this.gender;
	}
	
	public String getPwd() {
		return this.pwd;
	}
	
	public void setPwd(String pwd) {
		/* TODO check restriction with pattern */
		this.pwd = pwd;
		System.out.println(pwd);
	}
	
	public HashMap<String,String> getErrors() {
		return errors;
	}
		
}
