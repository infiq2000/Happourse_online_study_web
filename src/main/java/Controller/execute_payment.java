package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import Dao.AccountUtil;
import Dao.InstructorUtil;
import Dao.LectureUtil;
import Dao.PaymentServices;
import Dao.UserUtil;

import Model.CourseCart;
import Model.Courses;

/**
 * Servlet implementation class execute_payment
 */
@WebServlet("/execute_payment")
public class execute_payment extends HttpServlet {
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
	public execute_payment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init(ServletConfig config) throws ServletException {
		super.init();
		accUtil = new AccountUtil(dataSource);
		userUtil = new UserUtil(dataSource);
		courseUtil = new Dao.CourseUtil(dataSource);
		insUtil = new InstructorUtil(dataSource);
		lecUtil = new LectureUtil(dataSource);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");
		System.out.println(payerId + ": " + paymentId);
		int uid = (int)request.getSession(false).getAttribute("uid");
		try {
			PaymentServices paymentServices = new PaymentServices();
			Payment payment = paymentServices.executePayment(paymentId, payerId);

			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);

			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", transaction);
			HashMap<Integer, CourseCart> cart = (HashMap<Integer, CourseCart>) request.getSession(false).getAttribute("cart");
			boolean flag = cart != null ? true : false;
			if (flag) {
				for (Map.Entry<Integer, CourseCart> entry : cart.entrySet()) {
					Integer key = entry.getKey();
					CourseCart courseCart = entry.getValue();
					if(courseCart.course.getCourses_id()==10101) {
						userUtil.buyHPCoin(uid);
					}
					courseUtil.insert(courseCart.course.getCourses_id(), uid);
				}
			}

			request.getRequestDispatcher("Done.jsp").forward(request, response);

		} catch (PayPalRESTException | SQLException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
