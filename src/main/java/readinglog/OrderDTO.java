package readinglog;

public class OrderDTO {
	
	int order_no;
	String order_book_title;
	int order_quantity;
	String order_address, order_datetime, order_mem_id, order_state;
	int order_payprice;
	
	
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
	public String getOrder_book_title() {
		return order_book_title;
	}
	public void setOrder_book_title(String order_book_title) {
		this.order_book_title = order_book_title;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_datetime() {
		return order_datetime;
	}
	public void setOrder_datetime(String order_datetime) {
		this.order_datetime = order_datetime;
	}
	public String getOrder_mem_id() {
		return order_mem_id;
	}
	public void setOrder_mem_id(String order_mem_id) {
		this.order_mem_id = order_mem_id;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public int getOrder_payprice() {
		return order_payprice;
	}
	public void setOrder_payprice(int order_payprice) {
		this.order_payprice = order_payprice;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [order_no=" + order_no + ", order_book_title=" + order_book_title + ",\n"
				+ " order_quantity=" + order_quantity + ", order_address=" + order_address + ",\n"
				+ " order_datetime=" + order_datetime + ", order_mem_id=" + order_mem_id + ",\n"
				+ " order_state=" + order_state + ", order_payprice=" + order_payprice + "]";
	}
	
	
}
