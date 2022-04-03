package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.Courses;
import Model.Instructor;
import Model.Profiles;
import Model.User;
import Model.UserAccount;

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
	
	public List<Courses> getMyCourses1(int ins_id) throws SQLException{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT *, d.name as category, e.ins_name FROM courses c, category d , instructor e where c.ins_id = ? and c.cid = d.cid and e.ins_id = c.ins_id";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, ins_id);
		myRS = myStmt.executeQuery();
		List<Courses> courses = new ArrayList<>();
		while (myRS.next()) {
			System.out.println("241");
			int courses_id = myRS.getInt("course_id");
			String name = myRS.getString("name");
			String skill = myRS.getString("skill");
			int price = myRS.getInt("price");
			String language = myRS.getString("language");
			String description = myRS.getString("description");
			double star_rate = myRS.getDouble("star_rate");
			String category = myRS.getString("category");
			String major = myRS.getString("major");
			String ins_name = myRS.getString("ins_name");
			courses.add(new Courses(courses_id, name, skill, price, language, star_rate, description, ins_id, ins_name, major, category));
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
	public List<Courses> getMyCoursesByMonth(int ins_id, int thisMonth, int thisYear) throws SQLException, ParseException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		List<Courses> ls = new ArrayList<>();
		myConn = dataSource.getConnection();
		Date start = Date.valueOf(String.join("-",Integer.toString(thisYear),Integer.toString(thisMonth),"1"));  
		Date stop = Date.valueOf(String.join("-",Integer.toString(thisYear),Integer.toString(thisMonth+1),"1"));  
		String sql = "SELECT count(u.course_id) as countCourses, c.* FROM courses c left join user_course u on u.course_id=c.course_id where ins_id = ? and start_date >= ? and start_date < ? GROUP BY course_id";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, ins_id);
		myStmt.setDate(2, start);
		myStmt.setDate(3, stop);
		myRS = myStmt.executeQuery();
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
			ls.add(new Courses(courses_id,name,skill,price,language,star_rate,description,ins_id, cid, countCourses));
		}
		myConn.close();
		return ls;
	}
	public Profiles getInstructorProfileByID(int ins_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT ins_name, major, description, birth, email, balance, country_name,img_path FROM instructor i, countries c WHERE ins_id = ? AND i.country_ID=c.country_ID";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, ins_id);
		myRS = myStmt.executeQuery();
		Profiles up = null;
		if (myRS.next()) {
			int id = ins_id;
			String name = myRS.getString("ins_name");
			String major = myRS.getString("major");
			String birth = "<p>Birthday: " + myRS.getDate("birth").toString() + "</p>";
			String email = "<p>Email: " + myRS.getString("email") + "</p>";
			String describe = "<h5>Description:</h5><p>" + myRS.getString("description") + "</p>";
			double balance = myRS.getDouble("balance");
			String countryName = "<p>Country: " + myRS.getString("country_name") + "</p>";
			String description = email + birth + countryName + describe;
			String img_path = myRS.getString("img_path");
			up = new Profiles(id, name, major, balance, description, img_path);
		}
		myConn.close();
		return up;
	}
	public UserAccount getInstructorInformationByID(int id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT i.aid,username,password,i.ins_id,ins_name,major,birth,email,address,description,education,country_name, img_path FROM account a, instructor i, countries c WHERE a.aid=i.aid AND i.country_ID=c.country_ID AND ins_id=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, id);
		myRS = myStmt.executeQuery();
		UserAccount ua = null;
		if (myRS.next()) {
			int aid = myRS.getInt("aid");
			String username = myRS.getString("username");
			String password = myRS.getString("password");
			String fullName = myRS.getString("ins_name");
			String major = myRS.getString("major");
			Date birth = myRS.getDate("birth");
			String email = myRS.getString("email");
			String address = myRS.getString("address");
			String describe = myRS.getString("description");
			String experiment = myRS.getString("education");
			String countryName = myRS.getString("country_name");
			String img_path = myRS.getString("img_path");
			ua = new UserAccount(aid,username,password,id,fullName,major,birth,"",email,
					address,describe,experiment,img_path,countryName);
		}
		myConn.close();
		return ua;
	}
	
	public void updateInstructor(int aid, String username, String fullName, String major, Date birth, String email,
			String address, String describe, String experiment, String countryName, String filename) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		myConn = dataSource.getConnection();
		String sql = "UPDATE account SET username=? WHERE aid=?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setString(1, username);
		myStmt.setInt(2, aid);
		myStmt.executeUpdate();
		sql = "UPDATE instructor SET ins_name=?, major=?, birth=?, email=?, address=?, instructor.description=?, education=?,img_path = ?, country_ID=(SELECT country_ID FROM countries WHERE country_name=?) WHERE aid=?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setString(1, fullName);
		myStmt.setString(2, major);
		myStmt.setDate(3, birth);
		myStmt.setString(4, email);
		myStmt.setString(5, address);
		myStmt.setString(6, describe);
		myStmt.setString(7, experiment);
		myStmt.setString(8, filename);
		myStmt.setString(9, countryName);
		myStmt.setInt(10, aid);
		
		myStmt.executeUpdate();
		myConn.close();
	}
}

	


