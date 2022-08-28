/* AMENITIES */
INSERT INTO amenities (AmenityID, AmenityPrice, AmenityDesc)
VALUES
	(1, 30.00,'WIFI'),
	(2, 45.00,'POOL'),
	(3, 15.00,'BREAKFAST'),
  (4, 50.00,'PARKING');

/* CUSTOMER */
INSERT INTO customer (CustID, UserName, CustPass, EmailAddress, FirstName, LastName, LoyaltyPoints)
VALUES
  (1, 'jporter', 'jporter123', 'jennyporter@gmail.com', 'Jenny', 'Porter', 200),
  (2, 'jsmith', 'jmith123', 'johnsmith@gmail.com', 'John', 'Smith', 0),
  (3, 'jdow', 'jdow123', 'janesmith@gmail.com', 'Jane', 'Dow', 0);

/* ATTRACTIONS */
INSERT INTO attractions (AttractionID, Location, AttractionDesc)
VALUES 
  (1, 'TEXAS', 'FISHING'),
  (2, 'ARKANSAS', 'HORSE RIDING'),
  (3, 'SEATTLE', 'HIKING'),
  (4, 'COLORADO', 'SKIING');

/* HOTEL */
INSERT INTO hotel (HotelID, Location, AttractionID)
VALUES 
  (4, 'TEXAS', 1),
  (5, 'ARKANSAS', 2),
  (6, 'SEATTLE', 3);

/* ROOMS */
INSERT INTO rooms (RoomID, RoomType, RoomPrice, AmenityID)
VALUES
  (1, 'DOUBLE', 110.00, 2),
  (2, 'QUEEN', 125.00, 4),
  (3, 'DOUBLE QUEEN', 150.00, 3),
  (4, 'KING', 165.00, 1);
 
/* RESERVATION */
INSERT INTO reservation (ReservationID, CustID, HotelID, RoomID, ChkInDate, ChkOutDate, Amenity_1, Amenity_2, Amenity_3, Amenity_4, Attraction_1, Attraction_2, Attraction_3, Attraction_4, TotalGuests, PointsEarned, TotalPrice)
 VALUES 
  (1, 1, 4, 1, '2022-12-12', '2022-12-13', 1, NULL, NULL, NULL, 4, NULL, NULL, NULL, 2, 150, 140.00),
  (2, 2, 3, 2, '2022-12-12', '2022-12-14', 2, NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, 300, 305.00),
  (3, 3, 6, 3, '2022-12-12', '2022-12-15', 3, NULL, NULL, NULL, 3, NULL, NULL, NULL, , 450, 465.00);


