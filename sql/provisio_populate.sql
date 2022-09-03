/* amenities */
INSERT INTO amenities (AmenityPrice, AmenityDesc)
VALUES
	(30.00,'WIFI'),
	(45.00,'POOL'),
	(15.00,'BREAKFAST'),
  (50.00,'PARKING');

/* CUSTOMER */
INSERT INTO customer (UserName, CustPass, EmailAddress, FirstName, LastName, LoyaltyPoints)
VALUES
  ('jporter', 'jporter123', '  @gmail.com', 'Jenny', 'Porter', 200),
  ('jsmith', 'jmith123', 'johnsmith@gmail.com', 'John', 'Smith', 0),
  ('jdow', 'jdow123', 'janesmith@gmail.com', 'Jane', 'Dow', 0);

/* ATTRACTIONS */
INSERT INTO attractions (Location, AttractionDesc)
VALUES 
  ('TEXAS', 'FISHING'),
  ('TEXAS', 'SCUBA'),
  ('TEXAS', 'ATV'),
  ('ARKANSAS', 'HORSE RIDING'),
  ('ARKANSAS', 'DIRT BIKING'),
  ('ARKANSAS', 'SKY DIVING'),
  ('SEATTLE', 'HIKING'),
  ('SEATTLE', 'WHALE WATCHING'),
  ('SEATTLE', 'MOUNT RAINEER'),
  ('COLORADO', 'SKIING'),
  ('COLORADO', 'CAVING'),
  ('COLORADO', 'WATERFALL');

/* HOTEL */
INSERT INTO hotel (Location)
VALUES 
  ('TEXAS'),
  ('ARKANSAS'),
  ('SEATTLE');

/* ROOMS */
INSERT INTO rooms (RoomType, RoomPrice)
VALUES
  ('DOUBLE', 110.00),
  ('QUEEN', 125.00),
  ('DOUBLE QUEEN', 150.00),
  ('KING', 165.00);
 
/* RESERVATION */
INSERT INTO reservation (CustID, HotelID, RoomID, ChkInDate, ChkOutDate, Amenity_1, Amenity_2, Amenity_3, Attraction_1, Attraction_2, Attraction_3, TotalGuests, PointsEarned, TotalPrice)
 VALUES 
  (1, 4, 1, '2022-12-12', '2022-12-13', 1, NULL, NULL, 4, NULL, NULL, 2, 150, 140.00),
  (2, 3, 2, '2022-12-12', '2022-12-14', 2, NULL, NULL, 2, NULL, NULL, 1, 300, 305.00),
  (3, 6, 3, '2022-12-12', '2022-12-15', 3, NULL, NULL, 3, NULL, NULL, 3, 450, 465.00);
