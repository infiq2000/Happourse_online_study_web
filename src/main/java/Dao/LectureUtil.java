package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.Chapter;
import Model.Courses;

public class LectureUtil {
	private DataSource dataSource;

	public LectureUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	public List<Chapter> getChapterOfCourse(int course_id) throws SQLException{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "select * from chapter where course_id = ? ";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, course_id);
		myRS = myStmt.executeQuery();
		List<Chapter> chapter = new ArrayList<>();
		while (myRS.next()) {
			int chap_id = myRS.getInt("chap_id");
			String name = myRS.getString("name");
			chapter.add(new Chapter(chap_id,name,course_id));
		}
		return chapter;
	}
}
