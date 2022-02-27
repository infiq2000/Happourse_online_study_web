package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import Model.Category;
import Model.Courses;
import Model.User;

/**
 * Servlet implementation class HomePage
 */
@WebServlet("/HomePage")
public class HomePage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	AccountUtil accUtil; 
    UserUtil userUtil;
    InstructorUtil insUtil;
    courseUtil couUtil;
	
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
		couUtil = new courseUtil(dataSource);
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomePage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		int aid = Integer.parseInt(request.getParameter("aid"));
		try {
			List<Courses> courses = couUtil.getCourseByCategory(cid);
			request.setAttribute("listCourses", courses);
			
			User user = userUtil.getUser(aid);
			request.setAttribute("user_info",user);
			String[] a = user.getFull_name().split(" ");
			String b = a[a.length - 1];
			request.setAttribute("name", b);
			
			List<Category> categories = couUtil.getCategories();
			request.setAttribute("cate", categories);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
