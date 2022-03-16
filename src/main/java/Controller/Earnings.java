package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Calendar;
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
import Model.Courses;

/**
 * Servlet implementation class Earnings
 */
@WebServlet("/Earnings")
public class Earnings extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	InstructorUtil insUtil;
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		insUtil = new InstructorUtil(dataSource);
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Earnings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ins_id = (int)request.getSession(false).getAttribute("ins_id");
		List<Courses> ls = null;
		try {
			 ls = insUtil.getMyCourses(ins_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("listCourses", ls);
		int thisMonth = Calendar.getInstance().get(Calendar.MONTH)+1;
		int thisYear = Calendar.getInstance().get(Calendar.YEAR);
		List<Courses> lsMonth = null;
		try {
			lsMonth = insUtil.getMyCoursesByMonth(ins_id,thisMonth,thisYear);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		float totalRevenue = 0;
		float totalRevenueMonth = 0;
		int countCourses = 0;
		int countCoursesMonth = 0;
		for (Courses c : ls) {
			totalRevenue += c.getCountCourses() * c.getPrice();
			countCourses += c.getCountCourses();
		}
		if (lsMonth.size() != 0) {
			for (Courses c: lsMonth) {
				totalRevenueMonth += c.getCountCourses() * c.getPrice();
				countCoursesMonth += c.getCountCourses();
			}
		}
		request.setAttribute("totalRevenue", totalRevenue);
		request.setAttribute("countCourses", countCourses);
		request.setAttribute("totalRevenueMonth", totalRevenueMonth);
		request.setAttribute("countCoursesMonth", countCoursesMonth);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/earning_course.jsp");
		dispatcher.forward(request, response);
	}

}
