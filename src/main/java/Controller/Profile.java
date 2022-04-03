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
import Model.Profiles;
import Model.User;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
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
    public Profile() {
        super();
        // TODO Auto-generated constructor stub
        
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
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
		int accountType = (int)request.getSession(false).getAttribute("account_type");
		Profiles user = null;
		int countCourses = 0;
		if (accountType == 0) {
			int uid = (int)request.getSession(false).getAttribute("uid");	
			System.out.println("uid: " + uid);
			try {
				user = userUtil.getUserProfileByID(uid);
				countCourses = courseUtil.countCourseByUID(uid);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else {
			int ins_id = (int)request.getSession(false).getAttribute("ins_id");
			try {
				user = insUtil.getInstructorProfileByID(ins_id);
				countCourses = insUtil.getToTalCourses(ins_id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
		System.out.println("check ten: " + user.getImg_path());
		request.setAttribute("myCourses", countCourses);
		request.setAttribute("user_info",user);
		String[] a = user.getName().split(" ");
		
		String b = a[a.length - 1];
		request.setAttribute("name", b);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/userprofile.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doGet(request,response);
	}

}
