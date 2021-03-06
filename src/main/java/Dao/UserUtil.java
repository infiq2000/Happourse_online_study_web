package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.sql.DataSource;

//import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import Controller.Profile;
import Model.Account;
import Model.Courses;
import Model.User;
import Model.UserAccount;
import Model.Profiles;
import Model.Review;
import Model.Hashtag;
import Model.Note;
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
	public List<Object> getRate_TotalComment(int course_id) throws SQLException{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "select avg(rate) as rate, count(review_content) as comment from user_review where course_id = ? group by course_id";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, course_id);
		myRS = myStmt.executeQuery();
		int comment = 0;
		double rate = 0;
		if (myRS.next()) {
			rate = myRS.getDouble("rate");
			comment = myRS.getInt("comment");
		}
		myRS.close();
		return Arrays.asList(comment,rate);
	}
	public List<Courses> getAll_Courses() throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT i.major, i.img_path as img_ins, i.ins_name ,count(u.course_id) as countCourses, c.*, avg(ur.rate) as star_rate2, count( distinct ur.review_id) as comment\r\n"
				+ "FROM courses c \r\n"
				+ "left join user_course u on u.course_id=c.course_id \r\n"
				+ "left join category ca on ca.cid=c.cid \r\n"
				+ "inner join instructor i on i.ins_id=c.ins_id \r\n"
				+ "left join user_review ur on c.course_id = ur.course_id\r\n"
				+ "GROUP BY course_id ";
		myStmt = myConn.prepareStatement(sql);
		myRS = myStmt.executeQuery();
		List<Courses> courses = new ArrayList<>();
		while (myRS.next()) {
			String major = myRS.getString("major");
			String img_ins = myRS.getString("img_ins");
			String ins_name = myRS.getString("ins_name");
			
			int countCourses = myRS.getInt("countCourses");
			int courses_id = myRS.getInt("course_id");
			int comment = myRS.getInt("comment") ;
			
			String name = myRS.getString("name");
			String skill = myRS.getString("skill");
			double price = myRS.getDouble("price");
			String language = myRS.getString("language");
			String description =   myRS.getString("description");
			Date publish_date= myRS.getDate("publish_date");
			String img_path = myRS.getString("img_path");
			double star_rate = myRS.getDouble("star_rate2");
			int ins_id = myRS.getInt("ins_id");
			int cid = myRS.getInt("cid");
			int status = myRS.getInt("status");
			courses.add(new Courses(courses_id,name,skill,price,language,star_rate,description,ins_id, cid,ins_name, major, countCourses,img_path, img_ins,comment, publish_date,status ));
		}
		myConn.close();
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
		String sql = "SELECT uid, full_name, major, aid, birth, phone_number, email, address, u.describe, experiment, balance,img_path, u.country_ID, country_name FROM users u, countries c WHERE u.country_ID = c.country_ID AND uid=?;";
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
			String img_path = myRS.getString("img_path");
			String description = email + birth + countryName + describe;
			up = new Profiles(id, name, major, balance, description,img_path);
		}
		System.out.println("up: " + up.getBalance());
		myConn.close();
		return up;
	}

	public UserAccount getUserInformationByID(int id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT u.aid,username,password,u.uid,full_name,major,birth,phone_number,email,address,u.describe,experiment,country_name , img_path FROM account a, users u, countries c WHERE a.aid=u.aid AND u.country_ID=c.country_ID AND uid=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, id);
		myRS = myStmt.executeQuery();
		UserAccount ua = null;
		if (myRS.next()) {
			int aid = myRS.getInt("aid");
			String username = myRS.getString("username");
			String password = myRS.getString("password");
			String fullName = myRS.getString("full_name");
			String major = myRS.getString("major");
			Date birth = myRS.getDate("birth");
			String phoneNumber = myRS.getString("phone_number");
			String email = myRS.getString("email");
			String address = myRS.getString("address");
			String describe = myRS.getString("describe");
			String experiment = myRS.getString("experiment");
			String countryName = myRS.getString("country_name");
			String img_path = myRS.getString("img_path");
			ua = new UserAccount(aid,username,password,id,fullName,major,birth,phoneNumber,email,address,describe,experiment,img_path,countryName);
		}
		myConn.close();
		return ua;
	}

	public void updateUser(int aid, String username, String fullName, String major, Date birth, String phoneNumber,
			String email, String address, String describe, String experiment, String countryName, String filename) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "UPDATE account SET username=? WHERE aid=?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setString(1, username);
		myStmt.setInt(2, aid);
		myStmt.executeUpdate();
		sql = "UPDATE users SET full_name=?, major=?, birth=?, phone_number=?, email=?, address=?, users.describe=?, experiment=?,img_path = ?, country_ID=(SELECT country_ID FROM countries WHERE country_name=?) WHERE aid=?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setString(1, fullName);
		myStmt.setString(2, major);
		myStmt.setDate(3, birth);
		myStmt.setString(4, phoneNumber);
		myStmt.setString(5, email);
		myStmt.setString(6, address);
		myStmt.setString(7, describe);
		myStmt.setString(8, experiment);
		myStmt.setString(9, filename);
		myStmt.setString(10, countryName);
		myStmt.setInt(11, aid);
		
		myStmt.executeUpdate();
		myConn.close();
	}
	
	public List<Hashtag> getMyHashTags(int uid) throws SQLException{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT hashtag.hashid, hashtag.hashtag_name FROM happourse.user_hashtag, happourse.hashtag WHERE user_hashtag.hashid = hashtag.hashid and user_hashtag.uid = ?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, uid);
		myRS = myStmt.executeQuery();
		List<Hashtag> hashtags = new ArrayList<>();
		while (myRS.next()) {
			int id = myRS.getInt("hashid");
			String name = myRS.getString("hashtag_name");
			hashtags.add(new Hashtag(id, name));
		}
		myConn.close();
		return hashtags; 
	}
	
	public List<Hashtag> getAllHashtags() throws SQLException{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM happourse.hashtag;";
		myStmt = myConn.prepareStatement(sql);
		myRS = myStmt.executeQuery();
		List<Hashtag> hashtags = new ArrayList<>();
		while (myRS.next()) {
			int id = myRS.getInt("hashid");
			String name = myRS.getString("hashtag_name");
			hashtags.add(new Hashtag(id, name));
		}
		myConn.close();
		return hashtags;
	}

	public List<Review> getAllReview(int course_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "select review_content, rate, review_time, full_name, img_path from users u, user_review r where u.uid=r.uid and course_id=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, course_id);
		myRS = myStmt.executeQuery();
		List<Review> reviewList = new ArrayList<>();
		while (myRS.next()) {
			String reviewContent = myRS.getString("review_content");
			float starRate = myRS.getFloat("rate");
			Date reviewDate = myRS.getDate("review_time");
			String fullName = myRS.getString("full_name");
			String imgPath = myRS.getString("img_path");
			if (imgPath == null) imgPath = "images/avatar/avatarrfv4Ab.jpg";
			reviewList.add(new Review(reviewContent, starRate, reviewDate, fullName, imgPath));
		}
		myConn.close();
		return reviewList;
	}

	public void addReviewOfUser(int uid, int course_id, float rating, String review_content) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		String sql = "insert into user_review values (?,?,?,?,?,?);";
		myConn = dataSource.getConnection();
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, getReviewIndex());
		myStmt.setString(2, review_content);
		myStmt.setFloat(3, rating);
		@SuppressWarnings("deprecation")
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        myStmt.setDate(4, sqlDate);
        myStmt.setInt(5, uid);
        myStmt.setInt(6, course_id);
        myStmt.executeUpdate();
        myConn.close();
		
	}
	
	public int getReviewIndex() throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		String sql = "select * from user_review";
		myConn = dataSource.getConnection();
		myStmt = myConn.prepareStatement(sql);
		myRS = myStmt.executeQuery();
		int i = 1;
		while (myRS.next()) {
			if (i != myRS.getInt("review_id")) {
				myConn.close();
				return i;
			}
			i += 1;
		}
		return i;
	}

	public int checkReviewed(int uid, int course_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		String sql = "select * from user_review where uid=? and course_id=?;";
		myConn = dataSource.getConnection();
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, uid);
		myStmt.setInt(2, course_id);
		myRS = myStmt.executeQuery();
		int i = 0;
		if (myRS.next()) i = 1;
		myConn.close();
		return i;
	}
	
	public List<User> getAllUsers() throws SQLException{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "select users.* , count(user_course.course_id) as count from users, user_course where users.uid = user_course.uid group by user_course.uid";
		myStmt = myConn.prepareStatement(sql);
		myRS = myStmt.executeQuery();
		List<User> users = new ArrayList<>();
		while (myRS.next()) {
			int uid = myRS.getInt("uid");
			String full_name = myRS.getString("full_name");
			String major = myRS.getString("major");
			Date birth = myRS.getDate("birth");
			String phone_number = myRS.getString("phone_number");
			String email = myRS.getString("email");
			int aid = myRS.getInt("aid");
			String describe = myRS.getString("describe");
			String experiment = myRS.getString("experiment");
			double balance = myRS.getDouble("balance");
			String img_path = myRS.getString("img_path");
			String country_ID = myRS.getString("country_ID");
			int count = myRS.getInt("count");
			users.add(new User(uid, full_name, major, birth, phone_number, email, aid, describe, 
					experiment, balance, img_path, country_ID, count));
		}
		return users;
	}

	public float getAverageRating(List<Review> reviewList) {
		float sumRating = 0;
		int count = 0;
		for (Review review : reviewList) {
			count += 1;
			sumRating += review.getStar_rate();
		}
		if (count == 0) return 5;
		return (float) (Math.round(sumRating*10/count)/10.0);
	}

	public int[] countFeedback(List<Review> reviewList) {
		int[] listFeedback = {0,0,0,0,0,0};
		int i = 1;
		while (i <= 5) {
			for (Review review : reviewList) {
				if ((int) review.getStar_rate() == i) listFeedback[i] += 1;
			}
			i += 1;
		}
		return listFeedback;
	}

	public void buyHPCoin(int uid) throws SQLException {
		
		Connection myConn = null;
		PreparedStatement myStmt = null;
		myConn = dataSource.getConnection();
		String sql = "UPDATE users SET balance = balance + 220 WHERE uid = ?";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, uid);
	
		myStmt.executeUpdate();
		myConn.close();
		
	}

	public List<Note> getNote(int uid) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT * FROM happourse.note where uid = ? order by dateandtime desc ";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, uid);
		myRS = myStmt.executeQuery();
		List<Note> ls = new ArrayList<>();
		while (myRS.next()) {
			String content = myRS.getString("content");
			Timestamp ts = myRS.getTimestamp("dateandtime");
			ls.add(new Note(content, ts));
		}
		myConn.close();
		return ls;
	}

	public void insertNode(int uid, String text) throws SQLException {
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		Connection myConn = null;
		PreparedStatement myStmt = null;
		String sql = "insert into happourse.note(content, dateandtime, uid) values (?,?,?);";
		myConn = dataSource.getConnection();
		myStmt = myConn.prepareStatement(sql);
		myStmt.setString(1, text);
		myStmt.setTimestamp(2, timestamp);
		myStmt.setInt(3, uid);
        myStmt.executeUpdate();
        myConn.close();
	}
	
}
