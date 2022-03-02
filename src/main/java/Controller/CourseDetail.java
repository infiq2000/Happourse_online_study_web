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
import Model.Account;
import Model.Chapter;
import Model.Courses;
import Model.Instructor;
import Model.User;

/**
 * Servlet implementation class CourseDetail
 */
@WebServlet("/CourseDetail")
public class CourseDetail extends HttpServlet {
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
    public CourseDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int course_id = Integer.parseInt(request.getParameter("course_id"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		int aid = Integer.parseInt(request.getParameter("aid"));
		try {
			/* Account ac = accUtil.getAccount(aid); */
			User user = userUtil.getUser(aid);
			Account acc =  accUtil.getAccount(aid);
			request.setAttribute("account", acc);
			String[] a = user.getFull_name().split(" ");
			String b = a[a.length - 1];
			request.setAttribute("name", b);
			request.setAttribute("user",user);
			request.setAttribute("aid", aid);
			request.setAttribute("uid", uid);
			request.setAttribute("user_info",user);
			request.setAttribute("course_id", course_id);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
		
			Courses detailC = courseUtil.getCourseDetail(course_id);
			request.setAttribute("course_detail",detailC);	
			
			String cate = insUtil.getCate(detailC.getCid());
			request.setAttribute("cate", cate);
			
			Instructor ins_info = insUtil.getIns_Info(detailC.getIns_id());
			request.setAttribute("ins_info", ins_info);
			
			List<Chapter> list_chapter = lecUtil.getChapterOfCourse(detailC.getCourses_id());
			request.setAttribute("chapter", list_chapter);
			
			
			RequestDispatcher dispatcher;
			if (courseUtil.checkSignedCourse(course_id, uid) == null) {
				dispatcher = request.getRequestDispatcher("/Course_detail.jsp");
			} else {				
				dispatcher = request.getRequestDispatcher("/CourseSigned.jsp");
			}		
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}