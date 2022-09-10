package com.provisio;

public class Booking {

	private String 
		CustID, HotelID, RoomID, ChkInDate, ChkOutDate, Amenity_1, Amenity_2, 
		Amenity_3, Attraction_1, Attraction_2, Attraction_3, TotalGuests, PointsEarned, TotalPrice;
	
	public Booking() {
		super();
	}
	
	public Booking(
			String CustID, String HotelID, 
			String RoomID, String ChkInDate, String ChkOutDate,
			String Amenity_1, String Amenity_2, String Amenity_3, 
			String Attraction_1, String Attraction_2, String Attraction_3, 
			String TotalGuests, String PointsEarned, String TotalPrice) {
		
		super();
		this.CustID = CustID;
		this.HotelID = HotelID;
		this.RoomID = RoomID;
		this.ChkInDate = ChkInDate;
		this.ChkOutDate = ChkOutDate;
		this.Amenity_1 = Amenity_1;
		this.Amenity_2 = Amenity_2;
		this.Amenity_3 = Amenity_3;
		this.Attraction_1 = Attraction_1;
		this.Attraction_2 = Attraction_2;
		this.Attraction_3 = Attraction_3;
		this.TotalGuests = TotalGuests;
		this.PointsEarned = PointsEarned;
		this.TotalPrice = TotalPrice;
		
	}

	public String getCustID() {
		return CustID;
	}

	public void setCustID(String custID) {
		CustID = custID;
	}

	public String getHotelID() {
		return HotelID;
	}

	public void setHotelID(String hotelID) {
		HotelID = hotelID;
	}

	public String getRoomID() {
		return RoomID;
	}

	public void setRoomID(String roomID) {
		RoomID = roomID;
	}

	public String getChkInDate() {
		return ChkInDate;
	}

	public void setChkInDate(String chkInDate) {
		ChkInDate = chkInDate;
	}

	public String getChkOutDate() {
		return ChkOutDate;
	}

	public void setChkOutDate(String chkOutDate) {
		ChkOutDate = chkOutDate;
	}

	public String getAmenity_1() {
		return Amenity_1;
	}

	public void setAmenity_1(String amenity_1) {
		Amenity_1 = amenity_1;
	}

	public String getAmenity_2() {
		return Amenity_2;
	}

	public void setAmenity_2(String amenity_2) {
		Amenity_2 = amenity_2;
	}

	public String getAmenity_3() {
		return Amenity_3;
	}

	public void setAmenity_3(String amenity_3) {
		Amenity_3 = amenity_3;
	}

	public String getAttraction_1() {
		return Attraction_1;
	}

	public void setAttraction_1(String attraction_1) {
		Attraction_1 = attraction_1;
	}

	public String getAttraction_2() {
		return Attraction_2;
	}

	public void setAttraction_2(String attraction_2) {
		Attraction_2 = attraction_2;
	}

	public String getAttraction_3() {
		return Attraction_3;
	}

	public void setAttraction_3(String attraction_3) {
		Attraction_3 = attraction_3;
	}

	public String getTotalGuests() {
		return TotalGuests;
	}

	public void setTotalGuests(String totalGuests) {
		TotalGuests = totalGuests;
	}

	public String getPointsEarned() {
		return PointsEarned;
	}

	public void setPointsEarned(String pointsEarned) {
		PointsEarned = pointsEarned;
	}

	public String getTotalPrice() {
		return TotalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		TotalPrice = totalPrice;
	}
	
	
	
}
