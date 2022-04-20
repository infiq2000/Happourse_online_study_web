package Controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import Dao.UserUtil;

/**
 * Servlet implementation class ReviewCourse
 */
@WebServlet("/ReviewCourse")
public class ReviewCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	UserUtil userUtil;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCourse() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
		super.init();
		userUtil = new UserUtil(dataSource);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = (int)request.getSession(false).getAttribute("uid");
		int course_id = Integer.parseInt(request.getParameter("course_id"));
		float rating = Float.parseFloat(request.getParameter("review-rate"));
		String review_content = request.getParameter("review-content").toString();
		try {
			userUtil.addReviewOfUser(uid, course_id, rating, review_content);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("course_id", course_id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("CourseDetail");
		dispatcher.forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
