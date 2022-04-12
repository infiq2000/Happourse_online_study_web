package Dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import Model.Chapter;

public class ChapterUtil {
	private DataSource dataSource;

	public ChapterUtil(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public List<Chapter> getChaptersByCourse(int courseID) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		List<Chapter> ls = new ArrayList<>();
		myConn = dataSource.getConnection();
		String sql = "select chap_id, chapter.name, course_id, (select sum(l.duration) from lecturer_content l, chapter c where l.chap_id = c.chap_id and course_id = ?) as duration from chapter where course_id = ?;";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, courseID);
		pstmt.setInt(2, courseID);
		myRS = pstmt.executeQuery();
		int count = 0;
		while (myRS.next()) {
			count += 1;
			int chapID = myRS.getInt("chap_id");
			String name;
			if (count >= 10) {
				name = Integer.toString(count) + ". " + myRS.getString("name");
			} else {
				name = "0" + Integer.toString(count) + ". " + myRS.getString("name");
			}
			String time = "";
			sql = "select sum(duration) as duration from lecturer_content where chap_id = ?";
			pstmt = myConn.prepareStatement(sql);
			pstmt.setInt(1, chapID);
			ResultSet myRS3 = pstmt.executeQuery();
			Double duration = 0.0;
			if (myRS3.next()) {
				duration = myRS3.getDouble("duration");
			}
			time = convertDoubleToTime(duration);
			sql = "select mood_1, mood_2, mood_3 from user_content u, lecturer_content l where u.lc_id = l.lc_id and chap_id = ?";
			pstmt = myConn.prepareStatement(sql);
			pstmt.setInt(1, chapID);
			ResultSet myRS2 = pstmt.executeQuery();
			float mood1 = 0, mood2 = 0, mood3 = 0;
			String mood = "HIGH", color = "green";
			int count_mood = 0;
			while (myRS2.next()) {
				count_mood += 1;
				mood1 += myRS2.getFloat("mood_1");
				mood2 += myRS2.getFloat("mood_2");
				mood3 += myRS2.getFloat("mood_3");
			}
			if (count_mood != 0) {
				mood1 /= count_mood;
				mood2 /= count_mood;
				mood3 /= count_mood;
				if (mood1 < 0.5 || mood2 < 0.5 || mood3 < 0.5) {
					mood = "LOW";
					color = "red";
				}
			}
			ls.add(new Chapter(chapID, name, courseID, time, mood, color));
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

	public int getCourseIDByChapID(int chap_id) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		myConn = dataSource.getConnection();
		String sql = "SELECT course_id FROM chapter WHERE chap_id=?;";
		pstmt = myConn.prepareStatement(sql);
		myRS = pstmt.executeQuery();
		int course_id = 0;
		if (myRS.next()) {
			course_id = myRS.getInt("course_id");
			System.out.println("Get courseID: " + course_id);
		}
		myConn.close();
		return course_id;
	}

	public void deleteChapterByChapID(int chapID) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		LectureUtil lecUtil = new LectureUtil(dataSource);
		myConn = dataSource.getConnection();
		String sql = "select lc_id from lecturer_content where chap_id = ?";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, chapID);
		myRS = pstmt.executeQuery();
		int lectureID = 0;
		while (myRS.next()) {
			lectureID = myRS.getInt("lc_id");
			lecUtil.deleteLectureByLectureID(lectureID);
		}
		sql = "delete from chapter where chap_id = ?";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, chapID);
		pstmt.executeUpdate();
		myConn.close();
	}
	
}
