package Model;

public class Content {
	private int lc_id;
	private String name;
	private String type;
	private String link;
	private int chap_id;
	
	public Content(int lc_id, String name, String type, String link, int chap_id) {
		super();
		this.chap_id = chap_id;
		this.name = name;
		this.type = type;
		this.link = link;
		this.chap_id = chap_id;
	}

	public int getLc_id() {
		return lc_id;
	}

	public void setLc_id(int lc_id) {
		this.lc_id = lc_id;
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

	public int getChap_id() {
		return chap_id;
	}

	public void setChap_id(int chap_id) {
		this.chap_id = chap_id;
	}
	
}
