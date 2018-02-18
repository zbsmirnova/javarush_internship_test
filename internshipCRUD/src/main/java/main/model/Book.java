package main.model;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table  (name = "books")
public class Book{
    @Id
    @Column(name="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String title;
    private String description;
    private String author;
    private String isbn;
    private int printYear;
    private boolean isReadAlready;

    public Book(){}

    public Book(String title, String description, String author, String isbn, int printYear, boolean isReadAlready) {
        this.title = title;
        this.description = description;
        this.author = author;
        this.isbn = isbn;
        this.printYear = printYear;
        this.isReadAlready = isReadAlready;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "title", nullable = true, length = 100)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "description", nullable = true, length = 255)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "author", nullable = true, length = 100)
    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Basic
    @Column(name = "isbn", nullable = true, length = 20)
    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    @Basic
    @Column(name = "printYear", nullable = true)
    public Integer getPrintYear() {
        return printYear;
    }

    public void setPrintYear(Integer printYear) {
        this.printYear = printYear;
    }

    @Basic
    @Column(name = "isReadAlready", nullable = true)
    public Boolean getReadAlready() {
        return isReadAlready;
    }

    public void setReadAlready(Boolean readAlready) {
        this.isReadAlready = readAlready;
    }

    @Override
    public String toString() {
        return "Book[" +
                "id =" + this.id +
                ", title ='" + this.title +
                ", description =" + this.description +
                ", author =" + this.author +
                ", isbn =" + this.isbn +
                ", printYear =" + this.printYear +
                ", isReadAlready =" + this.isReadAlready +
                "]";
    }


}
