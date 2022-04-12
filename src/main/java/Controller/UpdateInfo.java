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

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.UserUtil;
import Model.User;
import Model.UserAccount;
import Model.Hashtag;


/**
 * Servlet implementation class UpdateInfo
 */
@WebServlet("/UpdateInfo")
public class UpdateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	Dao.CourseUtil courseUtil; 
	AccountUtil accUtil; 
    UserUtil userUtil;
    InstructorUtil insUtil;
    LectureUtil lecUtil;
    
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		courseUtil = new Dao.CourseUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
		lecUtil = new LectureUtil(dataSource);
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		int accountType = (int)request.getSession(false).getAttribute("account_type");
		UserAccount ua = new UserAccount();
		if (accountType == 0) {
			try {
				ua = userUtil.getUserInformationByID(id);
				
				List<Hashtag> user_hashtags = userUtil.getMyHashTags(id);
				request.setAttribute("user_hashtags", user_hashtags);
				System.out.println(user_hashtags.size());
				List<Hashtag> allHashtags = userUtil.getAllHashtags();
				request.setAttribute("all_hashtags", allHashtags);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("exper", "Experiment");
		} else {
			try {
				ua = insUtil.getInstructorInformationByID(id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("exper", "Education");
		}
		request.setAttribute("userInfo",ua);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/update_profile.jsp");;	
		dispatcher.forward(request, response);
	}

}
