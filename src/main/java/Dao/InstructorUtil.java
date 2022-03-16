package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.Courses;
import Model.Instructor;
import Model.User;

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
				ins = new Instructor(ins_id, ins_name, major, desciption ,total_course, total_rating,aid);
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
	public Instructor getIns(int aid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from instructor where aid = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, aid);
			myRS = myStmt.executeQuery();
			Instructor ins = null;
			if (myRS.next()) {
				
				int ins_id = myRS.getInt("ins_id");
				String ins_name = myRS.getString("ins_name");
				String major = myRS.getString("major");
				String desciption = myRS.getString("description");
				int total_course = myRS.getInt("total_course");
				double total_rating = myRS.getDouble("total_rating");
				ins = new Instructor(ins_id, ins_name, major, desciption ,total_course, total_rating,aid);
			}
			return ins;
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
	
	public List<Courses> getMyCourses(int ins_id) throws SQLException{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT count(u.course_id) as countCourses, c.* FROM courses c left join user_course u on u.course_id=c.course_id where ins_id = ? GROUP BY course_id";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, ins_id);
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
			int cid = myRS.getInt("cid");
			int countCourses = myRS.getInt("countCourses");
			courses.add(new Courses(courses_id,name,skill,price,language,star_rate,description,ins_id, cid, countCourses));
		}
		
		myConn.close();
		return courses;
	}
	
	public int getToTalCourses(int ins_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		int total = -1;
		try {
			myConn = dataSource.getConnection();
			String sql = "select * from happourse.instructor where ins_id = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, ins_id);
			myRS = myStmt.executeQuery();
			
			
			while (myRS.next()) {
				total = myRS.getInt("total_course");
			}
			
		} 
		finally {
			myConn.close();
		}
		return total;
	}
	
	public int getMyStudent(int ins_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		int total = -1;
		try {
			myConn = dataSource.getConnection();
			String sql = "SELECT COUNT(DISTINCT a.uid) FROM user_course a, courses b "
					+ "WHERE a.course_id = b.course_id AND b.ins_id= ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, ins_id);
			myRS = myStmt.executeQuery();
			
			
			while (myRS.next()) {
				total = myRS.getInt(1);
			}
		} 
		finally {
			myConn.close();
		}
		return total;
	}
	
	public float getBalance(int ins_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		float balance = -1;
		try {
			myConn = dataSource.getConnection();
			String sql = "select balance from happourse.instructor where ins_id = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, ins_id);
			myRS = myStmt.executeQuery();
			
			
			if (myRS.next()) {
				balance = myRS.getFloat("balance");
			}
		} 
		finally {
			myConn.close();
		}
		return balance;
	}
	
	public float getTotalSales(int ins_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		float total_sales = -1;
		try {
			myConn = dataSource.getConnection();
			String sql = "SELECT SUM(c.price) as total_sales FROM user_course u, courses c WHERE u.course_id = c.course_id AND c.ins_id = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, ins_id);
			myRS = myStmt.executeQuery();
			
			
			if (myRS.next()) {
				total_sales = myRS.getFloat("total_sales");
			}
			
		} 
		finally {
			myConn.close();
		}
		return total_sales;
	}
}

	


