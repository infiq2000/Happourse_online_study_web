package Model;

public class User {
	private int uid;
	private String full_name;
	private String major;
	private int aid;
	public User(int uid, String full_name, String major, int aid) {
		super();
		this.uid = uid;
		this.full_name = full_name;
		this.major = major;
		this.aid = aid;
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
