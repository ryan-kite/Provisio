package com.provisio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Driver;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDao {
	private String dbUrl = "jdbc:mysql://localhost:3306/provisio?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
	private String dbUname = "provisio";
	private String dbPassword = "Provisio";
	private String dbDriver ="com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver) {
		try {
			Class.forName(dbDriver);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public String insert(User user) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Provisio: Data entered successfully.";
		String sql = "insert into customer(userName, CustPass, EmailAddress, FirstName, LastName) values(?,?,?,?,?)";
		
		PreparedStatement ps;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			ps.setString(4, user.getFirstName());
			ps.setString(5, user.getLastName());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Provisio: Data enter error.";
		}
		return result;
	}

}
