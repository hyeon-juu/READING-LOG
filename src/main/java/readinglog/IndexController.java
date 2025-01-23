package readinglog;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;


@Controller
public class IndexController {
	
	@Autowired
	BookService service;
	
	
	@RequestMapping("/index")
    public String index(Model model, HttpSession session) {
        
		// login status info
		if(session.getAttribute("loginId") != null) {
			model.addAttribute("loginStatus", true);
		} else {
			model.addAttribute("loginStatus", false);
		}
		
		List<BookDTO> books = service.getTodayBook(); // 예시: 모든 책 정보를 가져오는 메서드
        
        model.addAttribute("books", books);
        
        return "index"; // index.jsp 파일로 이동
    }
	
	@GetMapping("/search")
	public String search() {
		return "bookSearch";
	}
}
