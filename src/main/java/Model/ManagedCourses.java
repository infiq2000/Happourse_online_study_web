package Model;

import java.sql.Date;

public class ManagedCourses extends Courses{
	private String category;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public ManagedCourses(int courses_id, String name, String skill, int price, String language, double star_rate,
			String desciption, int ins_id, int cid, int countCourses, String category) {
		super(courses_id, name, skill, price, language, star_rate, desciption, ins_id, cid, countCourses);
		this.category = category;
	}
}
