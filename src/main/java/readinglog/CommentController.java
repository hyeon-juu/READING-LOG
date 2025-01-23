package readinglog;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/comments")
public class CommentController {
    @Autowired
    CommentService commentService;

    @PostMapping("/add")
    public String addComment(CommentDTO dto) {
        commentService.addComment(dto);
        return "redirect:/boarddetail?board_no=" + dto.getBoard_no();
    }

    @PostMapping("/delete")
    public String deleteComment(@RequestParam("comment_id") int comment_id, @RequestParam("board_no") int board_no) {
        commentService.removeComment(comment_id);
        return "redirect:/boarddetail?board_no=" + board_no;
    }

    @RequestMapping("/list")
    @ResponseBody
    public List<CommentDTO> getComments(@RequestParam("board_no") int board_no) {
        return commentService.getComments(board_no);
    }
}
