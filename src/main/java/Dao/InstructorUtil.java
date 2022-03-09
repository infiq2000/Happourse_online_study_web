package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.Instructor;

public class InstructorUtil {
	private DataSource dataSource;

	public InstructorUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	public Instructor getIns_Info(int ins_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from instructor where ins_id = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, ins_id);
			myRS = myStmt.executeQuery();
			Instructor ins = null;
			while (myRS.next()) {				
				String ins_name = myRS.getString("ins_name");
				String major = myRS.getString("major");
				String desciption = myRS.getString("description");
				int total_course = myRS.getInt("total_course");
				double total_rating = myRS.getDouble("total_rating");
				int aid = myRS.getInt("aid");
				ins = new Instructor(ins_id,ins_name,major,desciption ,total_course, total_rating,aid);
			}
			return ins;
		} 
		finally {
			myConn.close();
		}
	}
	public String getCate(int cate_id) throws SQLException {
		// TODO Auto-generated method stub
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;

		try {
			myConn = dataSource.getConnection();
			String sql = "select * from category where cid = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, cate_id);
			myRS = myStmt.executeQuery();
			String cate ="";
			if (myRS.next()) {
				cate = myRS.getString("name");
			}
			return cate;
		}
		finally {
			myConn.close();
		}
	}
	public void addIns(int aid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		
		// create SQL update statement;
		try {
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			String sql = "insert into happourse.instructor (ins_id, ins_name, major, description, total_course, total_rating, aid)" 
			+ "values(?, ?, ?, ?, ?, ?, ?)";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
		
			int tmp = getIndex();
			myStmt.setInt(1,tmp);
			myStmt.setString(2, "NewUser");
			myStmt.setString(3, "None");
			myStmt.setString(4, "None");
			myStmt.setInt(5, 0);
			myStmt.setInt(6, 0);
			myStmt.setInt(7, aid);
			
			// execute SQL statement
			myStmt.execute();
		}
		finally {
			myConn.close();
		}		
		
	}
	private int getIndex() throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select ins_id from happourse.instructor";
			myStmt = myConn.prepareStatement(sql);
			myRS = myStmt.executeQuery();
			List<Integer> lstIndex = new ArrayList<Integer>();
			while (myRS.next()) {
				Integer idx = myRS.getInt("ins_id");
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

	


