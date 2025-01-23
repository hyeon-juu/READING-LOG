package readinglog;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;


@Controller
public class BookBestController {
	
	@Autowired
	@Qualifier("bookServiceImpl")
	BookService book_service;
	
	@Autowired
	@Qualifier("orderServiceImpl")
	OrderService order_service;
		
	//주문수 많은 책 베스트 3가지 
	 @GetMapping("/bookbest")
	 ModelAndView getTop3BooksByQuantity(HttpSession session) {
		 //List<BookBestDTO> books = bookBestService.getTop3BooksByQuantity();
		 //model.addAttribute("books", books);
		 

		 ModelAndView mv = new ModelAndView();
		 
		 String[] bestBookArr = order_service.getBestBookList();
		 
		 BookDTO[] bestBookDto = new BookDTO[3];
		 
		 for(int i = 0; i < 3; i++) {
			 bestBookDto[i] = book_service.getBookByTitle(bestBookArr[i]);
		 }
		 
		// login status info
		if(session.getAttribute("loginId") != null) {
			mv.addObject("loginStatus", true);
		} else {
			mv.addObject("loginStatus", false);
		}
		 
		 mv.addObject("bestbookdto", bestBookDto);
		 mv.setViewName("book/bookBest");
		 
		 return mv;
	 }
	 	 
}
























