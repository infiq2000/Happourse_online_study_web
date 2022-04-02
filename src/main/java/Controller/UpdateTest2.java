package Controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.Date;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;

/**
 * Servlet implementation class UpdateTest2
 */
@WebServlet("/UpdateTest2")
public class UpdateTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name = "jdbc/Happourse")
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

	public UpdateTest2() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int aid = (int) request.getSession(false).getAttribute("aid");
		String username = (String) request.getParameter("username");
		String fullName = (String) request.getParameter("fullName");
		String major = (String) request.getParameter("major");
		Date birth = Date.valueOf((String) request.getParameter("birth"));
		String phoneNumber = (String) request.getParameter("phoneNumber");
		String email = (String) request.getParameter("email");
		String address = (String) request.getParameter("address");
		String describe = (String) request.getParameter("about");
		String experiment = (String) request.getParameter("experiment");
		String countryName = (String) request.getParameter("country");

//		Part part = request.getPart("image");
//		String realPath = request.getServletContext().getRealPath("/images/avatar");
//		String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
//
//		if (!Files.exists(Path.of(realPath))) {
//			Files.createDirectory(Path.of(realPath));
//		}
//		part.write(realPath + "/" + filename);
//
//		HttpSession session = request.getSession(true);
//		session.setAttribute("imagename", "/images/avatar" + "/" + filename);

		int accountType = (int) request.getSession().getAttribute("account_type");

		if (accountType == 0) {
			try {
				userUtil.updateUser(aid, username, fullName, major, birth, phoneNumber, email, address, describe,
						experiment, countryName);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				insUtil.updateInstructor(aid, username, fullName, major, birth, email, address, describe, experiment,
						countryName);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String[] a = fullName.split(" ");
		String b = a[a.length - 1];
		HttpSession session = request.getSession(true);
		session.setAttribute("name", b);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/Profile");
		dispatcher.forward(request, response);
	}

}
