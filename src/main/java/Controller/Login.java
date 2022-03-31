package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.mysql.cj.Session;

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.UserUtil;
import Dao.CourseUtil;
import Model.Account;
import Model.Category;
import Model.Courses;
import Model.Instructor;
import Model.User;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
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
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		try {			
			Account tmp = accUtil.validation(userName,passWord);
			if (tmp!=null) {
				if (!tmp.isType()) {
					User user = null;
					user = userUtil.getUser(tmp.getAid());
					List<Courses> courses = userUtil.getAll_Courses();
					
					int pagesNumber = couUtil.courseNumberPage(courses);
					List<Courses> li = couUtil.getCoursesByPage(courses, 1);
					request.setAttribute("listCourses", li);
					request.setAttribute("pagesNumber", pagesNumber);
					
					request.setAttribute("user_info",user);
					String[] a = user.getFull_name().split(" ");
					String b = a[a.length - 1];
					
					request.setAttribute("allActive", "active");
					HttpSession session = request.getSession(true);
					session.setAttribute("name", b);
					session.setAttribute("uid", user.getUid());
					session.setAttribute("id", user.getUid());
					session.setAttribute("aid", user.getAid());
					session.setAttribute("account_type", 0);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
					dispatcher.forward(request, response);
				}
				else {
					Instructor ins = null;
					
					ins = insUtil.getIns(tmp.getAid());
					List<Courses> courses = userUtil.getAll_Courses();
					
					int pagesNumber = couUtil.courseNumberPage(courses);
					List<Courses> li = couUtil.getCoursesByPage(courses, 1);
					request.setAttribute("listCourses", li);
					request.setAttribute("pagesNumber", pagesNumber);
					
					request.setAttribute("user_info",ins);
					String[] a = ins.getIns_name().split(" ");
					String b = a[a.length - 1];
					
					request.setAttribute("allActive", "active");
					HttpSession session = request.getSession(true);
					session.setAttribute("name", b);
					session.setAttribute("ins_id", ins.getIns_id());
					session.setAttribute("id", ins.getIns_id());
					session.setAttribute("aid", ins.getAid());
					session.setAttribute("account_type", 1);

					RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
					dispatcher.forward(request, response);
				}
			}
			else {
				 request.setAttribute("errorString", "Username or password is incorrect");
				 RequestDispatcher dispatcher = request.getRequestDispatcher("/invalidLogin.jsp");
				 dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
