package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import javax.sql.DataSource;

import Controller.Profile;
import Model.Courses;
import Model.User;
import Model.Profiles;
import Dao.AccountUtil; 
public class UserUtil {
	private DataSource dataSource;

	public UserUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	/*
	 * public Hashtable<Integer,String> getNameById() throws SQLException {
	 * Connection myConn = null; PreparedStatement myStmt = null; ResultSet myRS =
	 * null; try { myConn = dataSource.getConnection(); String sql =
	 * "select * from instructor"; myStmt = myConn.prepareStatement(sql); myRS =
	 * myStmt.executeQuery(); Hashtable<Integer, String> my_dict = new
	 * Hashtable<Integer, String>(); while (myRS.next()) { int ins_id =
	 * myRS.getInt("ins_id"); String ins_name = myRS.getString("ins_name");
	 * my_dict.put(ins_id, ins_name); } return my_dict; } finally {
	 * 
	 * } }
	 */
	public User getUser(int aid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from users where aid = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, aid);
			myRS = myStmt.executeQuery();
			User user = null;
			if (myRS.next()) {
				
				int uid = myRS.getInt("uid");
				String full_name = myRS.getString("full_name");
				String major = myRS.getString("major");
				
				user = new User(uid,full_name, major,aid);
			}
			return user;
		} 
		finally {
			myConn.close();
		}
	}
	public User getUserbyID(int uid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from users where uid = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, uid);
			myRS = myStmt.executeQuery();
			User user = null;
			if (myRS.next()) {
				
				int aid = myRS.getInt("aid");
				String full_name = myRS.getString("full_name");
				String major = myRS.getString("major");
				
				user = new User(uid,full_name, major,aid);
			}
			return user;
		} 
		finally {
			myConn.close();
		}
	}
	public List<Courses> getAll_Courses() throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "select * from courses ";
		myStmt = myConn.prepareStatement(sql);
		myRS = myStmt.executeQuery();
		List<Courses> courses = new ArrayList<>();
		while (myRS.next()) {
			int courses_id = myRS.getInt("course_id");
			String name = myRS.getString("name");
			String skill = myRS.getString("skill");
			int price = myRS.getInt("price");
			String language = myRS.getString("language");
			String description = myRS.getString("description");
			double star_rate = myRS.getDouble("star_rate");
			int  ins_id = myRS.getInt("ins_id");
			int cid = myRS.getInt("cid");
			courses.add(new Courses(courses_id,name,skill,price,language,star_rate,description,ins_id, cid));
		}
		return courses;
	}

	public void updateStudent(User user) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		// create SQL update statement;
		try {
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "update users "
						+ "set full_name=?, major=?"
						+ "where uid=?";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			
			// set params
			myStmt.setString(1, user.getFull_name());
			myStmt.setString(2, user.getMajor());
			myStmt.setInt(3, user.getUid());
			
			// execute SQL statement
			myStmt.execute();
		}
		finally {
			myConn.close();
		}
		
	}
	public void addUser(int aid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		// create SQL update statement;
		try {
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "insert into happourse.users (uid, full_name, major, aid)" + "values(?, ?, ?, ?)";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
		
			int tmp =getIndex();
			myStmt.setInt(1,tmp);
			System.out.println(tmp);
			myStmt.setString(2, "NewUser");
			myStmt.setString(3, "None");
			myStmt.setInt(4, aid);
			
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
			String sql = "select uid from happourse.users";
			myStmt = myConn.prepareStatement(sql);
			myRS = myStmt.executeQuery();
			List<Integer> lstIndex = new ArrayList<Integer>();
			while (myRS.next()) {
				Integer idx = myRS.getInt("uid");
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
	
	public float getBalance(int uid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		float balance = 0;
		try {
			myConn = dataSource.getConnection();
			String sql = "select balance from happourse.users where uid=?;";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, uid);			
			myRS = myStmt.executeQuery();
			if (myRS.next()) {
				balance = myRS.getFloat("balance");
			}
		}finally {
			myConn.close();
		}
		return balance;
	}

	public Profiles getUserProfileByID(int uid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT uid, full_name, major, aid, birth, phone_number, email, address, u.describe, experiment, balance, u.country_ID, country_name FROM users u, countries c WHERE u.country_ID = c.country_ID AND uid=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, uid);
		myRS = myStmt.executeQuery();
		Profiles up = null;
		if (myRS.next()) {
			int id = uid;
			String name = myRS.getString("full_name");
			String major = myRS.getString("major");
			String birth = "<p>Birthday: " + myRS.getDate("birth").toString() + "</p>";
			String email = "<p>Email: " + myRS.getString("email") + "</p>";
			String describe = "<h5>Description:</h5><p>" + myRS.getString("describe") + "</p>";
			String experiment = "<p>Experiment: " + myRS.getString("experiment") + "</p>";
			double balance = myRS.getDouble("balance");
			String countryName = "<p>Country: " + myRS.getString("country_name") + "</p>";
			String description = email + birth + countryName + describe;
			up = new Profiles(id, name, major, balance, description);
		}
		myConn.close();
		return up;
	}
}
