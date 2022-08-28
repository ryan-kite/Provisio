<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<meta charset="UTF-8">
<title>Provisio</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE BOOTSTRAP AND STYLES --> 
<link 
	rel="stylesheet" 
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" 
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
	crossorigin="anonymous">
<!-- Custom styles for this template -->
<link rel="stylesheet" href="/css/product.css">
</head>


<body>
<%@ include file = "/shared/navigation.jsp" %>

<%
String p = (String)request.getAttribute("page");
%>

<div class="alert alert-info" role="alert">Developer info: passed attribute: [ ${page} ]</div>


<% if (p.equals("home")) { %> <jsp:include page="home.jsp"/> <% } %>

<% if (p.equals("about")) { %> <jsp:include page="about.jsp"/> <% } %>

<% if (p.equals("locations")) { %> <jsp:include page="locations.jsp"/> <% } %>

<% if (p.equals("login")) { %> <jsp:include page="login.jsp"/> <% } %>

<% if (p.equals("logout")) { %> <jsp:include page="logout.jsp"/> <% } %>

<% if (p.equals("lookup")) { %> <jsp:include page="lookup.jsp"/> <% } %>

<% if (p.equals("register")) { %> <jsp:include page="register.jsp"/> <% } %>

<% if (p.equals("reservation")) { %> <jsp:include page="reservation.jsp"/> <% } %>

<% if (p.equals("rewards")) { %> <jsp:include page="rewards.jsp"/> <% } %>

<% if (p.equals("summary")) { %> <jsp:include page="summary.jsp"/> <% } %>


<%@ include file = "/shared/footer.jsp" %>

</body>
</html>