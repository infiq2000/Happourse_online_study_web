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
import Model.Content;

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
		int dem = 0;
		while (myRS.next()) {
			dem++;
			int chap_id = myRS.getInt("chap_id");
			String name = myRS.getString("name");
			chapter.add(new Chapter(chap_id,name,course_id));
		}
		System.out.println(dem);
		return chapter;
	}
	
	public List<Content> getContents(int chap_id) throws SQLException{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "select * from  happourse.lecturer_content where chap_id = ? ";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, chap_id);
		myRS = myStmt.executeQuery();
		
		List<Content> contents = new ArrayList<>();
		int count = 0;
		while (myRS.next()) {
			count++;
			int lc_id = myRS.getInt("lc_id");
			String name = myRS.getString("name");
			String type = myRS.getString("type");
			String link = myRS.getString("link");
			contents.add(new Content(lc_id,name,type, link, chap_id));
		}
		System.out.println(count);
		return contents;
	}
}
