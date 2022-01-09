package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

import javax.sql.DataSource;



import Model.Courses;
import Model.User;

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
	
}
