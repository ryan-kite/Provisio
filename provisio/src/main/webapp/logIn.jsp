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
<title>Provisio - Login</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES --> 
<%@ include file = "/shared/header-css.jsp" %>
</head>

<body >
<%@ include file = "/shared/navigation.jsp" %>

<%@ include file ="/shared/user-session.jsp" %>

	<div align="center">
		<h1>Provisio Login Page</h1>
		<form action="<%=request.getContextPath()%>/login" method="post">
			<table style="with: 100%">
				<tr>
					<td>User email</td>
					<td><input type="email" name="username" /></td>
				</tr>
				<tr>
					<td>User Password</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<td>
				<input type="submit" value="Submit" />
				<div id="failed-login" class="alert alert-danger">Username or password was incorrect. Try again.</div>
				
				</td>
				
				<td>
				Not A Member Yet? <a href="/register.jsp">Register</a>
				</td>
				<tr>
			</table>
		</form>
	</div>
	
	<%@ include file = "/shared/footer.jsp" %>
	
<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
let successfulAuth = null;
function checkAuthentication() {
	var x = document.getElementById("failed-login");
	if ("${authenticated}" === "false") {
		x.style.display = "block";
		console.log("Username or password was incorrect. Try again.")
		return false;
	} else {
		x.style.display = "none";
		console.log("Username or password was correct. Congrats.")
		return true;
	}
}
checkAuthentication();

</script>

</body>
</html>





