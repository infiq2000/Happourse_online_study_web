package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
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
 * Servlet implementation class SearchByPrice
 */
@WebServlet("/SearchByPrice")
public class SearchByPrice extends HttpServlet {
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
    public SearchByPrice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("vao day khong");
		int minPrice = Integer.parseInt(request.getParameter("minPrice").substring(1));
		int maxPrice = Integer.parseInt(request.getParameter("maxPrice").substring(1));
		List<Courses> li = new ArrayList<Courses>();
		try {
			li = courseUtil.getCourseByPrice(minPrice, maxPrice);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		for(Courses c : li) {
			out.print("									<div class=\"col-lg-4 col-sm-6 col-xs-6\">\r\n"
					+ "										<div class=\"single-course\" style=\"border: 0px;\">\r\n"
					+ "											<div class=\"image-box\"><img style=\"width: 270px;height: 120px;\" src=\""+c.getImg_path()+"\" alt=\"\"></div>\r\n"
					+ "											<div class=\"text\">\r\n"
					+ "												<div class=\"image\"><img src=\""+c.getImg_path_instructor()+"\" alt=\"\"></div>\r\n"
					+ "												<div class=\"name clearfix\">\r\n"
					+ "													<h6 class=\"float-left\">"+c.getIns_name()+"</h6>\r\n"
					+ "													<span class=\"p-bg-color float-right\">"+c.getPrice2()+" $ <sup>.99</sup></span>\r\n"
					+ "												</div>\r\n"
					+ "												<c:url var=\"tempLink\" value=\"CourseDetail\">\r\n"
					+ "													<c:param name=\"course_id\" value=\""+c.getCourses_id()+"\"></c:param>\r\n"
					+ "	  											</c:url>\r\n"
					+ "												<h5><a href=\"${tempLink}\" class=\"tran3s\" style=\"height:90px;\">"+c.getName()+"</a></h5>\r\n"
					+ "												<ul class=\"clearfix\">\r\n"
					+ "													<li class=\"float-left\">\r\n"
					+ "														<i class=\"flaticon-people\"></i>\r\n"
					+ "														<a href=\"#\" class=\"tran3s\">"+c.getCountCourses()+"</a>\r\n"
					+ "													</li>\r\n"
					+ "													<li class=\"float-left\">\r\n"
					+ "														<i class=\"flaticon-comments\"></i>\r\n"
					+ "														<a href=\"#\" class=\"tran3s\">"+c.getTotal_comment()+"</a>\r\n"
					+ "													</li>\r\n"
					+ "													<li class=\"float-right\">\r\n"
					+ "														<i class=\"flaticon-heart\"></i>\r\n"
					+ "														<a href=\"#\" class=\"tran3s\">"+c.getStar_rate()+"</a>\r\n"
					+ "													</li>\r\n"
					+ "												</ul>\r\n"
					+ "											</div>\r\n"
					+ "										</div> <!-- /.single-course -->\r\n"
					+ "\r\n"
					+ "									</div> <!-- /.col- -->");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
