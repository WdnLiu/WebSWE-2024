package models;


import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import utils.DBManager;
import java.sql.*;
import java.time.LocalDate;
import java.time.Period;

public class User implements java.io.Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String user = "";
	private String name = "";
	private String pwd = "";
	private String mail = "";
	private String born = null;
	private String pref = "";
	private String favSong = "";
	private String favSinger = "";
	
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
		String user_lower=user.toLowerCase();
		String regex = "^[a-z0-9]{1,255}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(user_lower);
        try {
    		if (matcher.matches()) {
    			PreparedStatement q = database.prepareStatement("SELECT * FROM Users WHERE (usr = ?);");
    			q.setString(1, user_lower);
    			ResultSet result = q.executeQuery();
    			if (result.next()) errors.put("user","User already exists");
    			else this.user = user_lower;
    		} else {
    			errors.put("user","Error in the username.");
    			System.out.println("Error in the username:");
    		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("user: " + user_lower);
	}
	
	public void setUserLogin(String userLogin) {
		/* We can simulate that a user with the same name exists in our DB and mark error[0] as true  */
		/* TODO: validate logical specifications and check uniquiness in DB */
		String user_lower=userLogin.toLowerCase();
		String regex = "^[a-z0-9]{1,255}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(user_lower);
        try {
    		if (matcher.matches()) {
    			PreparedStatement q = database.prepareStatement("SELECT * FROM Users WHERE (usr = ?);");
    			q.setString(1, user_lower);
    			ResultSet result = q.executeQuery();
    			if (result.next()) {
    				this.user = user_lower;
    				this.name = result.getString("name");
    				errors.put("login","Login Failed: Password is incorrect");
    			}
    			else errors.put("userLogin","User does not exist"); 
    			System.out.println("User does not exist:");
    		} else {
    			errors.put("userLogin","Error in the username.");
    			System.out.println("Error in the username:");
    		}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		this.user = user_lower;
		System.out.println(this.user);
		
	}
	
	public String getUserLogin() {
		return user;
	}
	
	public void forceSetUser(String user) {
		this.user = user;
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
				PreparedStatement q = database.prepareStatement("SELECT * FROM Users WHERE mail = ?;");
				q.setString(1, mail);
				ResultSet result = q.executeQuery();
				if (result.next()) errors.put("mail","Mail already used!");
				else this.mail = mail;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			errors.put("mail","Error in the mail.");
			System.out.println("Error in the mail:");
		}
		System.out.println(mail);
	}
	public void forceSetMail(String mail) {
		this.mail = mail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		String regex = "^.{1,255}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(name);
		if (matcher.matches()) {
			this.name = name;
		} else {
			errors.put("name","Length of the name should be below 255.");
			System.out.println("Error in the name:");
		}
		System.out.println(name);
	}

	public String getPref() {
		return pref;
	}

	public void setPref(String pref) {
		this.pref = pref;
	}

	public String getFavSong() {
		return favSong;
	}

	public void setFavSong(String favSong) {
		this.favSong = favSong;
	}

	public String getFavSinger() {
		return favSinger;
	}

	public void setFavSinger(String favSinger) {
		this.favSinger = favSinger;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getPwd() {
		return this.pwd;
	}
	
	public void setPwd(String pwd) {
		String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z@$!%*?&\\d]{6,}$";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(pwd);
		if (matcher.matches()) {
			this.pwd = pwd;
		} else {
			errors.put("pwd","Error in the password.");
			System.out.println("Error in the password:");
		}
		System.out.println(pwd);
	}

	public String getBorn() {
		return born;
	}

    public void setBorn(String born) {
    	LocalDate date = LocalDate.parse(born);
    	LocalDate curr = LocalDate.now();
        Period agePeriod = Period.between(date, curr);
        int age = agePeriod.getYears();
        if (age < 16) {
            errors.put("born", "You must be over 16!");
            System.out.println("Must be over 16:");
        } else {
        	this.born = born;
        }
        System.out.println(born);
    }
	
    
	public String getAllUsers() {
		String returnValue = "";
		try {
			returnValue += "<table border='1'>"
					+ "<tr><th>nom</th>"
					+ "<th>usuari</th>"
					+ "<th>mail</th>"
					+ "<th>data</th>"
					+ "<th>contrasenya</th>"
					+ "<th>cantant</th>"
					+ "<th>canço</th>"
					+ "<th>genere</th>"
					+ "</tr>";
			PreparedStatement query = database.prepareStatement("SELECT * FROM Users;");
			ResultSet result = query.executeQuery();
			while (result.next()) {
                String nom = result.getString("name"); 
                String usuari = result.getString("usr");
                String email = result.getString("mail");
                String birthdate = result.getString("date");
                String pass = result.getString("pwd");
                String favsing = result.getString("fav_singer");
                String favsong = result.getString("fav_song");
                String genre = result.getString("pref_genre");

                
                returnValue += "<tr>"
                		+ "<td>" + nom + "</td>" 
                		+ "<td>" + usuari + "</td>"
                		+ "<td>" + email + "</td>"
                		+ "<td>" + birthdate + "</td>"
                		+ "<td>" + pass + "</td>"
                		+ "<td>" + favsing + "</td>"
                		+ "<td>" + favsong + "</td>"
                		+ "<td>" + genre + "</td>"
                		+ "</tr>";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		returnValue+= "</table>";
		return returnValue;
	}
    
	
	public HashMap<String, String> getErrors() {
		return this.errors;
	}
	
	public void addErrors(String att, String err) {
		errors.put(att,err);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
		
}
