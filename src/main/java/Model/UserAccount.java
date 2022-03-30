package Model;

import java.sql.Date;

public class UserAccount {
	private int aid;
	private String username;
	private String password;
	private int uid;
	private String fullName;
	private String major;
	private Date birth;
	private String phoneNumber;
	private String email;
	private String address;
	private String describe;
	private String experiment;
	private String countryName;
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
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
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public UserAccount(int aid, String username, String password, int uid, String fullName, String major, Date birth,
			String phoneNumber, String email, String address, String describe, String experiment, String countryName) {
		super();
		this.aid = aid;
		this.username = username;
		this.password = password;
		this.uid = uid;
		this.fullName = fullName;
		this.major = major;
		this.birth = birth;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.address = address;
		this.describe = describe;
		this.experiment = experiment;
		this.countryName = countryName;
	}
	public UserAccount() {
	}
}
