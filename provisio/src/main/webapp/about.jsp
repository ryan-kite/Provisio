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
<title>Provisio - About</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES --> 
<%@ include file = "/shared/header-css.jsp" %>
</head>

<body>
<%@ include file = "/shared/navigation.jsp" %>

<%@ include file ="/shared/user-session.jsp" %>

<main>
  <section class="py-5 text-center container">
    <div class="row py-lg-1">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">About Hotel Provisio</h1>
        <p class="lead text-muted">Hotel Provisio was founded in 1978 by Carol and Tom Whendall.  As avid travelers early in life, Carol and Tom believed that 
        a good hotel should offer an "experience" in itself. Since that first location in outskirts of Fayettville Arkansas, the Whendalls have opened 2 other
        locations with a passion of giving families longlasting memories.</p>
        <p>
          <a href="register.jsp" class="btn btn-primary my-2">Register Now</a>
          <a href="login.jsp" class="btn btn-secondary my-2">Log In</a>
        </p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">

      <div class="row row-cols-md-1 row-cols-md-2 row-cols-md-3 ">
        <div class="col">
          <div class="card shadow-sm">
            <img src="/imgs/CarolTom.jpg" width="100%" height="225" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#55595c"/>

            <div class="card-body">
              <p class="card-text">Founders Carol & Tom Whendall built the Hotel Provisio name from the ground up.  They are dedicated to giving you an experience you will remember.</p>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="/imgs/aboutusAttraction.jpg" width="100%" height="225" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#55595c"/>

            <div class="card-body">
              <p class="card-text">The Hotel Provisio offers destination locations in Arkansas, Seattle and Dallas with many attractions to fill up you vacation scrapebook.</p>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card shadow-sm">
            <img src="/imgs/families.jpg" width="100%" height="225" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#55595c"/>

            <div class="card-body">
              <p class="card-text">"Family First" has been a motto of the Whendalls since day one.  Your family will feel at home with The Hotel Provisio.</p>
              <div class="d-flex justify-content-between align-items-center">
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>

<%@ include file = "/shared/footer.jsp" %>

<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

</body>
</html>