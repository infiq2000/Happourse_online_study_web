package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.sql.DataSource;

import Model.Chapter;
import Model.Courses;
import Model.Lecture;
import Model.Content;

public class LectureUtil {
	private DataSource dataSource;
	DateFormat format = new SimpleDateFormat("HH:mm:ss");

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
		myConn.close();
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
		myConn.close();
		return contents;
	}
	public List<Lecture> getLecturesByChapter(int chap_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT lc_id, l.name, type, link, l.duration, l.chap_id, course_id FROM lecturer_content l, chapter c WHERE l.chap_id=c.chap_id AND l.chap_id=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, chap_id);
		myRS = myStmt.executeQuery();
		List<Lecture> ls = new ArrayList<>();
		int count = 0;
		while (myRS.next()) {
			count += 1;
			int lectureID = myRS.getInt("lc_id");
			String name = "";
			if (count < 10) name += "0" + Integer.toString(count) + ". ";
			else name += Integer.toString(count) + ". ";
			name += myRS.getString("name");
			String type = myRS.getString("type");
			String link = myRS.getString("link");
			String duration = format.format(myRS.getTime("duration", Calendar.getInstance()));
			int chapterID = myRS.getInt("chap_id");
			int courseID = myRS.getInt("course_id");
			ls.add(new Lecture(lectureID, name, type, link, duration, chapterID, courseID));
		}
		myConn.close();
		return ls;
	}
	
	private String convertDoubleToTime(Double time) {
		int hours = (int) (time / 3600);
		int minutes = (int) ((time - hours * 3600) / 60);
		int seconds = (int) (time - hours * 3600 - minutes * 60);
		String timeFormat = "";
		if (hours > 0) {
			timeFormat += Integer.toString(hours) + ":";
		}
		if (minutes > 0) {
			timeFormat += Integer.toString(minutes) + ":";
		}
		timeFormat += Integer.toString(seconds);
		if (hours == 0 && minutes == 0) {
			timeFormat += "s";
		}
		return timeFormat;
	}
	public void deleteLectureByLectureID(int lectureID) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		myConn = dataSource.getConnection();
		String sql = "DELETE FROM lecturer_content WHERE lc_id=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, lectureID);
		myStmt.executeUpdate();
		myConn.close();
	}
	public int getChapIDByLectureID(int lectureID) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT chap_id FROM lecturer_content WHERE lc_id=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, lectureID);
		myRS = myStmt.executeQuery();
		int chapID = 0;
		if (myRS.next()) {
			chapID = myRS.getInt("chap_id");
		}
		myConn.close();
		return chapID;
	}
}
