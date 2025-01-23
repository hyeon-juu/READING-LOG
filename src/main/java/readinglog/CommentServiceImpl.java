package readinglog;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    CommentDAO commentDAO;

    @Override
    public int addComment(CommentDTO dto) {
        return commentDAO.insertComment(dto);
    }

    @Override
    public List<CommentDTO> getComments(int board_no) {
        return commentDAO.getCommentsByBoardNo(board_no);
    }

    @Override
    public int removeComment(int comment_id) {
        return commentDAO.deleteComment(comment_id);
    }
}
