package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Dao.AccountUtil;
import Dao.CourseUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;

/**
 * Servlet implementation class AddContent
 */
@WebServlet("/AddContent")
public class AddContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	Dao.CourseUtil courseUtil; 
	AccountUtil accUtil; 
    UserUtil userUtil;
    InstructorUtil insUtil;
    LectureUtil lecUtil;
    
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
     * @see HttpServlet#HttpServlet()
     */
    public AddContent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
//    nameContent : nameContent,
//	course_id: course_id,
//	chapter_id: chapter_id,
//	desription : desription,
//	url:url
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int course_id = Integer.parseInt(request.getParameter("course_id"));
		String nameContent = request.getParameter("nameContent");
		String desription = request.getParameter("desription");
		int chapter_id = Integer.parseInt(request.getParameter("chapter_id"));
		String url = request.getParameter("url");
		int content = -1;
		try {
			content = courseUtil.getIndexOfContent();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			courseUtil.addContent(content,nameContent, desription,chapter_id,url);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print("<p>Done </p>");
	}

}
