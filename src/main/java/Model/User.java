package Model;

import java.util.Date;

public class User {
	private int uid;
	private String full_name;
	private String major;
	private int aid;
	private Date birth;
	private String phone_number;
	private String email;
	private String address;
	private String describe;
	private String experiment;
	private double balance;
	private String img_path;
	private String country_id;
	private int number_courses;
	
	public User(int uid, String full_name, String major, int aid) {
		super();
		this.uid = uid;
		this.full_name = full_name;
		this.major = major;
		this.aid = aid;
	}
	
	public User(int uid, String full_name, String major, Date birth, String phone_number, String email, int aid, String describe, String experiment, double balance, String img_path, String country_id, int number_courses) {
		super();
		this.uid = uid;
		this.full_name = full_name;
		this.major = major;
		this.birth = birth;
		this.phone_number = phone_number;
		this.email = email;
		this.aid = aid;
		this.describe = describe;
		this.experiment = experiment;
		this.balance = balance;
		this.img_path = img_path;
		this.country_id = country_id;
		this.number_courses = number_courses;
	}
	
	public int getNumber_courses() {
		return number_courses;
	}

	public void setNumber_courses(int number_courses) {
		this.number_courses = number_courses;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public void setBalance(float balance) {
		this.balance = balance;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getCountry_id() {
		return country_id;
	}

	public void setCountry_id(String country_id) {
		this.country_id = country_id;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	
	
}
