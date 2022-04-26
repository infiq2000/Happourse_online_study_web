package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

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
import Model.CourseCart;
import Model.Courses;

/**
 * Servlet implementation class CartController
 */
@WebServlet(urlPatterns = "/CartController/*")
public class CartController extends HttpServlet {
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
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
	public void init(ServletConfig config) throws ServletException {
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		courseUtil = new Dao.CourseUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
		lecUtil = new LectureUtil(dataSource);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getPathInfo();
		System.out.println(action);
		switch (action) {
		case "/remove":
			removecart(request, response);
			break;
		default:
			break;
		}
		response.sendRedirect("/Happourse/cart.jsp");
		
	}
	private void removecart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		HashMap<Integer, CourseCart> cart = (HashMap<Integer, CourseCart>) request.getSession(false).getAttribute("cart");
		cart.remove(id);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getPathInfo();
		System.out.println(action);
		switch (action) {
		case "/add":
			try {
				addtoCart(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
		response.sendRedirect("/Happourse/cart.jsp");
	}

	private void addtoCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("course_id"));
		Courses course = courseUtil.getCourseDetail(id);
		HttpSession session = request.getSession();
		CourseCart courseCart;
		HashMap<Integer, CourseCart> cart  = (HashMap<Integer,CourseCart>)session.getAttribute("cart");
		if (cart == null) {
			cart = new HashMap<Integer, CourseCart>();
			courseCart = new CourseCart(1, course);
			cart.put(id, courseCart);
		}
		else {
			if (!cart.containsKey(id)) {
				courseCart = new CourseCart(1, course);
				cart.put(id, courseCart);
			}
		}
		session.setAttribute("cart", cart);
//		for(Map.Entry<Integer, CourseCart> entry : cart.entrySet()) {
//			System.out.println(entry.getValue().course.getName());
//		}
		return;
	}

}
