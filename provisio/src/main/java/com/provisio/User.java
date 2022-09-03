package com.provisio;

public class User {
	
	private String userName, firstName, lastName, email, password;
	
	

	public User() {
		super();
	}

	public User(String firstName, String lastName, String email, String password) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		
		// how we set/create userName automatically.
		String username;
		char firstChar = this.firstName.charAt(0);
		StringBuilder sb = new StringBuilder();
		sb.append(firstChar);
		sb.append(this.lastName);
		username = sb.toString();
		this.userName = username;
	}

	public String getUserName() {
		return userName;
	}
	
	public void setUserName() {
		String username;
		char firstChar = this.firstName.charAt(0);
		StringBuilder sb = new StringBuilder();
		sb.append(firstChar);
		sb.append(this.lastName);
		username = sb.toString();
		this.userName =  username;
	}
	
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	

}
