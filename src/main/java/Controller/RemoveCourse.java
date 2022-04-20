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
 * Servlet implementation class RemoveCourse
 */
@WebServlet("/RemoveCourse")
public class RemoveCourse extends HttpServlet {
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
    public RemoveCourse() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
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

		int course_id = Integer.parseInt(request.getParameter("course_id"));
		int uid = (int)request.getSession(false).getAttribute("uid");
		
		request.setAttribute("course_id", course_id);
	
		try {
			
			Courses detailC = courseUtil.getCourseDetail(course_id);
			request.setAttribute("course_detail",detailC);	
			
			String cate = insUtil.getCate(detailC.getCid());
			request.setAttribute("cate", cate);
			
			Instructor ins_info = insUtil.getIns_Info(detailC.getIns_id());
			request.setAttribute("ins_info", ins_info);
			
			List<Chapter> list_chapter = lecUtil.getChapterOfCourse(detailC.getCourses_id());
			request.setAttribute("chapter", list_chapter);

			courseUtil.removeCourse(uid,course_id);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("CourseDetail");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
