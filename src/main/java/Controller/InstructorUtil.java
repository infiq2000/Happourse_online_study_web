package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
				System.out.println(aid);
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

	
}
