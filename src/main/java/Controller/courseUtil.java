package Controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.Courses;


public class courseUtil {
	private DataSource dataSource;

	public courseUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public Courses getCourseDetail(int course_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "select * from courses where course_id = ?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, course_id);
		myRS = myStmt.executeQuery();
		Courses course = null;
		if (myRS.next()) {			
			int courses_id = myRS.getInt("course_id");
			String name = myRS.getString("name");
			String skill = myRS.getString("skill");
			int price = myRS.getInt("price");
			String language = myRS.getString("language");
			String description = myRS.getString("description");
			double star_rate = myRS.getDouble("star_rate");
			int  ins_id = myRS.getInt("ins_id");
			int cid = myRS.getInt("cid");
			course = new Courses(courses_id,name,skill,price,language,star_rate,description,ins_id, cid);
		}
		myConn.close();
		return course;
	}

	public List<Courses> listCourse_Id(int uid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM Happourse.courses c, Happourse.instructor i WHERE c.ins_id = i.ins_id  AND c.course_id IN ( SELECT course_id FROM Happourse.user_course WHERE uid = ?)";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, uid);
		myRS = myStmt.executeQuery();
		List<Courses> ls = new ArrayList<>();
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
			String ins_name = myRS.getString("ins_name");
			String major = myRS.getString("major");
			Courses course = new Courses(courses_id,name,skill,price,language,star_rate,description,ins_id, cid,ins_name, major);
			ls.add(course);
		}
		myConn.close();
		return ls;
	}

	public void insert(int course_id, int uid) throws SQLException {
		Connection myConn = null;
		myConn = dataSource.getConnection();
		String sql = "INSERT INTO user_course(transaction_id,uid, course_id, start_date)" 
	            + "VALUES(?,?,?,?)";
		PreparedStatement pstmt = myConn.prepareStatement(sql);
		pstmt.setString(1, "T004");
		pstmt.setInt(2, uid);
        pstmt.setInt(3, course_id);
        @SuppressWarnings("deprecation")
		java.util.Date myDate = new java.util.Date("10/10/2009");
        java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());
        pstmt.setDate(4, sqlDate);
       
        int rowAffected = pstmt.executeUpdate();
   
        System.out.println(rowAffected);
		myConn.close();
		
	}

}
