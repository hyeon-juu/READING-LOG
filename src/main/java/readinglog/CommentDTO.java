package readinglog;

public class CommentDTO {
    private int comment_id;
    private int board_no;
    private String comment_content;
    private String comment_writer;
    private String comment_writingtime;

    // Getters and Setters
    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getBoard_no() {
        return board_no;
    }

    public void setBoard_no(int board_no) {
        this.board_no = board_no;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public String getComment_writer() {
        return comment_writer;
    }

    public void setComment_writer(String comment_writer) {
        this.comment_writer = comment_writer;
    }

    public String getComment_writingtime() {
        return comment_writingtime;
    }

    public void setComment_writingtime(String comment_writingtime) {
        this.comment_writingtime = comment_writingtime;
    }
}
