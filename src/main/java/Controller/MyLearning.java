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
import Model.Courses;

import Model.User;

/**
 * Servlet implementation class MyLearning
 */
@WebServlet("/MyLearning")
public class MyLearning extends HttpServlet {
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
    public MyLearning() {
        super();
        // TODO Auto-generated constructor stub
    }
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		courseUtil = new Dao.CourseUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
		lecUtil = new LectureUtil(dataSource);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int  user_aid = Integer.parseInt(request.getParameter("aid_user"));
		int  uid = Integer.parseInt(request.getParameter("uid"));
		try {
			User user = userUtil.getUser(user_aid);
			String[] a = user.getFull_name().split(" ");
			String b = a[a.length - 1];
			request.setAttribute("name", b);
			request.setAttribute("user", uid);
			request.setAttribute("aid", user_aid);
			request.setAttribute("user_info", user);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			List<Courses> ls = courseUtil.listCourse_Id(uid);
			request.setAttribute("listCourses", ls);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/My_learning.jsp");
		dispatcher.forward(request, response);
	
	}

}
