package boardmapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @PostMapping("/add-comment")
    public String addComment(@RequestParam("boardSeq") int boardSeq,
                             @RequestParam("contents") String contents,
                             @RequestParam("writer") String writer) {
        CommentDTO comment = new CommentDTO();
        comment.setBoardSeq(boardSeq);
        comment.setContents(contents);
        comment.setWriter(writer);
        commentService.addComment(comment);
        return "redirect:/boarddetail?seq=" + boardSeq;
    }

    @GetMapping("/get-comments")
    @ResponseBody
    public List<CommentDTO> getCommentsByBoardSeq(@RequestParam("boardSeq") int boardSeq) {
        return commentService.getCommentsByBoardSeq(boardSeq);
    }
}