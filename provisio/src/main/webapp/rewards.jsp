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
<title>Provisio - Rewards</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES --> 
<%@ include file = "/shared/header-css.jsp" %>
</head>

<body>
<%@ include file = "/shared/navigation.jsp" %>

<%@ include file ="/shared/user-session.jsp" %>

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

<div class="container">
<h2 class="display-4 mb-4 mt-4">Rewards Summary</h2>
  <main>
    <div class="py-5 text-center">
      <img src="/imgs/Rewards.jpg" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
      <p class="lead">At Hotel Provisio you earn reward points for every reservation you and your family make.  Use your reward points at a future
        date and enjoy a stay on us!  </p>
    </div>
	<h4 class="d-flex justify-content-between align-items-center mb-3">
      <span class="text-primary">Your Rewards</span>
      <span class="badge bg-primary rounded-pill">Points</span>
    </h4>	
	<%
		try{ 
		connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC", "provisio", "Provisio");
		
		String query = "SELECT * FROM reservation where CustID = ? ";
		PreparedStatement pstmt = connection.prepareStatement(query);
		pstmt.setInt(1, uid_int);
		resultSet = pstmt.executeQuery();
		while(resultSet.next()){
	%>

    <div class="container-fluid">
      <div class="container-fluid">
        <ul class="list-group mb-10">
          <li class="list-group-item d-flex justify-content-xl-between">
            <div>
              <h6 class="my-0">Your Stay: <%=resultSet.getString("ChkInDate") %> - <%=resultSet.getString("ChkOutDate") %> </h6>
              <small class="text-muted"><%=resultSet.getString("HotelID") %></small>
            </div>
            <span class="text-muted"><%=resultSet.getString("PointsEarned") %></span>
          </li>
        </ul>
      </div>
    </div>
  </main>
<div>

	<% 
		}
		
		} catch (Exception e) {
		e.printStackTrace();
		}
	%>
<%@ include file = "/shared/footer.jsp" %>

<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

</body>
</html>