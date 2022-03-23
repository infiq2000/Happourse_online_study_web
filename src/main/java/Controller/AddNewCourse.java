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

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;

/**
 * Servlet implementation class AddNewCourse
 */
@WebServlet("/AddNewCourse")
public class AddNewCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	Dao.CourseUtil courseUtil; 
	AccountUtil accUtil; 
    UserUtil userUtil;
    InstructorUtil insUtil;
    LectureUtil lecUtil;
    /**
     * Default constructor. 
     */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		courseUtil = new Dao.CourseUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
		lecUtil = new LectureUtil(dataSource);
	} 
    public AddNewCourse() {
        // TODO Auto-generated constructor stub
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletResquest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String cmd = request.getParameter("command");
		String course_name = request.getParameter("username");
		String description = request.getParameter("message");
		int cid = Integer.parseInt(request.getParameter("chon"));
		int price = Integer.parseInt(request.getParameter("price"));
		String langguage = "English";
		float star_rate = 4.0f;
		float duration = 0;
		int ins_id = (int)request.getSession(false).getAttribute("ins_id");
		try {
			courseUtil.insertNewCourse(course_name,description,cid,price,langguage,star_rate,duration,ins_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("ManageCourses");
		dispatcher.forward(request, response);
	}

}
