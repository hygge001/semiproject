package boardmapper;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public interface CommentService {
    void addComment(CommentDTO comment);
    List<CommentDTO> getCommentsByBoardSeq(int boardSeq);
}