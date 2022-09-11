DROP DATABASE provisio;
CREATE DATABASE provisio;
USE provisio;

CREATE TABLE Customer (
  CustID int NOT NULL AUTO_INCREMENT,
  UserName varchar(255),
  CustPass varchar(255),
  EmailAddress varchar(255),
  FirstName varchar(255),
  LastName varchar(255),
  LoyaltyPoints int DEFAULT 0,
  PRIMARY KEY (CustID)
);

CREATE TABLE Attractions (
  AttractionID int NOT NULL AUTO_INCREMENT,
  Location varchar(255),
  AttractionDesc varchar(255),
  PRIMARY KEY (AttractionID)
);

CREATE TABLE Amenities(
  AmenityID int NOT NULL AUTO_INCREMENT,
  AmenityPrice decimal(5,2),
  AmenityDesc varchar(255),
  PRIMARY KEY (AmenityID)
); 

CREATE TABLE Hotel (
  HotelID int NOT NULL AUTO_INCREMENT,
  Location VARCHAR (255),
  PRIMARY KEY (HotelID)
);

CREATE TABLE Rooms (
  RoomID int NOT NULL AUTO_INCREMENT,
  RoomType varchar(255),
  RoomPrice decimal(5,2),
  PRIMARY KEY (RoomID)
);

CREATE TABLE Reservation (
  ReservationID int NOT NULL AUTO_INCREMENT,
  CustID int NOT NULL,
  HotelID Char Char(255),
  RoomID Char Char(255),
  ChkInDate DATE NOT NULL,
  ChkOutDate DATE NOT NULL,
  Amenity_1 Char(255),
  Amenity_2 Char(255),
  Amenity_3 Char(255),
  Attraction_1 Char(255),
  Attraction_2 Char(255),
  Attraction_3 Char(255),
  TotalGuests int,
  PointsEarned int,
  TotalPrice decimal(5,2),
  PRIMARY KEY (ReservationID)
);