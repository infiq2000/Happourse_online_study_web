package Model;

public class Instructor {
	private int ins_id;
	private String ins_name;
	private String major;
	private String description;
	public String getDescription() {
		return description;
	}
	public void setDesciption(String description) {
		this.description = description;
	}
	public Instructor(int ins_id, String ins_name, String major, String desciption, int total_course,
			double total_rating, int aid) {
		super();
		this.ins_id = ins_id;
		this.ins_name = ins_name;
		this.major = major;
		this.description = desciption;
		this.total_course = total_course;
		this.total_rating = total_rating;
		this.aid = aid;
	}
	private int total_course;
	private double total_rating;
	private int aid;
	public Instructor(int ins_id, String ins_name, String major, int total_course, double total_rating, int aid) {
		super();
		this.ins_id = ins_id;
		this.ins_name = ins_name;
		this.major = major;
		this.total_course = total_course;
		this.total_rating = total_rating;
		this.aid = aid;
	}
	public int getIns_id() {
		return ins_id;
	}
	public void setIns_id(int ins_id) {
		this.ins_id = ins_id;
	}
	public String getIns_name() {
		return ins_name;
	}
	public void setIns_name(String ins_name) {
		this.ins_name = ins_name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getTotal_course() {
		return total_course;
	}
	public void setTotal_course(int total_course) {
		this.total_course = total_course;
	}
	public double getTotal_rating() {
		return total_rating;
	}
	public void setTotal_rating(double total_rating) {
		this.total_rating = total_rating;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	

}
