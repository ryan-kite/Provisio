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

<div class="container">
  <div class="row mt-2">  
    <div class="col-12">
      <h2>Register</h2>
      <p class="lead">Create your account and get booking.</p>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-2">
      <h4><!-- HOLDER--> </h4>
      <p> <!-- HOLDER--> </p>
    </div>
    <div class="col-8 bg-light pt-3 pb-3">
      <form action="/register" method="post">
        <div class="form-row">
          <div class="col">
            <label for="first-name">First name</label>
            <input type="text" class="form-control" id="first-name" name="first-name" aria-describedby="first-name-help" placeholder="Enter first name">
            <small id="first-name-help" class="form-text text-muted">Your favorite first name.</small>
          </div>
          <div class="col">
            <label for="last-name">Last name</label>
            <input type="text" class="form-control" id="last-name" name="last-name" aria-describedby="last-name-help" placeholder="Enter last name">
            <small id="last-name-help" class="form-text text-muted">The name on your tax forms.</small>
          </div>
        </div>
        <div class="form-row">
          <div class="col">
            <label for="last-name">Email</label>
            <input type="email" class="form-control" id="email" name="email" aria-describedby="email-help" placeholder="Enter email">
            <small id="email-help" class="form-text text-muted">The best none spammy one.</small>
          </div>
          <div class="col">
            <!-- HOLDER -->
          </div>
        </div>
        <div class="form-row">
          <div class="col">
            <label for="password1">Password</label>
            <input type="password" class="form-control" id="password1" name="password1" aria-describedby="password-help" placeholder="Create password">
            <small id="password-help" class="form-text text-muted">The passwords will need to match.</small>
          </div>
          <div class="col">
            <label for="password2">Password</label>
            <input type="password" class="form-control" id="password2" name="password2" aria-describedby="password-help2" placeholder="Verify password">
            <small id="password-help2" class="form-text text-muted">Enter the password again to verify.</small>
          </div>
        </div>
		    <button type="submit" class="btn btn-primary float-right">Register</button>
		</form>
    </div>
    <div class="col-2">
      <h4><!-- HOLDER--> </h4>
      <p> <!-- HOLDER--> </p>
    </div>
  </div>
  <div class="row mt-2">
    <div class="col-12">
      <h4><!-- HOLDER--> </h4>
      <p> <!-- HOLDER--> </p>
    </div>
  </div>
</div>

<!-- FOOTER -->
<%@ include file = "/shared/footer.jsp" %>

</body>
</html>