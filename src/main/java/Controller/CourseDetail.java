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
import Model.Review;
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
		if (Integer.toString(course_id) == null) course_id = Integer.parseInt(request.getAttribute("course_id").toString());
		int uid = (int)request.getSession(false).getAttribute("uid");
		int aid = (int)request.getSession(false).getAttribute("aid");
		try {
			/* Account ac = accUtil.getAccount(aid); */
			Account acc =  accUtil.getAccount(aid);
			request.setAttribute("account", acc);
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
			
			int num_students = courseUtil.getStudentOfCourse(course_id);
			request.setAttribute("num_students", num_students);
			
			List<Chapter> list_chapter = lecUtil.getChapterOfCourse(detailC.getCourses_id());
			request.setAttribute("chapter", list_chapter);
			
			String hashtagOfCourse = courseUtil.getHashtagOfCourse(course_id);
			request.setAttribute("hashtagOfCourse", hashtagOfCourse);
			
			List<Review> reviewList = null;
			reviewList = userUtil.getAllReview(course_id);
			request.setAttribute("reviewList", reviewList);
			
			int checkReviewed = 0;
			checkReviewed = userUtil.checkReviewed(uid, course_id);
			request.setAttribute("checkReviewed", checkReviewed);
			
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
