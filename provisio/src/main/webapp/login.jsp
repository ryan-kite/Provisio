<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="UTF-8">
<title>Provisio - Sign-in</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES -->
<%@ include file="/shared/header-css.jsp"%>
<style>
.login-img-bg {
  background-image: url("/imgs/provisio-login.jpg");
  background-color: #cccccc; 
  height: 650px; 
  background-position: center; 
  background-repeat: no-repeat; 
  background-size: cover; 
  backdrop-filter: blur(3px);
}
.login-bg {
  background-color: rgba(80, 123, 242, 0.25);
  border-radius: 7px;
  box-shadow: 3px 3px 15px 3px rgba(255, 255, 255, 0.3);
  padding: 30px 20px;
  color: white;
}
</style>

</head>

<body class="login-img-bg">
	<%@ include file="/shared/navigation.jsp"%>

	<%@ include file="/shared/user-session.jsp"%>

	<div class="container" style="margin-bottom: 100px">
		<h2 class="display-4 mb-4 mt-4">Sign-in</h2>
        
		<div class="row">
        	<div class="col-md-4 offset-md-4 login-bg">
            	<form action="<%=request.getContextPath()%>/login" method="post">
					<div class="form-group">
						<label>Email</label>
						<input type="email" name="username" class="form-control"/>
					</div>
					<div class="form-group">
						<label>Password</label>
						<input type="password" name="password" class="form-control"/>
					</div>
					<div class="form-group">
						<input class="btn btn-primary " type="submit" value="SIGN-IN" />   
						
                        <div id="failed-login" class="alert alert-danger mt-3"> 
							Username or password was incorrect. Try again.
						</div>
					</div>
					<div class="form-group"></div>
						<div class="alert alert-secondary" role="alert">
							Not a member yet? <a href="/register.jsp" class="alert-link">Register</a> to get started.
						</div>
    				</div>
   				</form>
         	</div>
        	<div class="col-sm-4">
         		<!--  HOLDER  -->
        	</div>
        </div>
	</div>
	<%@ include file="/shared/footer.jsp"%>

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





