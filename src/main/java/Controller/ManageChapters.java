package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
import Model.Chapter;

/**
 * Servlet implementation class ManageChapters
 */
@WebServlet("/ManageChapters")
public class ManageChapters extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	ChapterUtil chapterUtil;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageChapters() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
    	super.init();
    	chapterUtil = new ChapterUtil(dataSource);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseID = request.getParameter("course_id");
		int course_id = Integer.parseInt(courseID);
		List<Chapter> ls = null;
		try {
			ls = chapterUtil.getAllChapter(course_id);		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("chapter", ls);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/manage_chapter.jsp");
		dispatcher.forward(request, response);
	}

}
