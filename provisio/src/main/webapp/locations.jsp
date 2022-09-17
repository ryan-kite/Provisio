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
<title>Provisio - Locations</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES --> 
<%@ include file = "/shared/header-css.jsp" %>
</head>

<body>
<%@ include file = "/shared/navigation.jsp" %>

<%@ include file ="/shared/user-session.jsp" %>

<div class="container mt-5 mb-lg-5 pb-5">
    <h1 class="text-center text-lg-left h2">Provisio Locations</h1>
    <div class="mt-4 location_listings">
      <div class="row py-3 bg-light-gray-even">
        <div class="col-lg-2 col-md-6 text-center mx-auto image">
          <img src="https://www.kayak.com/rimg/dimg/a2/79/d6e38ab7-city-12601-168b97dec51.jpg?width=400&height=300&xhint=1533&yhint=1431&crop=true" alt="Arkansas Provisio" class="img-fluid">
        </div>
        <div class="col-lg-8 mt-4 mt-lg-0">
          <h2 class="h5">Arkansas Hotel Provisio </h2>
          <div class="d-md-flex">
            <p class="mb-1 pr-md-2 border-black border-md-right">Provisio At Arkansas</p>
            <p class="mb-1 px-md-2 border-black border-md-right">Arkansas, 72143</p>
            <a href="tel:(321) 867-5000" class="mb-1 px-md-2 text-black"><strong>(402)-213-0476</strong></a>
          </div>
         
          <ul class="pl-3">
            <ui class="mb-0">Attractions:</ui>
            <li class="mb-0">Horse Back Riding</li>
            <li class="mb-0">Dirt Biking </li>
            <li class="mb-0">Sky Diving</li>
          </ul>
        </div>
        <div class="col-lg-2 align-self-center text-center p-0">
          <a href="/reservation.jsp" class="btn btn-outline-dark px-5 py-2">Select</a>
        </div>
      </div>

      <div class="row py-3 bg-light-gray-even">
        <div class="col-lg-2 col-md-6 text-center mx-auto image">
          <img src="https://www.hotelscombined.com/news/wp-content/uploads/sites/314/2018/10/featured-image-GettyImages-618765534-3.jpg" alt="Seattle Hotel" class="img-fluid">
        </div>
        <div class="col-lg-8 mt-4 mt-lg-0">
          <h2 class="h5">Seattle Hotel Provisio</h2>
          <div class="d-md-flex">
            <p class="mb-1 pr-md-2 border-black border-md-right">1415 5th Avenue</p>
            <p class="mb-1 px-md-2 border-black border-md-right">Seattle, WA 98101</p>
            <a href="tel:(301) 286-2000" class="mb-1 px-md-2 text-black"><strong>(206) 971-8000</strong></a>
          </div>
          <ul class="pl-3">
            <ui class="mb-0">Attractions: </ui>
            <li class="mb-0">Hiking</li>
            <li class="mb-0">Whale Watching </li>
            <li class="mb-0">Mount Rainier</li>
            
          </ul>
        </div>
        <div class="col-lg-2 align-self-center text-center p-0">
          <a href="/reservation.jsp" class="btn btn-outline-dark px-5 py-2">Select</a>
        </div>
      </div>

      <div class="row py-3 bg-light-gray-even">
        <div class="col-lg-2 col-md-6 text-center mx-auto image">
          <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBjzEWnGuqwHQ0Jqlg7umEvufZwr-_DHS8bbvHeO41LCwkHySX1cVhD-lIiY6dkj13ylo&usqp=CAU" alt="Johnson Space Center" class="img-fluid">
        </div>
        <div class="col-lg-8 mt-4 mt-lg-0">
          <h2 class="h5">Dallas Hotel Provisio</h2>
          <div class="d-md-flex">
            <p class="mb-1 pr-md-2 border-black border-md-right">300 Reunion Blvd</p>
            <p class="mb-1 px-md-2 border-black border-md-right">Dallas, TX 75207</p>
            <a href="tel:(281) 483-0123" class="mb-1 px-md-2 text-black"><strong>(214) 651-1234</strong></a>
          </div>
          <ul class="pl-3">
            <ui class="mb-0">Attractions: </ui>
            <li class="mb-0">Fishing</li>
            <li class="mb-0">Scuba  </li>
            <li class="mb-0">ATV</li>
          </ul>
        </div>
        <div class="col-lg-2 align-self-center text-center p-0">
          <a href="/reservation.jsp" class="btn btn-outline-dark px-5 py-2">Select</a>
        </div>
      </div>
    </div>

<%@ include file = "/shared/footer.jsp" %>

<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>
</script>

</body>
</html>