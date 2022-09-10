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
    <h2>Reservation</h2>
    <!-- IF: NO USER_ID ASK THEM TO SIGN-IN OR REGISTER -->
    <div class="row mt-2" id="reservation-message">
        <div class="col-sm">
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
                
                <!-- SELECT LOCATION / HOTELID-->
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="hotel">Select Location</label>
                        <select id="hotel" class="form-control" name="hotel" onchange="handleHotel()">
                            <option value="none" selected disabled hidden>Select a city</option>
                            <option value="1">TEXAS</option>
                            <option value="2">ARKANSAS</option>
                            <option value="3">SEATTLE</option>
                        </select>
                    </div>
                
                    <!-- SELECT DATES / CHECK-IN -->
                    <div class="col-md-4 mb-3">
                        <label for="checkin">Check-in</label>
                        <input type="date" id="checkin" class="form-control" name="checkin">
                    </div>

                    <!-- CHECK-OUT -->
                    <div class="col-md-4 mb-3">
                        <label for="checkout">Check-out</label>
                        <input type="date" id="checkout" class="form-control" name="checkout">
                    </div>
                </div>    
           
                <div class="form-row">
                    <!-- ENTER GUEST COUNT -->
                    <div class="col-md-4 mb-3">
                        <label for="guests">Number of guests</label>
                        <input type="number" id="guests" class="form-control" name="guests" value="0" onchange="handleGuests(this.value)"> 
                    </div>    

                    <!-- SELECT ROOM -->
                    <div class="col-md-4 mb-3">
                        <label for="room">Select room type</label>
                        <select id="room" class="form-control" name="room" onchange="handleRoomPrice(this.value)">
                            <option value="none" selected disabled hidden>pick a room</option>
                            <option value="1">DOUBLE 110.00</option>
                            <option value="2">QUEEN 125.00</option>
                            <option value="3">DOUBLE QUEEN 150.00</option>
                            <option value="4">KING 165.00</option>
                        </select>
                    </div>
                </div>    

                <div class="form-row">
                    <!-- SELECT AMENTITES -->
                    <div class="col-md-4 mb-3">
                        <label for="amenities">Choose your amenities</label>
                        <select id="amenities" class="form-control" name="amenities" multiple onchange="handleAmenities(this.value)">
                            <option value="none" selected disabled hidden>pick some options</option>
                            <option value="WIFI">WIFI 12.99 (flat-fee)</option>
                            <option value="BREAKFAST">BREAKFAST 8.99 (per/night)</option>
                            <option value="PARKING">PARKING 19.99 (per/night)</option>
                        </select>
                    </div>    


                    <!-- SELECT ATTRACTIONS -->
                    <div class="col-md-4 mb-3">
                        <label for="attrations">Choose your attractions</label>
                        <select id="atx-for-texas" class="form-control" name="attractions" multiple onchange="getAttractions()">
                            <option value="none" selected disabled hidden>have some fun</option>
                            <option value="FISHING">FISHING</option>
                            <option value="SCUBA">SCUBA</option>
                            <option value="ATV">ATV</option>
                        </select>
                        <select id="atx-for-arkansas" class="form-control" name="attractions" multiple onchange="getAttractions()">
                            <option value="none" selected disabled hidden>have some fun</option>
                            <option value="HORSEBACK RIDING">HORSEBACK RIDING</option>
                            <option value="DIRT BIKING">DIRT BIKING</option>
                            <option value="SKY DIVING">SKY DIVING</option>
                        </select>
                        <select id="atx-for-seattle" class="form-control" name="attractions" multiple onchange="getAttractions()">
                            <option value="none" selected disabled hidden>have some fun</option>
                            <option value="HIKING">HIKING</option>
                            <option value="WHALE WATCHING">WHALE WATCHING</option>
                            <option value="MOUNT RAINEER">MOUNT RAINEER</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <!-- TOTAL POINT -->
                    <div class="col-md-4 mb-3">
                        <label for="points">Total points earned</label>
                        <input type="text" id="points" class="form-control" name="points" readonly>
                    </div>

                    <!-- TOTAL COSTS -->
                    <div class="col-md-4 mb-3">
                        <label for="total">Total costs</label>
                        <input type="text" id="total" class="form-control" name="total" readonly>
                    </div>
                </div>

                <div class="form-row">
                    <!-- HIDDEN FIELDS -->
                    <!-- USER_ID/CUSTID -->
                    <div class="col-md-4 mb-3">
                        <input type="text" id="cust-id" class="form-control" name="cust-id" hidden>
                    </div>
                    
                    <!-- GENERATE SUMMARY -->
                    <div class="col-md-4 mb-3">
                        <button type="button" class="btn btn-secondary" onclick="handleTotal()">PREVIEW</button>
                    </div>
                </div>
                
                <!-- SUBMIT -->
                <div class="row" id="summary" style="display: none">
                    <div class="col-md-2">
                        
                    </div>
                    <div class="col-md-6 offset-md-2">
                        <div class="card">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Location:       <span id="sHotel"></span></li>
                                <li class="list-group-item">Nights:         <span id="sNights"></span></li>
                                <li class="list-group-item">Check-in:       <span id="sCheckin"></span></li>
                                <li class="list-group-item">Check-out:      <span id="sCheckout"></span></li>
                                <li class="list-group-item">Room Type:      <span id="sRoomType"></span></li>
                                <li class="list-group-item">Guests:         <span id="sGuests"></span></li>
                                <li class="list-group-item">Amenities:      <span id="sAmenities"></span></li>
                                <li class="list-group-item">Attractions:    <span id="sAttractions"></span></li>
                                <li class="list-group-item">Reward points:  <span id="sPoints"></span></li>
                                <li class="list-group-item">Total cost:     <span id="sCost"></span></li>
                            </ul>
                        </div>
                         <div class="col-md-12 mb-3 text-right mt-3">
                            <button type="submit" class="btn btn-primary">BOOK RESERVATION</button>
                        </div>
                    </div>
                </div>
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
    handleAttractions()
} else {
    console.log("hide form")
    document.getElementById("reservation-form").setAttribute('style', 'display: none');
    document.getElementById("reservation-message").setAttribute('style', 'display: block');
}

// DEFINE FORM VALUES WE'LL NEED TO HANDLE
let custId = null;
let hotel = null;
let roomId = null;
let roomPrice = null;
let checkin = null;
let checkout = null;
let nights = null;
let guests = null;
let amenities = [];
let attractions = []; // dependent on location
let points = null;
let total = null;


// HANDLE ATTRACTIONS 
function handleAttractions(hotelId=null) {
    console.log("handleAttractions hotelId: ", hotelId)
    if (hotelId === "1") {
        document.getElementById("atx-for-texas").setAttribute('style', 'display: block');
        document.getElementById("atx-for-arkansas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-seattle").setAttribute('style', 'display: none');
    } else if (hotelId === "2") {
        document.getElementById("atx-for-texas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-arkansas").setAttribute('style', 'display: block');
        document.getElementById("atx-for-seattle").setAttribute('style', 'display: none');
    }  else if (hotelId === "3") {
        document.getElementById("atx-for-texas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-arkansas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-seattle").setAttribute('style', 'display: block');
    } else {
        document.getElementById("atx-for-texas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-arkansas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-seattle").setAttribute('style', 'display: none');
    }
};

function getAttractions() {
    // GET ATTRACTIONS based on hotel/location
    var atx = null;
    switch(hotel) {
        case "1":
            // TEXAS
            atx = document.querySelectorAll('#atx-for-texas option:checked');
            attractions = Array.from(atx).map(el => el.value);
            console.log(attractions) // ['none', '1', '2', '3']
            return attractions;
        case "2":
            // ARKANSAS
            atx = document.querySelectorAll('#atx-for-arkansas option:checked');
            attractions = Array.from(atx).map(el => el.value);
            console.log(attractions) // ['none', '1', '2', '3']
            return attractions;
        case "3":
            // SEATTLE
            atx = document.querySelectorAll('#atx-for-seattle option:checked');
            attractions = Array.from(atx).map(el => el.value);
            console.log(attractions) // ['none', '1', '2', '3']
            return attractions;
        default:
            attractions = []
            console.log("Attractions are not matched with a hotel.")
    }
};

function handleTotal() {

    // isRoom?
    if (roomPrice == null || roomPrice == "none" || roomPrice == 0.00 ) {
        alert("Select a room first.")
        return
    }
 
    // CALCULATE NIGHTS
    nights = calcluateNights();
    if (nights == 0) {return}

    // NIGHTS * ROOM
    total = parseFloat(nights) * parseFloat(roomPrice)
    console.log("total = room * nights: ", total)

    // AMENITIES
    // "1" WI-FI (12.99 flat fee)
    // "2" breakfast (8.99 per night) * NIGHTS
    // "3" parking (19.99 per night) * NIGHTS
    var options = document.querySelectorAll('#amenities option:checked');
    amenities = Array.from(options).map(el => el.value);
    console.log(amenities) // ['none', '1', '2', '3']
    for (let a in amenities) {
        if (a == "1") { total += 13.99 };
        if (a == "2") { total += (9.99 * parseFloat(nights)) };
        if (a == "3") { total += (19.99 * parseFloat(nights)) };
    }
    console.log("total: ", total.toFixed(2))

    document.getElementById("total").setAttribute('value', total.toFixed(2));

    handlePoints();

    showSummary()

    return total.toFixed(2);

};

function showSummary() {
    document.getElementById("summary").setAttribute('style', 'display: block');
    // location:
    var selectedHotel = document.getElementById("hotel");
    var hotelLocation = selectedHotel.options[selectedHotel.selectedIndex].text;
    document.getElementById("sHotel").innerHTML = hotelLocation;

    // nights (check-in:  check-out: )
    document.getElementById("sNights").innerHTML = nights;
    document.getElementById("sCheckin").innerHTML = checkin;
    document.getElementById("sCheckout").innerHTML = checkout;
    // roomType:
    var selectedRoom = document.getElementById("room");
    var roomType = selectedRoom.options[selectedRoom.selectedIndex].text;
    document.getElementById("sRoomType").innerHTML = roomType;

    // guests:
    document.getElementById("sGuests").innerHTML = guests;

    // amenities:
    document.getElementById("sAmenities").innerHTML = amenities; //TODO
    
    // attractions: 
    document.getElementById("sAttractions").innerHTML = attractions; //TODO

    // points earned:
    document.getElementById("sPoints").innerHTML = points;
    
    // total cost:
    document.getElementById("sCost").innerHTML = total;

};

function calcluateNights() {
    // add validation
    checkin = document.getElementById("checkin").value;
    console.log("checkin: ", checkin)

    checkout = document.getElementById("checkout").value;
    console.log("checkout: ", checkout)

    if (checkin == "" || checkout == "") {
        alert("Enter Check-in & Check-out Dates.")
        return 0
    }

    var date1 = new Date(checkin);
    var date2 = new Date(checkout);

    console.log("date1: ", date1)
    console.log("date2: ", date2)
    var Difference_In_Time = date2 - date1;
    var Difference_In_Days = Difference_In_Time / (1000 * 3600 * 24);
    console.log("Difference_In_Days: (nights): ", Difference_In_Days)

    return Difference_In_Days
};

function handlePoints() {
    // POINTS = 150 * NIGHTS
    points = 150 * nights
    document.getElementById("points").setAttribute('value', parseInt(points));
    return points;
};

function handleAmenities() {
    amenities = document.getElementById("amenities").value;
    console.log("amenities: ", amenities)

};

function handleHotel() {
    hotel = document.getElementById("hotel").value;
    console.log("hotel: ", hotel)
    handleAttractions(hotel);
};

function handleRoomPrice() {
    roomId = document.getElementById("room").value;
    console.log()
    switch(roomId) {
        case "1":
            roomPrice = 110.00
            break;
        case "2":
            roomPrice = 125.00
            break;
        case "3":
            roomPrice = 150.00
            break;
        case "4":
            roomPrice = 165.00
            break;    
        default:
            roomPrice = 0.00
            alert("Select a room.")
        }
    console.log("roomPrice: ", roomPrice);
};

function handleGuests(g=0) {
    console.log("guests: ", g);
    guests = g;
    return guests;
}

</script>
</body>
</html>