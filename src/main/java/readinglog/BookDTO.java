package readinglog;

import org.springframework.stereotype.Component;

@Component
public class BookDTO {

	String book_title,book_author,book_published_date,book_image_url,book_content,book_summary;
	int book_no, book_price;
	
	public int getBook_no() {
		return book_no;
	}
	public void setBook_no(int book_no) {
		this.book_no = book_no;
	}
	public String getBook_title() {
		return book_title;
	}
	public void setBook_title(String book_title) {
		this.book_title = book_title;
	}
	public String getBook_author() {
		return book_author;
	}
	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}
	public String getBook_published_date() {
		return book_published_date;
	}
	public void setBook_published_date(String book_published_date) {
		this.book_published_date = book_published_date;
	}
	public String getBook_image_url() {
		return book_image_url;
	}
	public void setBook_image_url(String book_image_url) {
		this.book_image_url = book_image_url;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}	
	public String getBook_content() {
		return book_content;
	}
	public void setBook_content(String book_content) {
		this.book_content = book_content;
	}
	public String getBook_summary() {
		return book_summary;
	}
	
	
	
	@Override
	public String toString() {
		return "bookDTO [book_no=" + book_no + ", book_title=" + book_title + ", book_author=" + book_author
				+ ", book_published=" + book_published_date + ", book_image_url=" + book_image_url + ", book_content="
				+ book_content + ", book_summary=" + book_summary + ", book_price=" + book_price + "]";
	}

	
}
