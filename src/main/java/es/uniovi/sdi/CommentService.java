package es.uniovi.sdi;

import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;

import java.time.LocalDateTime;
import java.util.LinkedList;
import java.util.List;

public class CommentService {
    public List<Comment> getComments() {
        List<Comment> comments = new LinkedList<>();
        ObjectContainer db = null;
        try {
            db = Db4oEmbedded.openFile("bdComments");
            comments.addAll(db.queryByExample(Comment.class));
        } finally {
            db.close();
        }
        return comments;
    }

    public void setNewComment(Comment newComment) {
        newComment.setDate(LocalDateTime.now());
        ObjectContainer db = null;
        try {
            db = Db4oEmbedded.openFile("bdComments");
            db.store(newComment);
        } finally {
            db.close();
        }
    }
}
