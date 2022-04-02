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
	
	public List<Chapter> getAllChapter(int courseID) throws SQLException {
		Connection myConn = null;
		PreparedStatement pstmt = null;
		ResultSet myRS = null;
		List<Chapter> ls = new ArrayList<>();
		myConn = dataSource.getConnection();
		String sql = "SELECT c.chap_id, c.name, course_id, sum(l.duration) as duration, c.mood FROM chapter c, lecturer_content l WHERE c.chap_id=l.chap_id AND course_id = ?;";
		pstmt = myConn.prepareStatement(sql);
		pstmt.setInt(1, courseID);
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
			String time = convertDoubleToTime(myRS.getDouble("duration"));
			int moodCheck = myRS.getInt("mood");
			String mood, color;
			if (moodCheck == 1) {
				mood = "HIGH";
				color = "green";
			} else {
				mood = "LOW";
				color = "green";
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
	
}
