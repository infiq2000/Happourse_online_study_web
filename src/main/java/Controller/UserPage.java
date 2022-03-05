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

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.UserUtil;
import Model.Courses;
import Model.User;

/**
 * Servlet implementation class UserPage
 */
@WebServlet("/UserPage")
public class UserPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	AccountUtil accUtil; 
    UserUtil userUtil;
    InstructorUtil insUtil;
	   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPage() {
        super();
        // TODO Auto-generated constructor stub
    }
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = (int)request.getSession(false).getAttribute("uid");
		User user = null;
		try {
			user = userUtil.getUserbyID(uid);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Courses> courses;
		try {
			courses = userUtil.getAll_Courses();
			request.setAttribute("listCourses", courses);
			request.setAttribute("user_info",user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
