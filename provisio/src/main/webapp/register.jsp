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
<title>Provisio - Register</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES --> 
<%@ include file = "/shared/header-css.jsp" %>
</head>

<body>
<%@ include file = "/shared/navigation.jsp" %>

<h1> Register </h1>
<form action="/testing" method="post">
    <input type="text" name="name"/><br>        
    <input type="text" name="group"/>
    <input type="text" name="pass"/>
    <input type="submit" value="submit">            
</form>


<%= request.getParameter("name")%>
<%= request.getParameter("group")%>
<%= request.getParameter("pass")%>
<p>

<%@ include file = "/shared/footer.jsp" %>

</body>
</html>