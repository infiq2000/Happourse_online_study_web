package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import Dao.PaymentServices;
/**
 * Servlet implementation class review_payment
 */
@WebServlet("/review_payment")
public class review_payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public review_payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("here");
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");
		System.out.println(payerId + ": " +paymentId);
		try {
			PaymentServices paymentServices = new PaymentServices();
			Payment payment = paymentServices.getPaymentDetails(paymentId);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
			
			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", transaction);
			request.setAttribute("shippingAddress", shippingAddress);
			request.setAttribute("paymentId",  paymentId);
			request.setAttribute("PayerID",  payerId);
//			String url = "checkout.jsp?paymentId=" + paymentId + "&PayerID=" + payerId;
			
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
			
		} catch (PayPalRESTException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}		
	}

}
