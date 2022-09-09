/* amenities */
INSERT INTO amenities (AmenityPrice, AmenityDesc)
VALUES
	(12.99,'WIFI'),
	(8.99,'BREAKFAST'),
  (19.99,'PARKING');

/* CUSTOMER */
/* the passwords before encrypted (at least 8 chars and 1 upper and 1 lower)
('jporter@gmail.com', 'Jporter123', 'jporter@gmail.com', 'Jenny', 'Porter', 200),
('johnsmith@gmail.com', 'Jmith123', 'johnsmith@gmail.com', 'John', 'Smith', 0),
('janesmith@gmail.com', 'Jdow1234', 'janesmith@gmail.com', 'Jane', 'Dow', 0);
You can use the encrypt/decrypt code here: (from GfG)
https://replit.com/@RyanKite/encrypt#Main.java
 */
INSERT INTO customer (UserName, CustPass, EmailAddress, FirstName, LastName, LoyaltyPoints)
VALUES
  ('jporter@gmail.com', 'VjXOcZ+VBT8y6j5WIfSHmQ==', 'jporter@gmail.com', 'Jenny', 'Porter', 200),
  ('johnsmith@gmail.com', 'zzWtv8sumgXR2hZDbVx57Q==', 'johnsmith@gmail.com', 'John', 'Smith', 0),
  ('janesmith@gmail.com', 'mrH2Li+bb32pvfXxA4RXXg==', 'janesmith@gmail.com', 'Jane', 'Dow', 0);

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
  ('SEATTLE', 'MOUNT RAINEER');

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
  (1, 1, 1, '2022-12-12', '2022-12-13', 1, NULL, NULL, 2, NULL, NULL, 2, 150, 140.00),
  (2, 2, 2, '2022-12-12', '2022-12-14', 2, NULL, NULL, 6, NULL, NULL, 1, 300, 305.00),
  (3, 3, 3, '2022-12-12', '2022-12-15', 3, NULL, NULL, 8, NULL, NULL, 3, 450, 465.00);
