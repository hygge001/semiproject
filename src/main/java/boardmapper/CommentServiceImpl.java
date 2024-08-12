package boardmapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDAO commentDAO;

    @Override
    public void addComment(CommentDTO comment) {
        commentDAO.addComment(comment);
    }

    @Override
    public List<CommentDTO> getCommentsByBoardSeq(int boardSeq) {
        return commentDAO.getCommentsByBoardSeq(boardSeq);
    }
}