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
<title>Provisio - Reservation</title>

<!--  TODO: ADD ICON -->
<link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

<!-- INCLUDE STYLES --> 
<%@ include file = "/shared/header-css.jsp" %>
</head>

<body>
<%@ include file = "/shared/navigation.jsp" %>
<div class="container">
    <!-- IF: NO USER_ID ASK THEM TO SIGN-IN OR REGISTER -->
    <div class="row mt-2" id="reservation-message">
        <div class="col-sm">
            <h2>Reservation</h2>
           <p>Please <a href="/register.jsp">register</a> or <a href="/login.jsp">sign-in</a> to get started with your booking</p>
        </div>
        <div class="col-sm bg-light">
            <!-- holder -->
        </div>
    </div>
    <!-- ELSE: SHOW FORM -->
     <div class="row mt-2" id="reservation-form">
        <div class="col-12">
            <form id="reservation-form" action="#" method="post">
            
            <!-- SELECT LOCATION -->
            <!-- HOTELID -->
            <label>Select Location</label>
            <select id="location" name="location" onchange="handleAtrractions(this.value)">
                <option value="none" selected disabled hidden>Select a city</option>
                <option value="1">TEXAS</option>
                <option value="2">ARKANSAS</option>
                <option value="3">SEATTLE</option>
            </select>

            <!-- SELECT DATES -->
            <!-- CHECK-IN -->
            <label>Check-in</label>
            <input type="date" id="checkin" name="checkin">
            <!-- CHECK-OUT -->
            <label>Check-out</label>
            <input type="date" id="checkout" name="checkout">


            <!-- ENTER GUEST COUNT -->
            <label>Number of guests</label>
            <input type="number" value="0"> 

            <!-- SELECT ROOM -->
            <label>Select room type</label>
            <select id="room" name="room" onchange="handleRooms(this.value)">
                <option value="none" selected disabled hidden>pick a room</option>
                <option value="1">DOUBLE 110.00</option>
                <option value="2">QUEEN 125.00</option>
                <option value="3">DOUBLE QUEEN 150.00</option>
                <option value="4">KING 165.00</option>
            </select>

            <!-- SELECT AMENTITES -->
            <label>Choose your amenities</label>
            <select id="amenities" name="amenities" multiple onchange="handleAmenities(this.value)">
                <option value="none" selected disabled hidden>pick some options</option>
                <option value="1">WIFI 30.00</option>
                <option value="2">POOL 45.00</option>
                <option value="3">BREAKFAST 15.00</option>
                <option value="4">PARKING 50.00</option>
            </select>

            <!-- SELECT ATTRACTIONS -->
            <label>Choose your attractions</label>
            <select id="for-texas" name="attractions" multiple onchange="handleAttractions(this.value)">
                <option value="none" selected disabled hidden>have some fun</option>
                <option value="1">FISHING</option>
                <option value="2">SCUBA</option>
                <option value="3">ATV</option>
            </select>
            <select id="for-arkansas" name="attractions" multiple onchange="handleAttractions(this.value)">
                <option value="none" selected disabled hidden>have some fun</option>
                <option value="1">HORSEBACK RIDING</option>
                <option value="2">DIRT BIKING</option>
                <option value="3">SKY DIVING</option>
            </select>
            <select id="for-seattle" name="attractions" multiple onchange="handleAttractions(this.value)">
                <option value="none" selected disabled hidden>have some fun</option>
                <option value="1">HIKING</option>
                <option value="2">WHALE WATCHING</option>
                <option value="3">MOUNT RAINEER</option>
            </select>

            <!-- HIDDEN FIELDS -->
            <input type="text" id="cust-id" name="cust-id">
            <!-- USER ID/CUSTID -->

            <!-- TOTAL COSTS -->
            <label>Total costs</label>
            <input type="text" id="total" name="total">

            <!-- TOTAL POINT -->
            <label>Total points earned</label>
            <input type="text" id="points" name="points">
            

            <button type="submit">MAKE RESERVATION</button>

            </form>

        </div>
    </div>
</div>

<%@ include file = "/shared/footer.jsp" %>

<script>
// Application User Session Management
<%@ include file = "/js/user-session-management.js" %>

// RESERVATION JAVASCRIPT CODE
// IF VALID USER SHOW FORM ELSE HIDE
// after page loads get 
if (isAuthed) {
    console.log("show form")
    document.getElementById("reservation-form").setAttribute('style', 'display: block');
    document.getElementById("reservation-message").setAttribute('style', 'display: none');
    // fill user-id field
    document.getElementById("cust-id").value = userId;
    handleAtrractions()
} else {
    console.log("hide form")
    document.getElementById("reservation-form").setAttribute('style', 'display: none');
    document.getElementById("reservation-message").setAttribute('style', 'display: block');
}

// HANDLE ATTRACTIONS 
function handleAtrractions(hotelId=null) {
    console.log("handleAtrractions hotelId: ", hotelId)
    if (hotelId === "1") {
        document.getElementById("for-texas").setAttribute('style', 'display: block');
        document.getElementById("for-arkansas").setAttribute('style', 'display: none');
        document.getElementById("for-seattle").setAttribute('style', 'display: none');
    } else if (hotelId === "2") {
        document.getElementById("for-texas").setAttribute('style', 'display: none');
        document.getElementById("for-arkansas").setAttribute('style', 'display: block');
        document.getElementById("for-seattle").setAttribute('style', 'display: none');
    }  else if (hotelId === "3") {
        document.getElementById("for-texas").setAttribute('style', 'display: none');
        document.getElementById("for-arkansas").setAttribute('style', 'display: none');
        document.getElementById("for-seattle").setAttribute('style', 'display: block');
    } else {
        document.getElementById("for-texas").setAttribute('style', 'display: none');
        document.getElementById("for-arkansas").setAttribute('style', 'display: none');
        document.getElementById("for-seattle").setAttribute('style', 'display: none');
    }
}
</script>
</body>
</html>