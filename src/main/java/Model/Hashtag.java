package Model;

public class Hashtag {
	private	int hashid;
	private String hashtag_name;
	
	public Hashtag(int hashid, String hashtag_name) {
		super();
		this.hashid = hashid;
		this.hashtag_name = hashtag_name;
	}

	public int getHashid() {
		return hashid;
	}

	public void setHashid(int hashid) {
		this.hashid = hashid;
	}

	public String getHashtag_name() {
		return hashtag_name;
	}

	public void setHashtag_name(String hashtag_name) {
		this.hashtag_name = hashtag_name;
	}
	
	
}


