package Controller;

import java.io.IOException;
import java.sql.SQLException;

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

/**
 * Servlet implementation class DeleteChapter
 */
@WebServlet("/DeleteChapter")
public class DeleteChapter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	ChapterUtil chapUtil;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init(ServletConfig config) throws ServletException {
    	super.init();
    	chapUtil = new ChapterUtil(dataSource);
    }
	
    public DeleteChapter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int chapID = Integer.parseInt(request.getParameter("chap_id"));
		int courseID = 0;
		try {
			courseID = chapUtil.getCourseIDByChapID(chapID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			chapUtil.deleteChapterByChapID(chapID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Delete: " + courseID);
		request.setAttribute("course_id", courseID);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ManageChapters");
		dispatcher.forward(request, response);
	}

}
