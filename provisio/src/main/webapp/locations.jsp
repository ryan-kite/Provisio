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
<title>Provisio - Locations</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES --> 
<%@ include file = "/shared/header-css.jsp" %>
</head>

<body>
<%@ include file = "/shared/navigation.jsp" %>

<%@ include file ="/shared/user-session.jsp" %>
<%
 Connection connection = null;
 Statement statement = null;
 ResultSet resultSet = null;

 //String uid = (String) session.getAttribute("userId");
 // casting to int
 //int uid_int = Integer.parseInt(uid);
 %>
<div class="container mb-lg-5 pb-5">
    <h2 class="display-4 mb-4 mt-4">Provisio Locations</h2>
  
        <%
   try {
     connection = DriverManager.getConnection(
         "jdbc:mysql://localhost:3306/provisio?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC", "provisio",
         "Provisio");

     String query = "SELECT location, group_concat(attractionDesc) AS 'attractions' FROM attractions GROUP BY Location ORDER BY Location";
     PreparedStatement pstmt = connection.prepareStatement(query);
     resultSet = pstmt.executeQuery();
     while (resultSet.next()) {
   %>
   	<!--  Rows of data goes here -->
   	<div class="mt-4 location_listings">
      <div class="row py-3 bg-light-gray-even">
        <div class="col-lg-2 col-md-6 text-center mx-auto image">
          <img src="imgs/<%=resultSet.getString("location")%>.jpg" alt="<%=resultSet.getString("location")%> Provisio" class="img-fluid">
        </div>
        <div class="col-lg-8 mt-4 mt-lg-0">
          <h2 class="h5"><%=resultSet.getString("location")%> Hotel Provisio </h2>
          <div class="d-md-flex">
            <p class="mb-1 pr-md-2 border-black border-md-right">Provisio At <%=resultSet.getString("location")%></p>
            <p class="mb-1 px-md-2 border-black border-md-right"><%=resultSet.getString("location")%></p>
            
          </div>
         
          <ul class="pl-3">
            <ui class="mb-0">Attractions:</ui>
            <%
            String attractionStr = resultSet.getString("attractions");
            String[] attractArray = attractionStr.split(",");
            for(String singleAttraction: attractArray) {
            %>
            	<li class="mb-0"><%= singleAttraction%></li>
            <%
            } //end for loop
            %>
            
          </ul>
        </div>
        <div class="col-lg-2 align-self-center text-center p-0">
          <a href="/reservation.jsp" class="btn btn-outline-dark px-5 py-2">Select</a>
        </div>
      </div>
   <%
   }

   } catch (Exception e) {
   e.printStackTrace();
   }
   %>
  
    </div>

<%@ include file = "/shared/footer.jsp" %>

<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

</body>
</html>
