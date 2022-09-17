package com.provisio;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.security.AES;

import java.util.Enumeration;


/**
 * Servlet implementation class Reservation
 */
@WebServlet(description = "Book your stay", urlPatterns = { "/reservation" })
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("received: POST on reservation/");
		System.out.println("getParameterNames: ");
		System.out.println("before assignment: ");
		
		// INSPECT PARAMETERS
		@SuppressWarnings("rawtypes")
		Enumeration en=request.getParameterNames();
		while(en.hasMoreElements())
		{
			Object objOri=en.nextElement();
			String param=(String)objOri;
			String value=request.getParameter(param);
			System.out.println("Parameter Name is '"+param+"' and Parameter Value is '"+value+"'");
		}
		
		// GET FORM DATA AND ASSGIN TO VARS
		String CustID = request.getParameter("cust-id");
		String HotelID = request.getParameter("hotel");
		String RoomID = request.getParameter("room");
		// HANDLE ROOMTYPES
		if (RoomID.equals("0")) {RoomID="DOUBLE";}
		if (RoomID.equals("1")) {RoomID="QUEEN";}
		if (RoomID.equals("2")) {RoomID="DOUBLE QUEEN";}
		if (RoomID.equals("3")) {RoomID="KING";}
		String ChkInDate = request.getParameter("checkin");
		String ChkOutDate = request.getParameter("checkout");
		
		// HANDLE AMENITIES
		String Amenity_1 = "";
		String Amenity_2 = "";
		String Amenity_3 = "";
		try {
			Amenity_1 = request.getParameterValues("amenities")[0];
		} catch (Exception e) { System.out.println("no first amenity: "+ e);}
		try {
			Amenity_2 = request.getParameterValues("amenities")[1];
		} catch (Exception e) { System.out.println("no second amenity: "+ e);}
		try {
			Amenity_3 = request.getParameterValues("amenities")[2];
		} catch (Exception e) { System.out.println("no third amenity: "+ e);}
		
		// HANDLE ATTRACTIONS
		String Attraction_1 = "";
		String Attraction_2 = "";
		String Attraction_3 = "";
		try {
			Attraction_1 = request.getParameterValues("attractions")[0];
			} catch (Exception e) {System.out.println("no first attraction: "+ e);}
		try {
			Attraction_2 = request.getParameterValues("attractions")[1];
			} catch (Exception e) {System.out.println("no second attraction: "+ e);}
		try {
			Attraction_3 = request.getParameterValues("attractions")[2];
			} catch (Exception e) {System.out.println("no third attraction: "+ e);}
		
		String TotalGuests = request.getParameter("guests");
		String PointsEarned = request.getParameter("points");
		String TotalPrice = request.getParameter("total");
		
		System.out.println("after assignment: ");
				
		// CREATE NEW BOOKING OBJECT 
		Booking booking = new Booking(
				CustID, HotelID, RoomID, ChkInDate, ChkOutDate, Amenity_1, Amenity_2, Amenity_3,
				Attraction_1, Attraction_2, Attraction_3, TotalGuests, PointsEarned, TotalPrice);
		
		System.out.println("after assignment: booking: "+ booking.toString());
		
		// CREATE reservation Dao
		System.out.println("passing object: ");

		ReservationDao rvDao = new ReservationDao();
		String result = rvDao.insert(booking);
		response.getWriter().print(result);
		response.sendRedirect("/success.jsp");
		doGet(request, response);
		
		return;
	}

}
