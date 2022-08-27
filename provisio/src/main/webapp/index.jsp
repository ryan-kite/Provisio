<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Provisio</title>
</head>
<body>

<%@ include file = "/shared/navigation.jsp" %>

<%
String p = (String)request.getAttribute("page");
%>

<h2>Page: ${page} </h2>

<% if (p.equals("home")) { %> <jsp:include page="home.jsp"/> <% } %>

<% if (p.equals("about")) { %> <jsp:include page="about.jsp"/> <% } %>

<% if (p.equals("locations")) { %> <jsp:include page="locations.jsp"/> <% } %>

<% if (p.equals("login")) { %> <jsp:include page="login.jsp"/> <% } %>

<% if (p.equals("lookup")) { %> <jsp:include page="lookup.jsp"/> <% } %>

<% if (p.equals("register")) { %> <jsp:include page="register.jsp"/> <% } %>

<% if (p.equals("reservation")) { %> <jsp:include page="reservation.jsp"/> <% } %>

<% if (p.equals("rewards")) { %> <jsp:include page="rewards.jsp"/> <% } %>

<% if (p.equals("summary")) { %> <jsp:include page="summary.jsp"/> <% } %>


<%@ include file = "/shared/footer.jsp" %>

</body>
</html>