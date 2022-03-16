package Model;

public class Courses {
	private int courses_id;
	private String name;
	private String skill;
	private int price;
	private String language;
	private double star_rate;
	private String desciption;
	private int ins_id;
	private int cid;
	private String ins_name;
	private String ins_major;
	private int countCourses;
	public int getCountCourses() {
		return countCourses;
	}
	public Courses(int courses_id, String name, String skill, int price, String language, double star_rate,
			String desciption, int ins_id, int cid, int countCourses) {
		super();
		this.courses_id = courses_id;
		this.name = name;
		this.skill = skill;
		this.price = price;
		this.language = language;
		this.star_rate = star_rate;
		this.desciption = desciption;
		this.ins_id = ins_id;
		this.cid = cid;
		this.countCourses = countCourses;
	}
	public void setCountCourses(int countCourses) {
		this.countCourses = countCourses;
	}
	public String getIns_major() {
		return ins_major;
	}
	public void setIns_major(String ins_major) {
		this.ins_major = ins_major;
	}
	public Courses(int courses_id, String name, String skill, int price, String language, double star_rate,
			String desciption, int ins_id, int cid, String ins_name, String ins_major) {
		super();
		this.courses_id = courses_id;
		this.name = name;
		this.skill = skill;
		this.price = price;
		this.language = language;
		this.star_rate = star_rate;
		this.desciption = desciption;
		this.ins_id = ins_id;
		this.cid = cid;
		this.ins_name = ins_name;
		this.ins_major = ins_major;
	}
	public Courses(int courses_id, String name, String skill, int price, String language, double star_rate,
			String desciption, int ins_id, int cid, String ins_name) {
		super();
		this.courses_id = courses_id;
		this.name = name;
		this.skill = skill;
		this.price = price;
		this.language = language;
		this.star_rate = star_rate;
		this.desciption = desciption;
		this.ins_id = ins_id;
		this.cid = cid;
		this.ins_name = ins_name;
	}
	public Courses(int courses_id, String name, String skill, int price, String language, double star_rate,
			String desciption, int ins_id, int cid) {
		super();
		this.courses_id = courses_id;
		this.name = name;
		this.skill = skill;
		this.price = price;
		this.language = language;
		this.star_rate = star_rate;
		this.desciption = desciption;
		this.ins_id = ins_id;
		this.cid = cid;
	}
	public int getCourses_id() {
		return courses_id;
	}
	public void setCourses_id(int courses_id) {
		this.courses_id = courses_id;
	}
	public String getName() {
		return name;
	}
	public String getIns_name() {
		return ins_name;
	}
	public void setIns_name(String ins_name) {
		this.ins_name = ins_name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public double getStar_rate() {
		return star_rate;
	}
	public void setStar_rate(double star_rate) {
		this.star_rate = star_rate;
	}
	public String getDesciption() {
		return desciption;
	}
	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}
	public int getIns_id() {
		return ins_id;
	}
	public void setIns_id(int ins_id) {
		this.ins_id = ins_id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	
}
