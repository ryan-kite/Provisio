package com.provisio;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Driver;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReservationDao {
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
	
	public String insert(Booking booking) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		String result = "Provisio: Booking entered successfully.";
		String sql = "insert into reservation("
				+ "CustID, HotelID, RoomID, ChkInDate, ChkOutDate, "
				+ "Amenity_1, Amenity_2, Amenity_3, "
				+ "Attraction_1, Attraction_2, Attraction_3, "
				+ "TotalGuests, PointsEarned, TotalPrice) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement ps;
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, booking.getCustID());
			ps.setString(2, booking.getHotelID());
			ps.setString(3, booking.getRoomID());
			ps.setString(4, booking.getChkInDate());
			ps.setString(5, booking.getChkOutDate());
			ps.setString(6, booking.getAmenity_1());
			ps.setString(7, booking.getAmenity_2());
			ps.setString(8, booking.getAmenity_3());
			ps.setString(9, booking.getAttraction_1());
			ps.setString(10, booking.getAttraction_2());
			ps.setString(11, booking.getAttraction_3());
			ps.setString(12, booking.getTotalGuests());
			ps.setString(13, booking.getPointsEarned());
			ps.setString(14, booking.getTotalPrice());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			result = "Provisio: Data enter error.";
		}
		return result;
	}

}
