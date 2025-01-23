package readinglog;

import java.util.List;

public interface CommentService {
    int addComment(CommentDTO dto);
    List<CommentDTO> getComments(int board_no);
    int removeComment(int comment_id);
}