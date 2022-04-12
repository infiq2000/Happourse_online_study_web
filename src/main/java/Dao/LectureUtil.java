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
import Model.ManagedLecture;
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
	public Content getContentsbyContendId(int content_id) throws SQLException{
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "select * from  happourse.lecturer_content where lc_id = ? ";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, content_id);
		myRS = myStmt.executeQuery();
		
		Content contents = null;
		int count = 0;
		if (myRS.next()) {
			count++;
			int lc_id = myRS.getInt("lc_id");
			String name = myRS.getString("name");
			String type = myRS.getString("type");
			String link = myRS.getString("link");
			contents = new Content(lc_id,name,type, link, content_id);
		}
		myConn.close();
		return contents;
	}
	public List<ManagedLecture> getLecturesByChapter(int chap_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT lc_id, l.name, type, link, l.duration, l.chap_id, course_id FROM lecturer_content l, chapter c WHERE l.chap_id=c.chap_id AND l.chap_id=?;";
		myStmt = myConn.prepareStatement(sql);
		myStmt.setInt(1, chap_id);
		myRS = myStmt.executeQuery();
		List<ManagedLecture> ls = new ArrayList<>();
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
			String duration = "";
			try {
				duration = format.format(myRS.getTime("duration", Calendar.getInstance()));
			} catch (Exception e) {
				duration = "00:00:00";
			}
			int chapterID = myRS.getInt("chap_id");
			int courseID = myRS.getInt("course_id");
			Time durationTime = myRS.getTime("duration", Calendar.getInstance());
			double time = durationTime.getHours() * 3600 + durationTime.getMinutes() * 60 + durationTime.getSeconds();
			double distance = time/3;
			String duration1 = convertDoubleToTime(distance);
			if (distance >= 3600/3) duration1 = "00:00:00 - " + duration1;
			else if (distance >= 60/3) duration1 = "00:00 - " + duration1;
			else duration1 = "0s - " + duration;
			String duration2 = convertDoubleToTime(distance) + " - " + convertDoubleToTime(distance*2);
			String duration3 = convertDoubleToTime(distance*2) + " - " + convertDoubleToTime(distance*3);
			String color1 = "green", color2 = "green", color3 = "green";
			float mood1 = 0, mood2 = 0, mood3 = 0;
			int count_mood = 0;
			sql = "select lc_id, mood_1, mood_2, mood_3 from user_content where lc_id = ?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setInt(1, lectureID);
			ResultSet myRS2 = myStmt.executeQuery();
			while (myRS2.next()) {
				mood1 += myRS2.getFloat("mood_1");
				mood2 += myRS2.getFloat("mood_2");
				mood3 += myRS2.getFloat("mood_3");
				count_mood += 1;
			} 
			if (count_mood == 0) {
				mood1 = 1;
				mood2 = 1;
				mood3 = 1;
			} else {
				mood1 /= count_mood;
				mood2 /= count_mood;
				mood3 /= count_mood;
			}			
			if (mood1 < 0.5) color1 = "red";
			if (mood2 < 0.5) color2 = "red";
			if (mood3 < 0.5) color3 = "red";
			ls.add(new ManagedLecture(lectureID, name, type, link, duration, chapterID, courseID, duration1, duration2, duration3, mood1, mood2, mood3, color1, color2, color3));
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
