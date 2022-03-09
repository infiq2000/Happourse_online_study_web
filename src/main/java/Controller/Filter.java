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
@WebServlet("/Filter")
public class Filter extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	Dao.CourseUtil courseUtil; 
    UserUtil userUtil;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Filter() {
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
		List<Courses> li = new ArrayList<>();
		switch (type) {
			case "all": {
				try {
					li = userUtil.getAll_Courses();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			case "new": {
				try {
					li = courseUtil.getNewCourses();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			case "popular": {
				try {
					li = courseUtil.getPopularCourses();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			case "free": {
				try {
					li = courseUtil.getFreeCourses();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				break;
			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + type);
		}
		request.setAttribute("listCourses", li);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
		dispatcher.forward(request, response);	
	}

}
