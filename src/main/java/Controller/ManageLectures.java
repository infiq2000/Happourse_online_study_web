package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import Dao.ChapterUtil;
import Dao.LectureUtil;
import Model.Lecture;
import Model.ManagedLecture;

/**
 * Servlet implementation class ManageLectures
 */
@WebServlet("/ManageLectures")
public class ManageLectures extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	LectureUtil lecUtil;
	ChapterUtil chapUtil;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageLectures() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
    	super.init();
    	lecUtil = new LectureUtil(dataSource);
    	chapUtil = new ChapterUtil(dataSource);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String chapterID = (String) request.getParameter("chap_id");
		if (chapterID == null) {
			chapterID = request.getAttribute("chap_id").toString();
		}
		int chap_id = Integer.parseInt(chapterID);
		List<ManagedLecture> ls = null;
		try {
			ls = lecUtil.getLecturesByChapter(chap_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int courseID = 0;
		try {
			courseID = chapUtil.getCourseIDByChapID(chap_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("course_id", courseID);
		request.setAttribute("lecture", ls);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/manage_content.jsp");
		dispatcher.forward(request, response);
	}

}
