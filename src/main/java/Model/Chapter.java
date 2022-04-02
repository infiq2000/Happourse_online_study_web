package Model;

import java.sql.Time;

public class Chapter {
	private int chap_id;
	private String name;
	private int course_id;
	private String duration;
	private String mood;
	private String color;
	public Chapter(int chap_id, String name, int course_id) {
		super();
		this.chap_id = chap_id;
		this.name = name;
		this.course_id = course_id;
	}
	public int getChap_id() {
		return chap_id;
	}
	public void setChap_id(int chap_id) {
		this.chap_id = chap_id;
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
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getMood() {
		return mood;
	}
	public void setMood(String mood) {
		this.mood = mood;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Chapter(int chap_id, String name, int course_id, String duration, String mood, String color) {
		super();
		this.chap_id = chap_id;
		this.name = name;
		this.course_id = course_id;
		this.duration = duration;
		this.mood = mood;
		this.color = color;
	}
}
