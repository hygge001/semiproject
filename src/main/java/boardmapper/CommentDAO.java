package boardmapper;

import java.util.List;

public interface CommentDAO {
	
    void addComment(CommentDTO comment);
    
    List<CommentDTO> getCommentsByBoardSeq(int boardSeq);
    
    int totalCommentsCount();
}