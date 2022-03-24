package Model;

public class Profiles {
	private int id;
	private String name;
	private String major;
	private double balance;
	private String description;
	public int getId() {
		return id;
	}
	public void setId(int uid) {
		this.id = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Profiles(int id, String name, String major, double balance, String description) {
		super();
		this.id = id;
		this.name = name;
		this.major = major;
		this.balance = balance;
		this.description = description;
	}
}
