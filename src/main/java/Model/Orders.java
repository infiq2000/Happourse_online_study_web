package Model;

public class Orders {
	private int orderID;
	private int uid;
	private float subtotal;
	private float total;
	private float fee;
	private float tax;
	public Orders(int uid, float subtotal, float total, float fee, float tax) {
		super();
		this.uid = uid;
		this.subtotal = subtotal;
		this.total = total;
		this.fee = fee;
		this.tax = tax;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public float getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public float getFee() {
		return fee;
	}
	public void setFee(float fee) {
		this.fee = fee;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	
}
