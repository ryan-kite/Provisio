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
<meta name="viewport"
 content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="UTF-8">
<title>Provisio - Summary</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES -->
<%@ include file="/shared/header-css.jsp"%>
</head>

<body>
 <%@ include file="/shared/navigation.jsp"%>

 <%@ include file="/shared/user-session.jsp"%>

 <script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

 <%
 Connection connection = null;
 Statement statement = null;
 ResultSet resultSet = null;

 String uid = (String) session.getAttribute("userId");
 // casting to int
 int uid_int = Integer.parseInt(uid);
 %>
<div class="container">
  <h2 class="display-4 mb-4 mt-4">Summary</h2>
  <div class="row">
    <div class="col-md-12">
      <h3 align="center">Your Current Reservations</h3>
      <!--  SUMMARY TABLE -->
      <table class="table table-striped table-sm">
      <thead  style="font-size: .8em;">
        <tr>
        <th>ResID</th>
        <th>Hotel</th>
        <th>Room</th>
        <th>CheckIn</th>
        <th>CheckOut</th>
        <th>Guests</th>
        <th>Price</th>
        <th>Amen1</th>
        <th>Amen2</th>
        <th>Amen3</th>
        <th>Attr1</th>
        <th>Attr2</th>
        <th>Attr3</th>
        <th>Points</th>
        </tr>
      </thead>
      <tbody  style="font-size: .8em;">
   <%
   try {
     connection = DriverManager.getConnection(
         "jdbc:mysql://localhost:3306/provisio?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC", "provisio",
         "Provisio");

     String query = "SELECT * FROM reservation where CustID = ? ";
     PreparedStatement pstmt = connection.prepareStatement(query);
     pstmt.setInt(1, uid_int);
     resultSet = pstmt.executeQuery();
     while (resultSet.next()) {
   %>
   <tr>

    <td><%=resultSet.getString("ReservationID")%></td>
    <td><%=resultSet.getString("HotelID")%></td>
    <td><%=resultSet.getString("RoomID")%></td>
    <td><%=resultSet.getString("ChkInDate")%></td>
    <td><%=resultSet.getString("ChkOutDate")%></td>
    <td><%=resultSet.getString("TotalGuests")%></td>
    <td><%=resultSet.getString("TotalPrice")%></td>
    <td><%=resultSet.getString("Amenity_1")%></td>
    <td><%=resultSet.getString("Amenity_2")%></td>
    <td><%=resultSet.getString("Amenity_3")%></td>
    <td><%=resultSet.getString("Attraction_1")%></td>
    <td><%=resultSet.getString("Attraction_2")%></td>
    <td><%=resultSet.getString("Attraction_3")%></td>
    <td><%=resultSet.getString("PointsEarned")%></td>

   </tr>

   <%
   }

   } catch (Exception e) {
   e.printStackTrace();
   }
   %>
   </tbody>
  </table>
  
  </div>
 </div>
</div>


 <%@ include file="/shared/footer.jsp"%>

 <script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

</body>
</html>