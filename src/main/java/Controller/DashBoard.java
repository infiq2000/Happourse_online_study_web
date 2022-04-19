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

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;
import Model.ChartInfo;
import Model.Courses;
import Model.Instructor;

/**
 * Servlet implementation class DashBoard
 */
@WebServlet("/DashBoard")
public class DashBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	Dao.CourseUtil courseUtil; 
	AccountUtil accUtil; 
    UserUtil userUtil;
    InstructorUtil insUtil;
    LectureUtil lecUtil;
       
    /**
     * @see HttpServlet#HttpServlet()
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
    
    public DashBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ins_id = (int)request.getSession(false).getAttribute("ins_id");
		List<Courses> ls = null;
		float balance = 2;
		float total_sales = 0;
		int total_students = 0;
		int total_courses = 0;
		List<ChartInfo> list_totalCourse_of_ins = null;
		try {
			ls = insUtil.getMyCourses1(ins_id);
			total_courses = ls.size();
			total_students = insUtil.getMyStudent(ins_id);
			list_totalCourse_of_ins = insUtil.getTotalCoursebyMonth(ins_id);
		// TODO Auto-generated catch block
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			balance = insUtil.getBalance(ins_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try { 
		  total_sales = insUtil.getTotalSales(ins_id);
		} 
		catch (SQLException e) {
		}
		  // TODO Auto-generated catch block e.printStackTrace(); }
		request.setAttribute("revenue", list_totalCourse_of_ins);
		request.setAttribute("listCourses", ls);
		request.setAttribute("balance", balance);
		request.setAttribute("total_sales", total_sales);
		request.setAttribute("total_students", total_students);
		request.setAttribute("total_courses", total_courses);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
