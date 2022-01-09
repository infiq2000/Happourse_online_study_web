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
import Model.Account;
import Model.Courses;
import Model.User;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	AccountUtil accUtil; 
    UserUtil userUtil;
    InstructorUtil insUtil;
	
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
    }

	/**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("username");
		String passWord = request.getParameter("password");
		try {
			User user = null;
			Account tmp = accUtil.validation(userName,passWord);
			if (tmp!=null) {
				if (!tmp.isType()) {
					user = userUtil.getUser(tmp.getAid());
					List<Courses> courses = userUtil.getAll_Courses();
					request.setAttribute("listCourses", courses);
					/*
					 * Hashtable<Integer,String> namebyID = userUtil.getNameById(); for(Courses c :
					 * courses) { c.setIns_name(namebyID.get(c.getIns_id())); }
					 */
					request.setAttribute("user_info",user);
					String[] a = user.getFull_name().split(" ");
					String b = a[a.length - 1];
					request.setAttribute("name", b);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/UserPage.jsp");
					dispatcher.forward(request, response);
				}
			}
			else {
				 request.setAttribute("errorString", "Tên đăng nhập hoặc mật khẩu bị sai");
				 RequestDispatcher dispatcher = request.getRequestDispatcher("/invalidLogin.jsp");
				 dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
