package Controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import Dao.AccountUtil;
import Dao.CourseUtil;
import Dao.InstructorUtil;
import Dao.UserUtil;
import Model.Courses;
import Model.User;

/**
 * Servlet implementation class SearchCoursesByName
 */
@WebServlet("/SearchCoursesByName")
public class SearchCoursesByName extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
    CourseUtil couUtil;
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();;
		couUtil = new CourseUtil(dataSource);
    }
	
    /**
     * Default constructor. 
     */
    public SearchCoursesByName() {
    	super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String txtSearch = request.getParameter("search");
		//txtSearch = txtS.toLowerCase();
		List<Courses> courses=null;
		try {
			courses = couUtil.searchCourseByName(txtSearch);
		} catch (Exception e) {
			System.out.println(e);
		} 
		
		request.setAttribute("listCourses", courses);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
		
		dispatcher.forward(request, response);			
	}

}
