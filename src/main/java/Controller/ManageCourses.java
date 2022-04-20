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

import Dao.CourseUtil;
import Dao.UserUtil;
import Model.Courses;
import Model.ManagedCourses;

/**
 * Servlet implementation class ManageCourses
 */
@WebServlet("/ManageCourses")
public class ManageCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	CourseUtil courseUtil; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManageCourses() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
    	super.init();
    	courseUtil = new Dao.CourseUtil(dataSource);
    }    


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ins_id = (int)request.getSession(false).getAttribute("ins_id");
		List<ManagedCourses> ls = new ArrayList<>();
		try {
			ls = courseUtil.getManagedCourses(ins_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("desc", "false");
		request.setAttribute("listCourses", ls);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/manage_course.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
