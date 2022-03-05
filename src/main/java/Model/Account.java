package Model;

import java.sql.Connection;
import java.sql.DriverManager;

public class Account {
	private int aid;
	private String username;
	private String password;
	private boolean type;
	public Account(int aid, String username, String password, boolean type) {
		super();
		this.aid = aid;
		this.username = username;
		this.password = password;
		this.type = type;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isType() {
		return type;
	}
	public void setType(boolean type) {
		this.type = type;
	}
}
