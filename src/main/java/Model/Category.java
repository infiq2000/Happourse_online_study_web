package Model;

public class Category {
	private int cid;
	private String name;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Category(int cid, String name) {
		super();
		this.cid = cid;
		this.name = name;
	}
	
}
