package net.login.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.login.bean.LoginBean;

public class LoginDao {

	public boolean validate(LoginBean loginBean) throws ClassNotFoundException {
		boolean status = false;

		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/provisio?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC", "provisio", "Provisio");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from customer where UserName = ? and CustPass = ? ")) {
			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			
			status = rs.next();
			
			String custId = rs.getString("CustID");
			System.out.println("CUSTOMERID: " + custId);

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return status;
	}
	
	public String getUserID(LoginBean loginBean) throws ClassNotFoundException {
		String userId = "";

		Class.forName("com.mysql.cj.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/provisio?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC", "provisio", "Provisio");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection
						.prepareStatement("select * from customer where UserName = ? and CustPass = ? ")) {
			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			rs.next();
			userId = rs.getString("CustID");
			System.out.println("LoginDao: (userId): " + userId);

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return userId;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}