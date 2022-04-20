package Model;

import java.sql.Date;

public class ChartInfo {
	private int ins_id;
	private String name;
	private int course_id;
	private double revenue;
	private Date start_date;
	private int month;
	private int totalCourse;
	
	
	
	public ChartInfo(int ins_id, String name, int course_id,int totalCourse, Date start_date, int month) {
		super();
		this.ins_id = ins_id;
		this.name = name;
		this.course_id = course_id;
		this.start_date = start_date;
		this.month = month;
		this.totalCourse = totalCourse;
	}
	public ChartInfo(int ins_id, String name, int course_id, double revenue, Date start_date, int month) {
		super();
		this.ins_id = ins_id;
		this.name = name;
		this.course_id = course_id;
		this.revenue = revenue;
		this.start_date = start_date;
		this.month = month;
	}
	public int getTotalCourse() {
		return totalCourse;
	}
	public void setTotalCourse(int totalCourse) {
		this.totalCourse = totalCourse;
	}
	public int getIns_id() {
		return ins_id;
	}
	public void setIns_id(int ins_id) {
		this.ins_id = ins_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCourse_id() {
		return course_id;
	}
	public void setCourse_id(int course_id) {
		this.course_id = course_id;
	}
	public double getRevenue() {
		return revenue;
	}
	public void setRevenue(double revenue) {
		this.revenue = revenue;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	
}
