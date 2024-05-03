package models;


import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import utils.DBManager;
import java.sql.*;
import java.time.LocalDate;
import java.time.Period;

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
			e.printStackTrace();
		}
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


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
		this.pwd = pwd;
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
            errors.put("birthday", "Your age is not allowed");
            this.born = born;
        } 
        System.out.println(born);
    }

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public HashMap<String, String> getErrors() {
		return this.errors;
	}
		
}
