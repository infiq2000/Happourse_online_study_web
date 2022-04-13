package Controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;
import Model.Chapter;

/**
 * Servlet implementation class AddChapter
 */
@WebServlet(name = "AddChapter", urlPatterns = {"/AddChapter"})
public class AddChapter extends HttpServlet {
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
    public AddChapter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int course_id = Integer.parseInt(request.getParameter("course_id"));
		String name = request.getParameter("txtName");
		int chapter_id = -1;
		try {
			chapter_id = courseUtil.getIndexOfChapter();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			courseUtil.addChapter(chapter_id, course_id, name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("chapter_id gen: "+chapter_id);
		HttpSession session = request.getSession(true);
		List<Chapter> list_chapter = new ArrayList<Chapter>();
		try {
			list_chapter = lecUtil.getChapterOfCourse(course_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("list_chapter", list_chapter);
		session.setAttribute("chapter_id",chapter_id);
		int i = 0;
		for (Chapter ct : list_chapter) {
			if (ct.getChap_id() == chapter_id) {
				break;
			}
			i += 1;
		}
		PrintWriter out = response.getWriter();
		//out.print("<li id=\"chapter-s1\">Chapter "+i+" : "+list_chapter.get(i).getName()+"</li>");
		out.print("											<ul class=\"accordion-box style-two\"  style=\"margin-left: 40px;\">\r\n"
				+ "												<a href = \""+ "UpdateChapter" +"\"> "+"Chapter "+i+": "+name+" </a>\r\n"
				+ "											</ul>");
		
		
	}

}
