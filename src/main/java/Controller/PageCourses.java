package Controller;

import java.io.IOException;
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
import javax.sql.DataSource;

import Dao.UserUtil;
import Model.Courses;

/**
 * Servlet implementation class PageCourses
 */
@WebServlet("/PageCourses")
public class PageCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	Dao.CourseUtil courseUtil; 
    UserUtil userUtil;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageCourses() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
		super.init();
		userUtil = new UserUtil(dataSource);
		courseUtil = new Dao.CourseUtil(dataSource);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = Integer.parseInt(request.getParameter("page"));
		String txtSearch = request.getParameter("txtSearch");
		List<Courses> li = new ArrayList<>();
		if (txtSearch.equalsIgnoreCase("null")) {
			try {
				li = userUtil.getAll_Courses();
				int maxPages = courseUtil.courseNumberPage(li, 3);
				List<Courses> course = courseUtil.getCoursesByPage(li, page);
				request.setAttribute("listCourses", course);
				request.setAttribute("pagesNumber", maxPages);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
				dispatcher.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(txtSearch);
		
//		try {
//			li = courseUtil.searchCourseByName(txtSearch);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
	}

}
