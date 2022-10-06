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
<style>
.reg-img-bg {
  background-image: url("/imgs/provisio-register.jpg");
  background-color: #cccccc; 
  height: 650px; 
  background-position: center; 
  background-repeat: no-repeat; 
  background-size: cover; 
  backdrop-filter: blur(3px);
}
.reg-bg {
  background-color: rgba(80, 123, 242, 0.25);
  border-radius: 7px;
  box-shadow: 3px 3px 15px 3px rgba(255, 255, 255, 0.3);
  padding: 30px 20px;
  color: white;
}
small {
 color: white;
}
</style>
</head>

<body class="reg-img-bg">
<%@ include file = "/shared/navigation.jsp" %>
<%@ include file ="/shared/user-session.jsp" %>

<div class="container">
  <h2 class="display-4 mb-4 mt-4">Register</h2>
  <div class="row mt-2">  
    <div class="col-12">
      <p class="lead">Create your account and get booking.</p>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12 pt-3 pb-3 reg-bg">
      <form action="/register" method="post" name="regform">
        <div class="form-row">
          <div class="col">
            <label for="first-name">First name</label>
            <input type="text" class="form-control" id="first-name" name="first-name" aria-describedby="first-name-help" placeholder="Enter first name" required>
            <small id="first-name-help" class="form-text ">Your favorite first name.</small>
          </div>
          <div class="col">
            <label for="last-name">Last name</label>
            <input type="text" class="form-control" id="last-name" name="last-name" aria-describedby="last-name-help" placeholder="Enter last name" required>
            <small id="last-name-help" class="form-text ">The name on your tax forms.</small>
          </div>
        </div>
        <div class="form-row">
          <div class="col">
            <label for="last-name">Email</label>
            <input type="email" class="form-control" id="email" name="email" aria-describedby="email-help" placeholder="Enter email" required>
            <small id="email-help" class="form-text ">The best none spammy one.</small>
          </div>
          <div class="col">
            <!-- HOLDER -->
          </div>
        </div>
        <div class="form-row">
          <div class="col">
            <label for="password1">Password</label>
            <input type="password" class="form-control" id="password1" name="password1" onkeyup="CheckPassword()" aria-describedby="password-help" placeholder="Create password" required>
            <small id="password-help" class="form-text ">8 chars and one uppercase and one lowercase.</small>
            <small id="password-feedback" class="form-text"></small>
          </div>
          <div class="col">
            <label for="password2">Password</label>
            <input type="password" class="form-control" id="password2" name="password2" onkeyup="DoubleCheckPassword()" aria-describedby="password-help2" placeholder="Verify password">
            <small id="password-help2" class="form-text ">Please enter your password again to verify.</small>
            <small id="password-feedback2" class="form-text"></small>
          </div>
        </div>
		    <button type="submit" id="submit" class="btn btn-primary float-right">REGISTER</button>
		</form>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <h4><!-- HOLDER--> </h4>
      <p> <!-- HOLDER--> </p>
    </div>
  </div>
</div>

<script>
// password validation
function CheckPassword() {
	
	var userpass = document.getElementById("password1").value;
	
	// regex password requirements 8 char min, 1 upper and 1 lower.
	var re = /^(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
	
	// the regex test
	var status = re.test(userpass);
	
	// user feedback
	var feeback = document.getElementById("password-feedback");
	feeback.className = ""; // reset class (color)
	feeback.classList.add("form-text");
	feeback.classList.add("alert");
	
	if (status) { 
		feeback.innerHTML = "Yay, meets password requirements";
		// add success css
  		feeback.classList.add("alert-success");
		//console.log(status);
		return true;
	} else { 
		feeback.innerHTML = "Failure, to meet password requirements";
		// add danger css
		feeback.classList.add("alert-danger");
		//console.log(status);
		return false;
	}
}

function DoubleCheckPassword() {
	
	var userpass1 = document.getElementById("password1").value;
	var userpass2 = document.getElementById("password2").value;
	
	// user feedback
	var feeback = document.getElementById("password-feedback2");
	feeback.className = ""; // reset class (color)
	feeback.classList.add("form-text");
	feeback.classList.add("alert");

	if (userpass1 === userpass2) { 
		feeback.innerHTML = "Success, passwords match";
		// add success css
  		feeback.classList.add("alert-success");
		// enable submit button
		document.getElementById("submit").disabled = false;
		//console.log(status);
		return true;
	} else { 
		feeback.innerHTML = "Nope, passwords do not match";
		// add danger css
		feeback.classList.add("alert-danger");
		// disable submit button
		document.getElementById("submit").disabled = true;
		//console.log(status);
		return false;
	}
}

</script>

<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

<!-- FOOTER -->
<%@ include file = "/shared/footer.jsp" %>

</body>
</html>