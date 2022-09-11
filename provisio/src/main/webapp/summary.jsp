<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
    
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

<h1> Summary </h1>


<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

<script type="text/javascript">
if (sessionStorage.getItem("username") !== null && sessionStorage.getItem("isAuthenticated") === "true") {
	 console.log("if: ${username}", "${authenticated}")
       console.log("username: " + sessionStorage.getItem("username") + " authenticated: " + sessionStorage.getItem("isAuthenticated"));
       return true;
   } 

</script>

<%



Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<h2 align="center"><font><strong>Your Current Reservations</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="lightgrey">
<td><b>Reservation ID</b></td>
<td><b>Customer</b></td>
<td><b>Room</b></td>
<td><b>Check In Date</b></td>
<td><b>Check Out Date</b></td>
<td><b>Total Guests</b></td>
<td><b>Loyalty Points Earned</b></td>
<td><b>Total Price</b></td>
<td><b>Amenity</b></td>
<td><b>Attraction</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC", "provisio", "Provisio");
statement=connection.createStatement();

String sql ="SELECT ReservationID,UserName,RoomType,ChkInDate,ChkOutDate,TotalGuests,PointsEarned, TotalPrice, AmenityDesc, AttractionDesc "
+ "FROM customer c, amenities am, attractions a, hotel h, reservations re, rooms r" 
+" Where c.CustID = re.CustID" + 
"AND am.AmenityID = re.Amenity_1" +
"AND a.AttractionID = re.Attraction_1 " +
"AND h.HotelID = re.HotelID " +
"AND r.RoomID = re.RoomID" +
"AND c.UserName = 'jporter@gmail.com'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("ReservationID") %></td>
<td><%=resultSet.getString("UserName") %></td>
<td><%=resultSet.getString("RoomType") %></td>
<td><%=resultSet.getString("ChkInDate") %></td>
<td><%=resultSet.getString("ChkOutDate") %></td>
<td><%=resultSet.getString("TotalGuests") %></td>
<td><%=resultSet.getString("PointsEarned") %></td>
<td><%=resultSet.getString("TotalPrice") %></td>
<td><%=resultSet.getString("AmenityDesc") %></td>
<td><%=resultSet.getString("AttractionDesc") %></td>


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