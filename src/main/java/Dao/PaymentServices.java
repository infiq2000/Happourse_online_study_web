package Dao;

import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

import Model.Orders;
//import Model.OrderDetail;

public class PaymentServices {
	private static final String CLIENT_ID = "AbkuZBJnMddc-R-Ur3zr3nd9WVVHKr3Njc9LHNi9fa3SgdA1RlORW_S3uWu-uf3plIrfJIlg1U2MMDP1";
	private static final String CLIENT_SECRET = "EIy3caGYYb3mkMtPt_0yQl643dACAoj5G3fUQa-wKieaC6008_3D_bIEYznztORwG5m4JL6hahTZ1scQ";
	private static final String MODE = "sandbox";
	
	public String authorizePayment(Orders orderDetail) throws PayPalRESTException {
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
	}
	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;
		
		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
				break;
			}
		}		
		
		return approvalLink;
	}
	private Payer getPayerInformation() {
	    Payer payer = new Payer();
	    payer.setPaymentMethod("paypal");
	     
	    PayerInfo payerInfo = new PayerInfo();
	    payerInfo.setFirstName("William")
	             .setLastName("Peterson")
	             .setEmail("william.peterson@company.com");
	     
	    payer.setPayerInfo(payerInfo);
	     
	    return payer;
	}
	private RedirectUrls getRedirectURLs() {
	    RedirectUrls redirectUrls = new RedirectUrls();
	    redirectUrls.setCancelUrl("http://localhost:8080/Happourse/cancel.html");
	    redirectUrls.setReturnUrl("http://localhost:8080/Happourse/review_payment");
	     
	    return redirectUrls;
	}
	
	private List<Transaction> getTransactionInformation(Orders orderDetail) {
	    Details details = new Details();
	    details.setShipping("10.00");
	    details.setSubtotal("20.00");
	    details.setTax("2.00");
	 
	    Amount amount = new Amount();
	    amount.setCurrency("USD");
	    amount.setTotal("32.00");
	    amount.setDetails(details);
	 
	    Transaction transaction = new Transaction();
	    transaction.setAmount(amount);
	    transaction.setDescription("dat");
	     
	    ItemList itemList = new ItemList();
	    List<Item> items = new ArrayList<>();
	     
	    Item item = new Item();
	    item.setCurrency("USD");
	    item.setName("dat");
	    item.setPrice("20.00");
	    item.setTax("2.00");
	    item.setQuantity("1");
	     
	    items.add(item);
	    itemList.setItems(items);
	    transaction.setItemList(itemList);
	 
	    List<Transaction> listTransaction = new ArrayList<>();
	    listTransaction.add(transaction);  
	     
	    return listTransaction;
	}
	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
		PaymentExecution paymentExecution = new PaymentExecution();
		paymentExecution.setPayerId(payerId);

		Payment payment = new Payment().setId(paymentId);

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		return payment.execute(apiContext, paymentExecution);
	}
	
	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		return Payment.get(apiContext, paymentId);
	}
}
