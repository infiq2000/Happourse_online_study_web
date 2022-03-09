package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
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
	public boolean checkOverlap(String username) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from account ";
			myStmt = myConn.prepareStatement(sql);
			myRS = myStmt.executeQuery();
			List<String> lstUsername = new ArrayList<String>();
			while (myRS.next()) {
				String username1 = myRS.getString("username");
				if(username.equals(username1)) {
					return true;
				}
			}
			return false;
		}
		finally {
			myConn.close();
		}
	}
	public void addAccount(int aid, String username, String email, String password, int type) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		// create SQL update statement;
		try {
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "insert into happourse.account (aid, username, password, type)" + "values(?, ?, ?, ?)";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setInt(1, aid);
			myStmt.setString(2, username);
			myStmt.setString(3, password);
			myStmt.setInt(4, type);
			
			// execute SQL statement
			myStmt.execute();
		}
		finally {
			myConn.close();
		}		
	}
	
	public Integer getIndex() throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select aid from happourse.account";
			myStmt = myConn.prepareStatement(sql);
			myRS = myStmt.executeQuery();
			List<Integer> lstIndex = new ArrayList<Integer>();
			while (myRS.next()) {
				Integer idx = myRS.getInt("aid");
				lstIndex.add(idx);
			}
			int i = 1;
			while(true) {
				if(lstIndex.contains(i)) {
					i++;
				} else {
					return i;
				}
			}
		} 
		finally {
			myConn.close();
		}
	}
}
