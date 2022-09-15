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
<title>Provisio - Rewards</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES --> 
<%@ include file = "/shared/header-css.jsp" %>
</head>

<body>
<%@ include file = "/shared/navigation.jsp" %>

<%@ include file ="/shared/user-session.jsp" %>

<div class="container">
  <main>
    <div class="py-5 text-center">
      <img src="/imgs/Rewards.jpg" src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">
      <h2>Rewards Summary</h2>
      <p class="lead">At Hotel Provisio you earn reward points for every reservation you and your family make.  Use your reward points at a future
        date and enjoy a stay on us!  </p>
    </div>

    <div class="container-fluid">
      <div class="container-fluid">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-primary">Your Rewards</span>
          <span class="badge bg-primary rounded-pill">Points</span>
        </h4>
        <ul class="list-group mb-10">
          <li class="list-group-item d-flex justify-content-xl-between">
            <div>
              <h6 class="my-0">Your Stay: 2/24/22 - 2/26/22 </h6>
              <small class="text-muted">Seattle Washington</small>
            </div>
            <span class="text-muted">50</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Your Stay: 4/16/22 - 4/20/22</h6>
              <small class="text-muted">Seattle Washington</small>
            </div>
            <span class="text-muted">100</span>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
            <div>
              <h6 class="my-0">Your Stay: 7/12/22 - 7/13/22</h6>
              <small class="text-muted">Fayettville Arkansas</small>
            </div>
            <span class="text-muted">20</span>
          </li>
          <li class="list-group-item d-flex justify-content-between bg-secondary">
            <span>Total Points Earned</span>
            <strong>170</strong>
          </li>
        </ul>
      </div>
    </div>
  </main>
<div>

<%@ include file = "/shared/footer.jsp" %>

<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

</body>
</html>