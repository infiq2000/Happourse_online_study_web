package Model;

import java.sql.Timestamp;

public class Note {
	String contentN;
	Timestamp timeDate;
	
	public Note(String contentN, Timestamp timeDate) {
		super();
		this.contentN = contentN;
		this.timeDate = timeDate;
	}
	public String getContentN() {
		return contentN;
	}
	public void setContentN(String contentN) {
		this.contentN = contentN;
	}
	public Timestamp getTimeDate() {
		return timeDate;
	}
	public void setTimeDate(Timestamp timeDate) {
		this.timeDate = timeDate;
	}
	
}
