package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.UserUtil;
import Dao.CourseUtil;
import Model.Category;
import Model.Courses;
import Model.User;

/**
 * Servlet implementation class HomePage
 */
@WebServlet("/CourseByCategory")
public class CourseByCategory extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	AccountUtil accUtil; 
    UserUtil userUtil;
    InstructorUtil insUtil;
    CourseUtil couUtil;
	
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
		couUtil = new CourseUtil(dataSource);
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseByCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		try {
			List<Courses> courses = couUtil.getCourseByCategory(cid);
			int pagesNumber = couUtil.courseNumberPage(courses);
			List<Courses> course = couUtil.getCoursesByPage(courses, 1);
			request.setAttribute("pagesNumber", pagesNumber);
			request.setAttribute("listCourses", course);
			request.setAttribute("cid", cid);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
