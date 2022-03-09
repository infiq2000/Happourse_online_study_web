package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.mysql.cj.protocol.Message;

import Dao.AccountUtil;
import Dao.CourseUtil;
import Dao.InstructorUtil;
import Dao.UserUtil;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="jdbc/Happourse")
	private DataSource dataSource;
	AccountUtil accUtil; 
    UserUtil userUtil;
    InstructorUtil insUtil;
    CourseUtil couUtil;
	
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
		couUtil = new CourseUtil(dataSource);
    }
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("txtUsername");
		String email = request.getParameter("txtEmail");
		String password = request.getParameter("txtPassword");
		String repassword = request.getParameter("txtRepeatPassword");
		String[] isInstructor = request.getParameterValues("checkboxInstructor");
		int type = -1;
		if (checkPass(password, repassword)) {
			try {
				if (accUtil.checkOverlap(username) == false) {
					int aid = accUtil.getIndex();
					type = 0;
					if (isInstructor == null) {						
						type =0;
						accUtil.addAccount(aid, username, email, password, type);
						userUtil.addUser(aid);
					}else {
						type = 1;
						accUtil.addAccount(aid, username, email, password, type);
						insUtil.addIns(aid);
					}
					userUtil.addUser(aid);
					response.sendRedirect("index.jsp");
				} else {
					/* SomeService service = new SomeService(); */
				
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private Boolean checkPass(String password, String repassword) {
		return password.equals(repassword);		
	}
	
	

}
