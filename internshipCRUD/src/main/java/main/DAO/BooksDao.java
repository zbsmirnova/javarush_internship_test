package main.DAO;

import main.model.Book;
import java.util.List;

public interface BooksDao {
    public void createBook(Book book);
    public void updateBook(Book book);
    public void deleteBook(int id);
    public List<Book> getAllBooksByISBN (String isbn);
    public List<Book> getAllBooks();               // список всех книг
    public List<Book> getAllBooksByAuthor(String Author); //  список книг одного автора
    public List<Book> getAllAlreadyReadBooks(boolean isReadAlready); // список прочитанных или непрочитанных книг
    public Book getBook(int id);
    public Book getBook(String title);

}
