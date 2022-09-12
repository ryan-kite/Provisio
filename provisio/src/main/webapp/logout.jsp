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
<title>Provisio - Logout</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES --> 
<%@ include file = "/shared/header-css.jsp" %>
</head>

<body>
<%@ include file = "/shared/navigation.jsp" %>

<%@ include file ="/shared/user-session.jsp" %>


<h1> Logout </h1>

<%session.invalidate();%>
<% HttpSession nsession = request.getSession(false);
if(nsession!=null) {
   String data=(String)session.getAttribute( "fname" );
   out.println(data);
}
else
  out.println("Session is not active");
%>
<script>
function signout() {
	// clear the user session
	sessionStorage.clear();
	document.getElementById("logged-out").setAttribute('style', 'display:block');
	
}
signout();
</script>

<%@ include file = "/shared/footer.jsp" %>

<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

</body>
</html>