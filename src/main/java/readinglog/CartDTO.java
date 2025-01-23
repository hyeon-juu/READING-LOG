package readinglog;

import org.springframework.stereotype.Component;

@Component
public class CartDTO {

	int cart_no, cart_book_quantity, cart_book_price;
	String cart_mem_id, cart_book_title;
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getCart_book_quantity() {
		return cart_book_quantity;
	}
	public int getCart_book_price() {
		return cart_book_price;
	}
	public void setCart_book_price(int cart_book_price) {
		this.cart_book_price = cart_book_price;
	}
	public void setCart_book_quantity(int cart_book_quantity) {
		this.cart_book_quantity = cart_book_quantity;
	}
	public String getCart_mem_id() {
		return cart_mem_id;
	}
	public void setCart_mem_id(String cart_mem_id) {
		this.cart_mem_id = cart_mem_id;
	}
	public String getCart_book_title() {
		return cart_book_title;
	}
	public void setCart_book_title(String cart_book_title) {
		this.cart_book_title = cart_book_title;
	}
	
	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", cart_book_quantity=" + cart_book_quantity + ", cart_mem_id="
				+ cart_mem_id + ", cart_book_title=" + cart_book_title + "]";
	}
	
}
