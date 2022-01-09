package Model;

public class Chapter {
	private int chap_id;
	private String name;
	private int course_id;
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
}
