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
<style>
/* CUSTOM OVERRIDE FOR THIS PAGE CARD IMAGE */
.card-img-top {
    width: 100%;
    border-top-left-radius: calc(0.25rem - 1px);
    border-top-right-radius: calc(0.25rem - 1px);
    height: 18em;
    object-fit: cover;
}
</style>
</head>

<body>
<%@ include file = "/shared/navigation.jsp" %>

<%@ include file ="/shared/user-session.jsp" %>

<div class="container">
    <h2>Reservation</h2>
    <!-- IF: NO USER_ID ASK THEM TO SIGN-IN OR REGISTER -->
    <div class="row mt-2" id="reservation-message">
        <div class="card">
            <img class="card-img-top" src="https://imgcy.trivago.com/mag/2017/12/11105619/hotel-crescent-court-dallas-pool.jpeg" alt="PROVISIO TEXAS">
            <div class="card-body text-center">
              <h5 class="card-title">Your almost there</h5>
              <p class="card-text">Please sign-in or register to get started with your booking.</p>
              <a href="/login.jsp" class="btn btn-primary">SIGN-IN</a>
              <a href="/register.jsp" class="btn btn-secondary">REGISTER</a>
            </div>
            <div class="card-footer">
                <p class="text-center text-dark">As a member you'll receive Reward Loyalty Points™ for each & every night you stay.</p>
            </div>
        </div>
        <div class="col-sm bg-light">
            <!-- holder -->
        </div>
    </div>
    <!-- ELSE: SHOW FORM -->
    <div class="row mt-2" id="reservation-form">
        <div class="col-12">                    
            <form id="reservation-form" action="/reservation" method="post">
                <!-- SELECT LOCATION / HOTELID-->
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="hotel">Select Location</label>
                        <select id="hotel" class="form-control" name="hotel" onchange="handleHotel()">
                            <option value="none" selected disabled hidden>Select a city</option>
                            <option value="TEXAS">TEXAS</option>
                            <option value="ARKANSAS">ARKANSAS</option>
                            <option value="SEATTLE">SEATTLE</option>
                        </select>
                    </div>
                </div>    
                <!-- SELECT LOCATION / HOTELID-->
                <div class="form-row">
                    <!-- SELECT DATES / CHECK-IN -->
                    <div class="col-md-6 mb-3">
                        <label for="checkin">Check-in</label>
                        <input type="date" id="checkin" class="form-control" name="checkin">
                    </div>

                    <!-- CHECK-OUT -->
                    <div class="col-md-6 mb-3">
                        <label for="checkout">Check-out</label>
                        <input type="date" id="checkout" class="form-control" name="checkout">
                    </div>
                </div>    
           
                <div class="form-row">
                    <!-- ENTER GUEST COUNT -->
                    <div class="col-md-6 mb-3">
                        <label for="guests">Number of guests</label>
                        <input type="number" id="guests" class="form-control" name="guests" onchange="handleGuests(this.value); guestCount(this.value);" min="1" max="5" required> 
                    </div>    

                    <!-- SELECT ROOM -->
                    <div class="col-md-6 mb-3">
                        <label for="room">Select room type</label>
                        <select id="room" class="form-control" name="room" onchange="handleRoomPrice(this.value)">
                            <option value="none" selected disabled hidden>pick a room</option>
                            <!-- GENERATED ROOM OPTIONS -->
                        </select>
                    </div>
                </div>    

                <div class="form-row">
                    <!-- SELECT AMENTITES -->
                    <div class="col-md-6 mb-3">
                        <label for="amenities">Choose your amenities</label>
                        <select id="amenities" class="form-control" name="amenities" multiple onchange="handleAmenities(this.value)">
                            <option value="none" selected disabled hidden>pick some options</option>
                            <option value="WIFI">WIFI 12.99 (flat-fee)</option>
                            <option value="BREAKFAST">BREAKFAST 8.99 (per/night)</option>
                            <option value="PARKING">PARKING 19.99 (per/night)</option>
                        </select>
                    </div>    


                    <!-- SELECT ATTRACTIONS -->
                    <div class="col-md-6 mb-3">
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
                            <option value="MOUNT RAINEER">MOUNT RAINIER</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <!-- TOTAL POINT -->
                    <div class="col-md-6 mb-3">
                        <label for="points">Total points earned</label>
                        <input type="text" id="points" class="form-control" name="points" readonly>
                    </div>

                    <!-- TOTAL COSTS -->
                    <div class="col-md-6 mb-3">
                        <label for="total">Total costs</label>
                        <input type="text" id="total" class="form-control" name="total" readonly>
                    </div>
                </div>

                <div class="form-row">
                    <!-- HIDDEN FIELDS -->
                    <!-- USER_ID/CUSTID -->
                    <div class="col-md-6 mb-3">
                        <input type="text" id="cust-id" class="form-control" name="cust-id" hidden>
                    </div>
                    
                    <!-- GENERATE SUMMARY -->
                    <div class="col-md-6 mb-3 text-right">
                        <button type="button" class="btn btn-secondary" onclick="handleTotal()">PREVIEW</button>
                    </div>
                </div>
                
                <!-- SUBMIT -->
                <div id="summary" style="display: none">
                  <div class="row">
                      <div class="col-md-6">
                          <div class="card">
                             <div class="card-header">
                               Reservation summary
                             </div>
                             <div class="card-body">
                               <ul class="list-group list-group-flush">
                                   <li class="list-group-item">Location:       <span id="sHotel"></span></li>
                                   <li class="list-group-item">Nights:         <span id="sNights"></span></li>
                                   <li class="list-group-item">Check-in:       <span id="sCheckin"></span></li>
                                   <li class="list-group-item">Check-out:      <span id="sCheckout"></span></li>
                                   <li class="list-group-item">Room Type:      <span id="sRoomType"></span></li>
                                   <li class="list-group-item">Guests:         <span id="sGuests"></span></li>
                               </ul>
                             </div>
                             <div class="card-footer text-right">
                               
                             </div>
                          </div>
                      </div>
                      <div class="col-md-6">
                          <div class="card">
                             <div class="card-header">
                              Confirm or makes changes.
                             </div>
                             <div class="card-body">
                               <ul class="list-group list-group-flush">
                                  <li class="list-group-item">Amenities:      <span id="sAmenities"></span></li>
                                  <li class="list-group-item">Attractions:    <span id="sAttractions"></span></li>
                                  <li class="list-group-item">Reward points:  <span id="sPoints"></span></li>
                                  <li id="sHoliday" class="list-group-item bg-info">Peak/Holiday Travel: <span>room +5%</span></li>
                                  <li class="list-group-item">Total cost:     <span id="sCost"></span></li>
                               </ul>
                              </div>
                          </div>
                          <div class="card-footer text-right">
                            <input type="reset" value="CANCEL" onclick="window.location.reload()" class="btn btn-default">
                            <button type="submit" class="btn btn-primary">CONFIRM RESERVATION</button>
                          </div>
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
let rooms = [];
let dateRange = []
let isRateHike = null;
let holidays = ['7/4', '12/24', '12/31']

// HANDLE FORM RESET
function formReset() {
	document.getElementById("reservation-form").reset();
}

// HANDLE GUEST VALIDATION
function guestCount(val) {
	console.log("Guest count: ", val)
    if (parseInt(val) > 5) {
    	alert("Sorry, 5 guests max per room.")
    	return
       }
    if (parseInt(val) === 0 || guests === null) {
        alert("Hold on, please enter how many people are staying.")
        return
    }
}

// HANDLE ATTRACTIONS 
function handleAttractions(hotelId=null) {
    console.log("handleAttractions hotelId: ", hotelId)
    if (hotelId === "TEXAS") {
        document.getElementById("atx-for-texas").setAttribute('style', 'display: block');
        document.getElementById("atx-for-arkansas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-seattle").setAttribute('style', 'display: none');
    } else if (hotelId === "ARKANSAS") {
        document.getElementById("atx-for-texas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-arkansas").setAttribute('style', 'display: block');
        document.getElementById("atx-for-seattle").setAttribute('style', 'display: none');
    }  else if (hotelId === "SEATTLE") {
        document.getElementById("atx-for-texas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-arkansas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-seattle").setAttribute('style', 'display: block');
    } else {
        document.getElementById("atx-for-texas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-arkansas").setAttribute('style', 'display: none');
        document.getElementById("atx-for-seattle").setAttribute('style', 'display: none');
    }
};

// GET ATTRACTIONS based on hotel/location
function getAttractions() {
    var atx = null;
    switch(hotel) {
        case "TEXAS":
            // TEXAS
            atx = document.querySelectorAll('#atx-for-texas option:checked');
            attractions = Array.from(atx).map(el => el.value);
            console.log(attractions) // ['none', '1', '2', '3']
            return attractions;
        case "ARKANSAS":
            // ARKANSAS
            atx = document.querySelectorAll('#atx-for-arkansas option:checked');
            attractions = Array.from(atx).map(el => el.value);
            console.log(attractions) // ['none', '1', '2', '3']
            return attractions;
        case "SEATTLE":
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

// HANDLE VALIDATION AND TOTALING
function handleTotal() {
	
	// Validate hotel
	if (hotel === null) {
		alert("Please selet a hotel.")
	    return
	}
	
	// CALCULATE NIGHTS
    nights = calculateNights();
    if (nights == 0) {return}
	
    // Validate guests
	if (guests === null) {
		alert("Please enter how many guests.")
	    return
	}
	
    // Validate room
    if (roomPrice === null || roomPrice == "none" || roomPrice == 0.00 ) {
        alert("Please select a room.")
        return
    }
    
	//  If the customer makes reservation for a holiday stay 
    // (Fourth of July, Christmas Eve, New Years Eve) the increased rate is another 5%.
    if (isRateHike === true) {
    	roomPrice = (roomPrice * 1.05)
    	console.log('roomPrice increase 5% (holiday): ',  roomPrice)
    }

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
        console.log("a: ", a)
        if (amenities[a] == "WIFI") { total += 13.99 };
        if (amenities[a] == "BREAKFAST") { total += (8.99 * nights) };
        if (amenities[a] == "PARKING") { total += (19.99 * nights) };
    }
    console.log("total: ", total.toFixed(2))

    document.getElementById("total").setAttribute('value', total.toFixed(2));

    handlePoints();

    showSummary()

    return total.toFixed(2);

};

// HANDEL RESERVATION PREVIEW
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
    
 	// If holiday fee:
 	if (isRateHike) {
 		document.getElementById("sHoliday").setAttribute('style', 'display: block');
 	} else {
 		document.getElementById("sHoliday").setAttribute('style', 'display: none');
 	}
    
    // total cost:
    document.getElementById("sCost").innerHTML = total.toFixed(2);

};

// FORMATS DATES without year for checking correctly when year rolls over
function dateFormatter(date) {
  return date.toLocaleDateString('en-us', { day: 'numeric', month: "numeric" })
}

// GENERATES all dates in checkin/checkout as range (list/array)
// Borrowed some code from http://jsfiddle.net/jfhartsock/cM3ZU/
// Helper method -overrides Date() using incremental steps (days) to create future dates in the range.
Date.prototype.addDays = function(days) {
  var dat = new Date(this.valueOf())
  dat.setDate(dat.getDate() + days);
  return dat;
}
// The DRIVER for date range generator function -> array(range) of dates.
function generateDateRange(startDate, stopDate) {
  var dateArray = new Array();
  var currentDate = startDate;
  while (currentDate <= stopDate) {
    dateArray.push(currentDate)
    currentDate = currentDate.addDays(1);
  }
  return dateArray;
}

// COMPUTED handler determines if booking will increase additional 5%
function isHolidayRate(dateRange) {
  for (i = 0; i < dateRange.length; i++) {
    console.log(dateFormatter(dateRange[i]));
    var d = dateFormatter(dateRange[i])
    if (holidays.includes(d)) {
      console.log('true')
      return true
    }
  }
}

// HANDLES NIGHTS
function calculateNights() {
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
    
    if (Difference_In_Days <= 0) {
    	alert("Whoa... Time travel is not avaible at this location yet! Try something else.")
    	return
    }
    
    // generate all dates in stay
    dateRange = generateDateRange(date1, (date1).addDays(Difference_In_Days));
    // determines if any dates on a holiday and sets isRateHike flag 
	isRateHike = isHolidayRate(dateRange);
	console.log("isRateHike: ", isRateHike)
    
	return Difference_In_Days
};

// HANLDES REWARDS POINTS
function handlePoints() {
    // POINTS = 150 * NIGHTS
    points = 150 * nights
    document.getElementById("points").setAttribute('value', parseInt(points));
    return points;
};

// HANDLES AMENITIES
function handleAmenities() {
    amenities = document.getElementById("amenities").value;
    console.log("amenities: ", amenities)

};

// HANDLES HOTEL LOCATION
function handleHotel() {
    hotel = document.getElementById("hotel").value;
    console.log("hotel: ", hotel)
    handleAttractions(hotel);
};

// HANDLES ROOM PRICE
function handleRoomPrice() {
    roomId = document.getElementById("room").value;
    console.log()
    switch(roomId) {
        case "0":
            roomPrice = rooms[roomId]['price']
            break;
        case "1":
            roomPrice = rooms[roomId]['price']
            break;
        case "2":
            roomPrice = rooms[roomId]['price']
            break;
        case "3":
            roomPrice = rooms[roomId]['price']
            break;    
        default:
            roomPrice = 0.00
            alert("Select a room.")
        }

    console.log("handleRoomPrice: roomPrice: ", roomPrice);
};

// HANLDES GUESTS
function handleGuests(g=0) {
    console.log("guests: ", g);
    guests = g;
    return guests;
}

// GENERATES ROOMS AND PRICING with percentages increases.
function generateRooms() {
    console.log("generating rooms")
    select = document.getElementById( 'room' );

    var select, i, option;
        
    var room0 = {rtype: "DOUBLE", price: 110.00};
    var room1 = {rtype: "QUEEN", price: 125.00};
    var room2 = {rtype: "DOUBLE QUEEN", price: 150.00};
    var room3 = {rtype: "KING", price: 165.00};
    
    rooms.push(room0, room1, room2, room3)
    for (idx in rooms) {
        rooms[idx].price = (rooms[idx].price * 1.05)
    }
    console.log(rooms)

    for (idx in rooms) {
        option = document.createElement( 'option' );
        option.value = parseInt(idx);
        option.text = [rooms[idx].rtype +': $'+ rooms[idx].price];
        select.add( option );
    }
}
// CALLED ON PAGE LOAD
generateRooms();

</script>
</body>
</html>