package es.uniovi.sdi;

import java.time.LocalDateTime;

public class Comment {

    private String username;
    private String comment;
    private LocalDateTime date;

    public Comment() {}

    public Comment(String username, String comment, LocalDateTime date) {
        this.username = username;
        this.comment = comment;
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public String getComment() {
        return comment;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

}
