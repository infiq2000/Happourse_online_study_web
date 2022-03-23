package Model;

import java.sql.Date;

public class UserProfile extends User {

	private Date birth;
	private String phoneNumber;
	private String email;
	private String address;
	private String describe;
	private String experiment;
	private double balance;
	private String countryID;
	private String countryName;
	
	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getExperiment() {
		return experiment;
	}

	public void setExperiment(String experiment) {
		this.experiment = experiment;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getCountryID() {
		return countryID;
	}

	public void setCountryID(String countryID) {
		this.countryID = countryID;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public UserProfile(int uid, String full_name, String major, int aid) {
		super(uid, full_name, major, aid);
		// TODO Auto-generated constructor stub
	}

	public UserProfile(int uid, String full_name, String major, int aid, Date birth, String phoneNumber, String email,
			String address, String describe, String experiment, double balance, String countryID, String countryName) {
		super(uid, full_name, major, aid);
		this.birth = birth;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.address = address;
		this.describe = describe;
		this.experiment = experiment;
		this.balance = balance;
		this.countryID = countryID;
		this.countryName = countryName;
	}
}
