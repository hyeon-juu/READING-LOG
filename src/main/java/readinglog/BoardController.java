package readinglog;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BoardController {
	@Autowired
	@Qualifier("boardServiceImpl")
	BoardService service;//2개 bean
	
	@Autowired
	@Qualifier("commentServiceImpl")
	CommentService commentService;
	
 //boardlist 
 //boardwrite
// "/" = start.jsp	
	@RequestMapping("/")  //http:localhost:9090/
	String start(){
		return "board/start";
	}
	@GetMapping("/boardwrite")
	String writeform() throws Exception{
		//new BoardDAO().insertBoardTransaction();
		return "board/writeform";
	}
	
	@PostMapping("/boardwrite")
	ModelAndView writeprocess(BoardDTO dto, @RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum) {
	    int insertrow = service.registerBoard(dto);
	    ModelAndView mv = new ModelAndView();
	    
	    int pagecount = 10;
	    int start = (pagenum -1) * pagecount;
	    int limit[] = {start, pagecount};
	    
	    int totalboard = service.getTotalBoard();
	    List<BoardDTO> boardlist = service.getPagingBoardList(limit);
	    
	    mv.addObject("totalboard", totalboard);
	    mv.addObject("boardlist", boardlist);
	    mv.setViewName("board/list");
	    return mv;
	}
	
	@RequestMapping("/boardlist")
	ModelAndView boardlist(@RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum) {
		int pagecount = 10;
		int start = (pagenum -1) * pagecount;
		int limit[] = {start, pagecount};
		
		int totalboard = service.getTotalBoard();
		List<BoardDTO> boardlist = service.getPagingBoardList(limit);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("totalboard", totalboard);
		mv.addObject("boardlist", boardlist);
		mv.setViewName("board/list");
		return mv;
		
	}

	@RequestMapping("/boarddetail")
	ModelAndView boarddetail(int board_no) {
	    BoardDTO dto = service.updateViewcountAndGetDetail(board_no);
	    List<CommentDTO> comments = commentService.getComments(board_no);
	    
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("detaildto", dto);
	    mv.addObject("comments", comments);
	    mv.setViewName("board/detail");
	    return mv;
	}


	@RequestMapping("/boarddelete")
	String boarddelete(int board_no) {
	//- seq 게시물 삭제 sql 실행 - 뷰이름(모델없고) redirect:/boardlist 리턴(boardlist.jsp 뷰)
	    int delete = service.deleteBoard(board_no);

	   return "redirect:/boardlist";
	   
	}
	@RequestMapping("/boardupdate")
	String boardupdate(BoardDTO dto, @RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum) {
	    service.updateBoard(dto);
	    
	    return "redirect:/boardlist?pagenum=" + pagenum;
	}
	

	@RequestMapping("/boardsearchlist")
	//@RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum
	ModelAndView boardsearchlist(
	String item, String word, @RequestParam(value="pagenum", required=false, defaultValue="1") int pagenum	) {
		System.out.println(item+":"+word+":"+pagenum);
		int pagecount = 5;
		int start = (pagenum -1) * pagecount;
		int limit[] = {start, pagecount};
		
	
		HashMap map = new HashMap();
		if(item.equals("all")) {
			map.put("searchcolname", null);
		}
		else {
			map.put("searchcolname", item);
		}
		map.put("searchvalue", "%" + word + "%");
		
		map.put("limit", limit);
		//
		int totalsearchboard = service.getBoardSearchCount(map);
		System.out.println(totalsearchboard);
		List<BoardDTO> boardsearchlist = service.getSearchPagingBoardList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("totalsearchboard", totalsearchboard);
		mv.addObject("boardsearchlist", boardsearchlist);
		mv.setViewName("board/searchlist");
		return mv;
		
	}
}