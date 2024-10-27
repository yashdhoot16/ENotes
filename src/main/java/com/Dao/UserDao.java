package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.User.UserDetails;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	// Method to check if a user with the given email already exists
	public boolean userExists(String email) {
		boolean exists = false;
		try {
			String query = "SELECT 1 FROM user WHERE email = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			exists = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return exists;
	}

	public boolean addUser(UserDetails ud) {
		try {

			String query = "insert into user(name,email,password) values(?,?,?)";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, ud.getName());
			ps.setString(2, ud.getEmail());
			ps.setString(3, ud.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public UserDetails loginUser(UserDetails ud) {
		UserDetails user = null;
		try {
			String query = "select * from user where email=? and password=?";

			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, ud.getEmail());
			ps.setString(2, ud.getPassword());
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user = new UserDetails();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}

	// Method to retrieve and print all user records
	public void printAllUsers() {
		List<UserDetails> users = new ArrayList<>();
		try {
			String query = "SELECT * FROM user";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				UserDetails user = new UserDetails();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// Print user records to the console
		System.out.println("All Records:");
		for (UserDetails user : users) {
			System.out.println(" ID: " + user.getId() + ", Name: " + user.getName() + ", Email: " + user.getEmail() + ", Password: " + user.getPassword());
		}
	}

}
