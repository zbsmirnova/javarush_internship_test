package main.controller;

import main.BookNotFoundException;
import main.model.Book;
import main.service.BooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller

public class BooksController {
    private BooksService booksService;
    @Autowired(required = true)
    @Qualifier(value = "BooksService")
    public void setBooksService(BooksService booksService) {
        this.booksService = booksService;
    }

    private static final int MAX_ROWS_PER_PAGE = 10;


    @RequestMapping(value = "/books/create",method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book){
        System.out.println(book.getId());
        if(book.getId() == 0){
            System.out.println(book);
            this.booksService.createBook(book);
        }
        else{
            Book oldBook = booksService.getBook(book.getId());
            book.setAuthor(oldBook.getAuthor());
            this.booksService.updateBook(book);}


        return "redirect:/books";
    }

    @RequestMapping("/open/{id}")
    public String openBook(@PathVariable("id")int id, Model model){
        Book book = this.booksService.getBook(id);
        System.out.println(book);
        book.setReadAlready(true);
        this.booksService.updateBook(book);
        model.addAttribute("book", this.booksService.getBook(id));
        return "openabook";
    }

    @RequestMapping("/edit/{id}")
    public String editBook(@PathVariable("id")int id, Model model){

        model.addAttribute("book", this.booksService.getBook(id));
        model.addAttribute("listBooks", this.booksService.getAllBooks());
        return "books";
    }

    @RequestMapping(value = "/openabook/{id}",method = RequestMethod.GET)
    public String bookData(@PathVariable("id")int id,Model model){
        Book book = this.booksService.getBook(id);
        book.setReadAlready(true);
        booksService.updateBook(book);
        model.addAttribute("book", book);
        return "openabook";
    }

    @RequestMapping(value = "/searchbyquery",method = RequestMethod.POST)
    public String searchBookbyquery (HttpServletRequest request, Model model) throws BookNotFoundException{
        String result;
        String searchRequest = request.getParameter("request");
        System.out.println("Book is searched by request: " + searchRequest );

        List<Book> booksOnRequest;

        Book book = this.booksService.getBook(searchRequest);
        System.out.println(book);
        if(book != null){
            booksService.updateBook(book);
            booksOnRequest = new ArrayList<>();
            booksOnRequest.add(book);
        }
        else {

            if (searchRequest.equals("true") || searchRequest.equals("false")) {
                boolean isReadAlready = new Boolean(searchRequest);
                booksOnRequest = this.booksService.getAllAlreadyReadBooks(isReadAlready);
            } else {
                List<Book> booksbyAythor = this.booksService.getAllBooksByAuthor(searchRequest);
                List<Book> booksbyISBN = this.booksService.getAllBooksByISBN(searchRequest);
                if (!booksbyAythor.isEmpty()) booksOnRequest = booksbyAythor;
                else if (!booksbyISBN.isEmpty()) booksOnRequest = booksbyISBN;
                else  return "bookNotFound";
            }

        }
        model.addAttribute("listbooksbyquery", booksOnRequest);
        result = "bookdata";
        return result;
    }


    @RequestMapping(value = "/search",method = RequestMethod.POST)
    public String searchBook (HttpServletRequest request, Model model) throws BookNotFoundException{
        String bookTitle = request.getParameter("bookTitle");
        System.out.println("BookTitle in controller: " + bookTitle );
        Book book=this.booksService.getBook(bookTitle);
        String result;
        if(book==null){
            result="bookNotFound";
        }
        else {
            book.setReadAlready(true);
            booksService.updateBook(book);
            result="bookdata";
        }
        model.addAttribute("book",book);
        return result;
    }
    

    @RequestMapping(value="/books",method = RequestMethod.GET)
    public ModelAndView listBooks(@RequestParam(required = false) Integer page) {
        ModelAndView modelAndView = new ModelAndView("books");
        modelAndView.addObject("book",new Book());
        List<Book> books = booksService.getAllBooks();
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<>(books);
        pagedListHolder.setPageSize(MAX_ROWS_PER_PAGE);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());


        if(page==null || page < 1 || page > pagedListHolder.getPageCount())
            page = 1;


        modelAndView.addObject("page", page);

        if(page>pagedListHolder.getPageCount()){
            pagedListHolder.setPage(page);
            modelAndView.addObject("listBooks", pagedListHolder.getPageList());
        }

        else if(page <= pagedListHolder.getPageCount()) {

            pagedListHolder.setPage(page-1);
            modelAndView.addObject("listBooks", pagedListHolder.getPageList());
        }

        return modelAndView;
    }
    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id){
        this.booksService.deleteBook(id);
        return "redirect:/books";
    }
    
}
