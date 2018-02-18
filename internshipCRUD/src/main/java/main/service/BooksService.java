package main.service;

import main.model.Book;
import java.util.List;

public interface BooksService {
    public void createBook(Book book);
    public void updateBook(Book book);
    public void deleteBook(int id);
    public List<Book> getAllBooks();
    public List<Book> getAllBooksByAuthor(String Author);
    public List<Book> getAllAlreadyReadBooks(boolean isReadAlready); //список всех прочитанных/непрочитанных книг
    public List<Book> getAllBooksByISBN (String isbn);
    public Book getBook(int id);
    public Book getBook(String title);
}
