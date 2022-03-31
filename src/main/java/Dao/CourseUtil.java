package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Controller.ManageCourses;
import Model.Category;
import Model.Courses;
import Model.ManagedCourses;
import Model.Hashtag;


public class CourseUtil {
	private DataSource dataSource;
	UserUtil userUtil;

	public CourseUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
		userUtil = new UserUtil(dataSource);
	}
	
	protected Courses takeCourseFromRS(ResultSet myRS) throws SQLException {
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
		return new Courses(courses_id,name,skill,price,language,star_rate,description,ins_id, cid,ins_name, major);
	}
	
	public Courses getCourseDetail(int course_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;

		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM happourse.courses c, Happourse.instructor i WHERE course_id=? AND (c.ins_id = i.ins_id);";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, course_id);
		myRS = myStmt.executeQuery();
		Courses course = null;
		if (myRS.next()) {			
			course = takeCourseFromRS(myRS);
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
			Courses course = takeCourseFromRS(myRS);
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
		String index = this.getIndex();
		pstmt.setString(1, index);
		pstmt.setInt(2, uid);
        pstmt.setInt(3, course_id);
        @SuppressWarnings("deprecation")
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        pstmt.setDate(4, sqlDate);
       
        pstmt.executeUpdate();
   
		myConn.close();
		
	}
	public String getIndex() throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "SELECT transaction_id FROM happourse.user_course;";
			myStmt = myConn.prepareStatement(sql);
			myRS = myStmt.executeQuery();
			List<String> lstIndex = new ArrayList<String>();
			while (myRS.next()) {
				String idx = myRS.getString("transaction_id");
				lstIndex.add(idx);
			}
			int i = 1;
			while(true) {
				if(lstIndex.contains(Integer.toString(i))) {
					i++;
				} else {
					return Integer.toString(i);
				}
			}
		} 
		finally {
			myConn.close();
		}
	}

	public List<Category> getCategories() throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM category;";
		myStmt = myConn.prepareStatement(sql);
		myRS = myStmt.executeQuery();
		List<Category> ls = new ArrayList<>();		
		while (myRS.next()) {			
			int cid = myRS.getInt("cid");
			String name = myRS.getString("name");
			Category category = new Category(cid,name);
			ls.add(category);
		}
		myConn.close();
		return ls;
  }
	
	public List<Hashtag> getAllHashtags() throws SQLException{
		Connection myConn = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM hashtag;";
		PreparedStatement pstmt = myConn.prepareStatement(sql);
		myRS = pstmt.executeQuery();
		List<Hashtag> ls = new ArrayList<>();
		while (myRS.next()) {			
			int id = myRS.getInt("hashid");
			String name = myRS.getString("hashtag_name");
			Hashtag temp = new Hashtag(id, name);
			ls.add(temp);
		}
		myConn.close();
		return ls;
	}

	public List<Courses> getCourseByCategory(int cid) throws SQLException {
		Connection myConn = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM happourse.courses c, Happourse.instructor i WHERE cid=? AND (c.ins_id = i.ins_id);";
		PreparedStatement pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, cid);
		myRS = pstmt.executeQuery();
		List<Courses> ls = new ArrayList<>();
		while (myRS.next()) {			
			Courses course = takeCourseFromRS(myRS);
			ls.add(course);
		}
		myConn.close();
		return ls;
	}

	public Courses checkSignedCourse(int course_id, int uid) throws SQLException {
		Connection myConn = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM happourse.user_course c WHERE uid=? AND course_id=?;";
		PreparedStatement pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, uid);
		pstmt.setInt(2, course_id);
		myRS = pstmt.executeQuery();
		Courses course;
		if (myRS.next()) {
			course = getCourseDetail(course_id);
			myConn.close();
			return course;
		} else {
			myConn.close();
			return null;
		}
	}

	public void removeCourse(int uid, int course_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "DELETE FROM happourse.user_course WHERE uid=? AND course_id=?;";
			pstmt = myConn.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.setInt(2, course_id);
			pstmt.execute();
		}
		finally {
			myConn.close();
		}
	}

	public List<Courses> searchCourseByName(String name) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		List<Courses> li = new ArrayList<>();
		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM happourse.courses c, Happourse.instructor i WHERE c.name like ? AND (c.ins_id = i.ins_id);";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setString(1, "%"+name+"%");
		myRS = pstmt.executeQuery();
		while (myRS.next()) {
			Courses course = takeCourseFromRS(myRS);
			li.add(course);
		}
		myConn.close();
		return li;
	}

	public List<Courses> getNewCourses() throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		List<Courses> li = new ArrayList<>();
		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM happourse.courses c, Happourse.instructor i WHERE (c.ins_id = i.ins_id) ORDER BY publish_date DESC;";
		pstmt = myConn.prepareStatement(sql);
		myRS = pstmt.executeQuery();
		while (myRS.next()) {
			Courses course = takeCourseFromRS(myRS);
			li.add(course);
		}
		myConn.close();
		return li;
	}

	public List<Courses> getFreeCourses() throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		List<Courses> li = new ArrayList<>();
		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM happourse.courses c, Happourse.instructor i WHERE price = ? AND (c.ins_id = i.ins_id);";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, 0);
		myRS = pstmt.executeQuery();
		while (myRS.next()) {
			Courses course = takeCourseFromRS(myRS);
			li.add(course);
		}
		myConn.close();
		return li;
	}

	public List<Courses> getPopularCourses() throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		List<Courses> li = new ArrayList<>();
		myConn = dataSource.getConnection();
		String sql = "SELECT c.course_id, name, skill, price, language, c.description, star_rate, i.ins_id, cid, ins_name, major, COUNT(u.course_id) as dem FROM courses c LEFT JOIN user_course u ON u.course_id = c.course_id RIGHT JOIN instructor i ON i.ins_id = c.ins_id GROUP BY c.course_id ORDER BY dem DESC ;";
		pstmt = myConn.prepareStatement(sql);
		myRS = pstmt.executeQuery();
		while (myRS.next()) {
			Courses course = takeCourseFromRS(myRS);
			li.add(course);
		}
		myConn.close();
		return li;
	}
	
	public int courseNumberPage(List<Courses> courses) {
		int coursePage = 3;
		int coursesNumber = courses.size();
		int pagesNumber = (int) (coursesNumber / coursePage);
		if (coursesNumber % coursePage != 0) pagesNumber++;
		if (pagesNumber == 0) pagesNumber++;
		return pagesNumber;
	}
		
	public List<Courses> getCoursesByPage(List<Courses> li, int page) {
		List<Courses> course = new ArrayList<>();
		for (int i = (page-1)*3; i <= page*3-1; i++) {
			if (i == li.size()) break;
			course.add(li.get(i));
		}
		return course;
	}
	
	public List<Courses> getCourseByType(String type) {
		List<Courses> li = new ArrayList<>();
		switch (type) {
			case "all": {
				try {
					li = userUtil.getAll_Courses();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			case "new": {
				try {
					li = getNewCourses();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			case "popular": {
				try {
					li = getPopularCourses();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			case "free": {
				try {
					li = getFreeCourses();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + type);
		}
		return li;
	}

	public float getPrice(int course_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		float price = 0;
		myConn = dataSource.getConnection();
		String sql = "select price from happourse.courses where course_id=?";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, course_id);
		myRS = pstmt.executeQuery();
		if (myRS.next()) {
			try {
				price = (float) myRS.getInt("price");
			}catch (Exception e) {
				// TODO: handle exception
			}			
		}
		myConn.close();
		return price;
	}

	public void minusBalance(int uid, float price) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		myConn = dataSource.getConnection();
		String sql = "update happourse.users set balance=balance-? where uid=?";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setFloat(1, price);
		pstmt.setInt(2, uid);
		pstmt.executeUpdate();
		myConn.close();
	}

	public List<ManagedCourses> getManagedCourses(int ins_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		List<ManagedCourses> ls = new ArrayList<>();
		myConn = dataSource.getConnection();
		String sql = "SELECT count(u.course_id) as countCourses, c.*, ca.name as categoryName FROM courses c left join user_course u on u.course_id=c.course_id left join category ca on ca.cid=c.cid where ins_id = ? GROUP BY course_id";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, ins_id);
		myRS = pstmt.executeQuery();
		int count = 0;
		while (myRS.next()) {
			count += 1;
			String name = "";
			if (count < 10) {
				name = "0" + Integer.toString(count) + ". " + myRS.getString("name");
			} else {
				name = Integer.toString(count) + ". " + myRS.getString("name");
			}
			int courses_id = myRS.getInt("course_id");
			
			int countCourses = myRS.getInt("countCourses");
			String skill = myRS.getString("skill");
			int price = myRS.getInt("price");
			String language = myRS.getString("language");
			double starRate = myRS.getDouble("star_rate");
			String description = myRS.getString("description");
			int cid = myRS.getInt("cid");
			String category = myRS.getString("categoryName");
			Date publishDate = myRS.getDate("publish_date");
			int temp = myRS.getInt("mood");
			String mood, color;
			if (temp == 1) {
				mood = "HIGH";
				color = "green";
			} else {
				mood = "LOW";
				color = "red";
			}
			ls.add(new ManagedCourses(courses_id, name, skill, price, language, starRate,
					description, ins_id, cid, countCourses, category, publishDate, mood, color));
		}
		myConn.close();
		return ls;
	}

	public void deleteCourseByCourseID(int course_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "DELETE FROM courses WHERE course_id=?;";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, course_id);
		pstmt.execute();
		myConn.close();
	}

	public List<ManagedCourses> sortCoursesBySalesNumber(int ins_id, boolean desc) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		List<ManagedCourses> ls = new ArrayList<>();
		myConn = dataSource.getConnection();
		String sql = "";
		if (desc)
			sql = "SELECT count(u.course_id) as countCourses, c.*, ca.name as categoryName FROM courses c left join user_course u on u.course_id=c.course_id left join category ca on ca.cid=c.cid where ins_id = ? GROUP BY course_id ORDER BY countCourses DESC;";
		else
			sql = "SELECT count(u.course_id) as countCourses, c.*, ca.name as categoryName FROM courses c left join user_course u on u.course_id=c.course_id left join category ca on ca.cid=c.cid where ins_id = ? GROUP BY course_id ORDER BY countCourses ASC;";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, ins_id);
		myRS = pstmt.executeQuery();
		int count = 0;
		while (myRS.next()) {
			count += 1;
			String name = "";
			if (count < 10) {
				name = "0" + Integer.toString(count) + ". " + myRS.getString("name");
			} else {
				name = Integer.toString(count) + ". " + myRS.getString("name");
			}
			int courses_id = myRS.getInt("course_id");
			
			int countCourses = myRS.getInt("countCourses");
			String skill = myRS.getString("skill");
			int price = myRS.getInt("price");
			String language = myRS.getString("language");
			double starRate = myRS.getDouble("star_rate");
			String description = myRS.getString("description");
			int cid = myRS.getInt("cid");
			String category = myRS.getString("categoryName");
			Date publishDate = myRS.getDate("publish_date");
			int temp = myRS.getInt("mood");
			String mood, color;
			if (temp == 1) {
				mood = "HIGH";
				color = "green";
			} else {
				mood = "LOW";
				color = "red";
			}
			ls.add(new ManagedCourses(courses_id, name, skill, price, language, starRate,
					description, ins_id, cid, countCourses, category, publishDate, mood, color));
		}
		myConn.close();
		return ls;
	}
	public int getIndexOfCourse() throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "SELECT course_id FROM happourse.courses;";
			myStmt = myConn.prepareStatement(sql);
			myRS = myStmt.executeQuery();
			List<String> lstIndex = new ArrayList<String>();
			while (myRS.next()) {
				String idx = myRS.getString("course_id");
				lstIndex.add(idx);
			}
			int i = 1;
			while(true) {
				if(lstIndex.contains(Integer.toString(i))) {
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

	public int insertNewCourse(String course_name, String description, int cid, int price, String language,
			float star_rate, float duration, int ins_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		int course_id = 0;
		// create SQL update statement;
		try {
			myConn = dataSource.getConnection();
			
			// create SQL update statement
			//course_id, name, skill, price, language, star_rate, description, duration, ins_id, cid
			String sql = "insert into happourse.courses (course_id, name, skill, price, language, star_rate, description, ins_id, cid)" + "values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			// prepare statement
			myStmt = myConn.prepareStatement(sql);
			course_id = getIndexOfCourse();
			String skill = "Dang fix cung";
			// set params
			myStmt.setInt(1, course_id);
			myStmt.setString(2, course_name);
			myStmt.setString(3, skill);
			myStmt.setInt(4, price);
			myStmt.setString(5, language);
			myStmt.setFloat(6, star_rate);
			myStmt.setString(7, description);
			myStmt.setInt(8, ins_id);
			myStmt.setInt(9, cid);
			// execute SQL statement
			myStmt.execute();
			
		}
		finally {
			myConn.close();
		}
		return course_id;
		
	}
	public int getIndexOfChapter() throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "SELECT chap_id FROM happourse.chapter;";
			myStmt = myConn.prepareStatement(sql);
			myRS = myStmt.executeQuery();
			List<String> lstIndex = new ArrayList<String>();
			while (myRS.next()) {
				String idx = myRS.getString("chap_id");
				lstIndex.add(idx);
			}
			int i = 1;
			while(true) {
				if(lstIndex.contains(Integer.toString(i))) {
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

	public void addChapter(int chapter_id, int course_id, String name) throws SQLException {
		// TODO Auto-generated method stub
		Connection myConn = null;
		myConn = dataSource.getConnection();
		String sql = "INSERT INTO chapter(chap_id,name,course_id)" 
	            + "VALUES(?,?,?)";
		PreparedStatement pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, chapter_id);
		pstmt.setString(2, name);
        pstmt.setInt(3, course_id);
        pstmt.execute();
		myConn.close();
	}
	public int countCourseByUID(int uid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT count(uid) as dem FROM happourse.user_course WHERE uid=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, uid);
		myRS = myStmt.executeQuery();
		int countCourses = 0;
		if (myRS.next()) {
			countCourses = myRS.getInt("dem");
		}
		myConn.close();
		return countCourses;
	}

	public int getIndexOfContent() throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "SELECT lc_id FROM happourse.lecturer_content;";
			myStmt = myConn.prepareStatement(sql);
			myRS = myStmt.executeQuery();
			List<Integer> lstIndex = new ArrayList<Integer>();
			while (myRS.next()) {
				int idx = myRS.getInt("lc_id");
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

	public void addContent(int lc_id, String nameContent, String desription, int chapter_id, String url) throws SQLException {
		Connection myConn = null;
		myConn = dataSource.getConnection();
		String sql = "INSERT INTO lecturer_content(lc_id,name, link,chap_id) VALUES(?, ?,?,?);";
		PreparedStatement pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, lc_id);
		pstmt.setString(2,nameContent);
        pstmt.setString(3, url);
        pstmt.setInt(4, chapter_id);
        pstmt.execute();
        System.out.println("thanh cong2");
		myConn.close();
	}
	
	public String getCategory(int cid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		try {
			myConn = dataSource.getConnection();
			String sql = "SELECT name FROM happourse.category WHERE cid = ?;";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, cid);
			myRS = myStmt.executeQuery();
			String name = null;
			if (myRS.next()) {
				name = myRS.getString("name");
			}
			myConn.close();
			return name;
		} 
		finally {
			myConn.close();
		}
	}
}
