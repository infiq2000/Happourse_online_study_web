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

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;
import Model.Courses;

/**
 * Servlet implementation class Filter
 */
@WebServlet("/CourseByType")
public class CourseByType extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	Dao.CourseUtil courseUtil; 
    UserUtil userUtil;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseByType() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	public void init(ServletConfig config) throws ServletException {
		super.init();
		userUtil = new UserUtil(dataSource);
		courseUtil = new Dao.CourseUtil(dataSource);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		List<Courses> li = courseUtil.getCourseByType(type);
		int pagesNumber = courseUtil.courseNumberPage(li);
		List<Courses> course = courseUtil.getCoursesByPage(li, 1);
		request.setAttribute("listCourses", course);
		request.setAttribute("pagesNumber", pagesNumber);
		request.setAttribute("type", type);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
		dispatcher.forward(request, response);	
	}

}
