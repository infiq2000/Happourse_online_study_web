package Model;

import java.sql.Date;

public class Review {
	private String review_content;
	private float star_rate;
	private Date review_date;
	private String user_name;
	private String img_path;
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public float getStar_rate() {
		return star_rate;
	}
	public void setStar_rate(float star_rate) {
		this.star_rate = star_rate;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public Review(String review_content, float star_rate, Date review_date, String user_name, String img_path) {
		super();
		this.review_content = review_content;
		this.star_rate = star_rate;
		this.review_date = review_date;
		this.user_name = user_name;
		this.img_path = img_path;
	}	
}
