
DROP DATABASE provisio;
CREATE DATABASE provisio;
USE provisio;

CREATE TABLE Customer (
  CustID int NOT NULL,
  UserName varchar(255),
  CustPass varchar(255),
  EmailAddress varchar(255),
  FirstName varchar(255),
  LastName varchar(255),
  LoyaltyPoints int NOT NULL,
  PRIMARY KEY (CustID)
);

CREATE TABLE Attractions (
  AttractionID int NOT NULL,
  Location varchar(255),
  AttractionDesc varchar(255),
  PRIMARY KEY (AttractionID)
);

CREATE TABLE Amenities(
  AmenityID int Not NULL,
  AmenityPrice decimal(5,2),
  AmenityDesc varchar(255),
  PRIMARY KEY (AmenityID)
); 

CREATE TABLE Hotel (
  HotelID int NOT NULL,
  Location VARCHAR (255),
  AttractionID INT NOT NULL,
  PRIMARY KEY (HotelID),
  FOREIGN KEY (AttractionID) REFERENCES Attractions(AttractionID)
);

CREATE TABLE Rooms (
  RoomID int NOT NULL,
  RoomType varchar(255),
  RoomPrice decimal(5,2),
  AmenityID int NOT NULL,
  PRIMARY KEY (RoomID),
  FOREIGN KEY (AmenityID) REFERENCES Amenities(AmenityID)
);

CREATE TABLE Reservation (
  ReservationID int NOT NULL,
  CustID int NOT NULL,
  HotelID int NOT NULL,
  RoomID int NOT NULL,
  ChkInDate DATE NOT NULL,
  ChkOutDate DATE NOT NULL,
  Amenity_1 Char(255),
  Amenity_2 Char(255),
  Amenity_3 Char(255),
  Amenity_4 Char(255),
  Attraction_1 Char(255),
  Attraction_2 Char(255),
  Attraction_3 Char(255),
  Attraction_4 Char(255),
  TotalGuests int NOT NULL,
  PointsEarned int NOT NULL,
  TotalPrice decimal(5,2),
  PRIMARY KEY (ReservationID)
);