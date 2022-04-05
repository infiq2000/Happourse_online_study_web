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

import Dao.LectureUtil;

/**
 * Servlet implementation class DeleteLecture
 */
@WebServlet("/DeleteLecture")
public class DeleteLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	LectureUtil lecUtil;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteLecture() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
    	super.init();
    	lecUtil = new LectureUtil(dataSource);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int lectureID = Integer.parseInt(request.getParameter("lecture_id"));
		int chapID = 0;
		try {
			chapID = lecUtil.getChapIDByLectureID(lectureID);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			lecUtil.deleteLectureByLectureID(lectureID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("chap_id", chapID);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ManageLectures");
		dispatcher.forward(request, response);
	}

}
