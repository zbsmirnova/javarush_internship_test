package main.service;

import main.DAO.BooksDAOImpl;
import main.DAO.BooksDao;
import main.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BooksServiceImpl implements BooksService{
    private BooksDao booksDao;

    @Override
    public List<Book> getAllBooksByISBN(String isbn) {
        return booksDao.getAllBooksByISBN(isbn);
    }

    @Transactional
    @Override
    public void createBook(Book book) {
        booksDao.createBook(book);
    }

    @Transactional
    @Override
    public void updateBook(Book book) {
        booksDao.updateBook(book);
    }

    @Transactional
    @Override
    public void deleteBook(int id) {
        booksDao.deleteBook(id);
    }


    @Transactional
    @Override
    public List<Book> getAllBooks() {
        return booksDao.getAllBooks();
    }

    @Transactional
    @Override
    public List<Book> getAllBooksByAuthor(String Author) {
        return booksDao.getAllBooksByAuthor(Author);
    }

    @Transactional
    @Override
    public List<Book> getAllAlreadyReadBooks(boolean isReadAlready) {
        return booksDao.getAllAlreadyReadBooks(isReadAlready);
    }


    @Transactional
    @Override
    public Book getBook(int id) {
        return booksDao.getBook(id);
    }

    @Transactional
    @Override
    public Book getBook(String title) {
        return booksDao.getBook(title);
    }

    public void setBooksDao(BooksDao BooksDao) {
        booksDao = BooksDao;
    }

}
