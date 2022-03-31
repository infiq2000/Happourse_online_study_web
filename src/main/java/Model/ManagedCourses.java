package Model;

import java.sql.Date;

public class ManagedCourses extends Courses{
	private String category;
	private Date publishDate;
	private String mood;
	private String color;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
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
	public ManagedCourses(int courses_id, String name, String skill, int price, String language, double star_rate,
			String desciption, int ins_id, int cid, int countCourses, String category, Date publishDate, String mood,
			String color) {
		super(courses_id, name, skill, price, language, star_rate, desciption, ins_id, cid, countCourses);
		this.category = category;
		this.publishDate = publishDate;
		this.mood = mood;
		this.color = color;
	}
}
