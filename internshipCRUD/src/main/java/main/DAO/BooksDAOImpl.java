package main.DAO;

import main.BookNotFoundException;
import main.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BooksDAOImpl implements BooksDao {
    private static final Logger logger = LoggerFactory.getLogger(BooksDAOImpl.class);
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public void createBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);
        logger.info("Book created " + book);
        System.out.println("book created");
    }

    @Override
    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(book);
        logger.info("Book successfully updated " + book);
    }

    @Override
    public void deleteBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book)session.load(Book.class, id);
        if (book != null) {
            session.delete(book);
            logger.info("Book successfully removed by ID " + book);
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Book> getAllBooks () {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> books = session.createQuery("from Book").list();
        for(Book book : books){
            logger.info("Book list: "+ book); }
            return books;
    }

    @SuppressWarnings("unchecked")
    @Override
    public Book getBook (String title){
        Book book = null;
        Session session=this.sessionFactory.getCurrentSession();
        try {
            List<Book> books = session.createQuery("from Book where title = :title").setString("title",title).list();
                if(books.size()==0){
                    throw new BookNotFoundException("Book titled "+ title +": not found");
                }
                else book = books.get(0);

            }
            catch (BookNotFoundException e){
                e.printStackTrace();
            }
            logger.info("Book successfully found by Title "+ book);

            return book;
    }

    @Override
    public Book getBook (int id){
        Book book = null;
        Session session=this.sessionFactory.getCurrentSession();
        try {
            book = (Book)session.get(Book.class, id);
            if (book == null) throw new BookNotFoundException("Book with ID "+ id +": not found");
        }
        catch (BookNotFoundException e){
            e.printStackTrace();
        }
        logger.info("Book successfully found by ID "+ book);

        return book;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Book> getAllAlreadyReadBooks(boolean isReadAlready) {
        List<Book> books = null;
        Session session=this.sessionFactory.getCurrentSession();
        books = session.createQuery("from Book where isReadAlready = :isReadAlready").setBoolean("isReadAlready",isReadAlready).list();
        logger.info("Books successfully found by isReadAlready "+ books);
        return books;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Book> getAllBooksByAuthor (String author){
        List<Book> books = null;
        Session session=this.sessionFactory.getCurrentSession();
        books = session.createQuery("from Book where author = :author").setString("author",author).list();
        logger.info("Books successfully found by Author "+ books);
        return books;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Book> getAllBooksByISBN (String isbn){
        List<Book> books = null;
        Session session=this.sessionFactory.getCurrentSession();
        books = session.createQuery("from Book where isbn = :isbn").setString("isbn",isbn).list();
        logger.info("Books successfully found by ISBN "+ books);
        return books;
    }

    }
