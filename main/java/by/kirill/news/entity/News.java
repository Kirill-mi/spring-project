package by.kirill.news.entity;

import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

@Entity
@Table(name = "news")
public class News implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotNull(message = "{message.necessarily}")
    @Pattern(regexp = "(.){3,200}", message = "{message.validation}")
    private String title;

    @NotNull(message = "{message.necessarily}")
    @Pattern(regexp = "(.){3,200}", message = "{message.validation}")
    @Column(name = "brief")
    private String brief;

    @NotNull(message = "{message.necessarily}")
    @Pattern(regexp = "(.){3,2000}", message = "{message.validation}")
    @Column(name = "text")
    private String text;

    @Column(name = "date", updatable = false)
    @CreationTimestamp
    private LocalDate date;


    @Column(name = "author")
    private String author;

    public News() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof News)) return false;
        News news = (News) o;
        return title.equals(news.title) &&
                brief.equals(news.brief) &&
                text.equals(news.text) &&
                date.equals(news.date) &&
                author.equals(news.author);
    }

    @Override
    public int hashCode() {
        return Objects.hash(title, brief, text, date, author);
    }

    @Override
    public String toString() {
        return "News{" +
                "title='" + title + '\'' +
                ", brief='" + brief + '\'' +
                ", date=" + date +
                '}';
    }
}