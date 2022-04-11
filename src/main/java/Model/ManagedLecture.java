package Model;

public class ManagedLecture extends Lecture {
	
	private String duration1;
	private String duration2;
	private String duration3;
	private float mood1;
	private float mood2;
	private float mood3;
	private String color1;
	private String color2;
	private String color3;
	
	public ManagedLecture(int lectureID, String name, String type, String link, String duration, int chapID,
			int courseID) {
		super(lectureID, name, type, link, duration, chapID, courseID);
		// TODO Auto-generated constructor stub
	}

	public String getDuration1() {
		return duration1;
	}

	public void setDuration1(String duration1) {
		this.duration1 = duration1;
	}

	public String getDuration2() {
		return duration2;
	}

	public void setDuration2(String duration2) {
		this.duration2 = duration2;
	}

	public String getDuration3() {
		return duration3;
	}

	public void setDuration3(String duration3) {
		this.duration3 = duration3;
	}

	public String getColor1() {
		return color1;
	}

	public void setColor1(String color1) {
		this.color1 = color1;
	}

	public String getColor2() {
		return color2;
	}

	public void setColor2(String color2) {
		this.color2 = color2;
	}

	public String getColor3() {
		return color3;
	}

	public void setColor3(String color3) {
		this.color3 = color3;
	}

	public float getMood1() {
		return mood1;
	}

	public void setMood1(float mood1) {
		this.mood1 = mood1;
	}

	public float getMood2() {
		return mood2;
	}

	public void setMood2(float mood2) {
		this.mood2 = mood2;
	}

	public float getMood3() {
		return mood3;
	}

	public void setMood3(float mood3) {
		this.mood3 = mood3;
	}

	public ManagedLecture(int lectureID, String name, String type, String link, String duration, int chapID,
			int courseID, String duration1, String duration2, String duration3, float mood1, float mood2, float mood3,
			String color1, String color2, String color3) {
		super(lectureID, name, type, link, duration, chapID, courseID);
		this.duration1 = duration1;
		this.duration2 = duration2;
		this.duration3 = duration3;
		this.mood1 = mood1;
		this.mood2 = mood2;
		this.mood3 = mood3;
		this.color1 = color1;
		this.color2 = color2;
		this.color3 = color3;
	}
}
