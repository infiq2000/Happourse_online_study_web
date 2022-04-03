package Model;

public class Lecture {
	private int lectureID;
	private String name;
	private String type;
	private String link;
	private String duration;
	private int chapID;
	private int courseID;
	public int getLectureID() {
		return lectureID;
	}
	public void setLectureID(int lectureID) {
		this.lectureID = lectureID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public int getChapID() {
		return chapID;
	}
	public void setChapID(int chapID) {
		this.chapID = chapID;
	}
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public Lecture(int lectureID, String name, String type, String link, String duration, int chapID, int courseID) {
		super();
		this.lectureID = lectureID;
		this.name = name;
		this.type = type;
		this.link = link;
		this.duration = duration;
		this.chapID = chapID;
		this.courseID = courseID;
	}
}
