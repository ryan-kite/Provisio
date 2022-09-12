<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
    
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="UTF-8">
<title>Provisio - Summary</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES --> 
<%@ include file = "/shared/header-css.jsp" %>
</head>

<body>
<%@ include file = "/shared/navigation.jsp" %>

<%@ include file ="/shared/user-session.jsp" %>

<h1> Summary </h1>

<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>



<%

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

String uid = (String)session.getAttribute("userId");
// casting to int
int uid_int = Integer.parseInt(uid);
%>

<h2 align="center"><font><strong>Your Current Reservations</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="lightgrey">
<td><b>Reservation ID</b></td>
<td><b>Hotel</b></td>
<td><b>Room Type</b></td>
<td><b>Check In Date</b></td>
<td><b>Check Out Date</b></td>
<td><b>Total Guests</b></td>
<td><b>Total Price</b></td>
<td><b>Amenity 1</b></td>
<td><b>Amenity 2</b></td>
<td><b>Amenity 3</b></td>
<td><b>Attraction 1</b></td>
<td><b>Attraction 2</b></td>
<td><b>Attraction 3</b></td>
<td><b>Loyalty Points</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC", "provisio", "Provisio");

String query = "SELECT * FROM reservation where CustID = ? ";
PreparedStatement pstmt = connection.prepareStatement(query);
pstmt.setInt(1, uid_int);
resultSet = pstmt.executeQuery();
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("ReservationID") %></td>
<td><%=resultSet.getString("HotelID") %></td>
<td><%=resultSet.getString("RoomID") %></td>
<td><%=resultSet.getString("ChkInDate") %></td>
<td><%=resultSet.getString("ChkOutDate") %></td>
<td><%=resultSet.getString("TotalGuests") %></td>
<td><%=resultSet.getString("TotalPrice") %></td>
<td><%=resultSet.getString("Amenity_1") %></td>
<td><%=resultSet.getString("Amenity_2") %></td>
<td><%=resultSet.getString("Amenity_3") %></td>
<td><%=resultSet.getString("Attraction_1") %></td>
<td><%=resultSet.getString("Attraction_2") %></td>
<td><%=resultSet.getString("Attraction_3") %></td>
<td><%=resultSet.getString("PointsEarned") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

<%@ include file = "/shared/footer.jsp" %>

<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

</body>
</html>