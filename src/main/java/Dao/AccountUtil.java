package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import Model.Account;
import Model.User;

public class AccountUtil {
	private DataSource dataSource;

	public AccountUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	public Account getAccount(int aid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from account where aid = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, aid);
			myRS = myStmt.executeQuery();
			Account acc = null;
			if (myRS.next()) {
				String userName = myRS.getString("userName");
				String passWord = myRS.getString("passWord");
				boolean type = myRS.getBoolean("type");
				acc = new Account(aid,userName,passWord,type);
			}
			return acc;
		} 
		finally {
			myConn.close();
		}
	}
	
	public Account validation(String userName, String passWord) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from account where userName = ? and password = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, userName);
			myStmt.setString(2, passWord);
			myRS = myStmt.executeQuery();
			Account acc = null;
			if (myRS.next()) {
				int aid = myRS.getInt("aid");
				boolean type = myRS.getBoolean("type");
				acc = new Account(aid,userName,passWord,type);
			}
			return acc;
		}
		finally {
			myConn.close();
		}
	}
}
