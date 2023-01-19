package com.assefa.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assefa.bookclub.models.Book;
import com.assefa.bookclub.repositories.BookRepo;
import com.assefa.bookclub.repositories.UserRepository;

@Service
public class BookService {
	

//	DEPENDENCY INJECTION of repo (REPO)//CREATES CONSTRUCTOR THAT DOES DEPENDENCY INJECTION
	@Autowired
	private BookRepo bookRepo;
	@Autowired
	private UserRepository userRepository;

//	READ ALL
	public List<Book> allBooks() {
		return bookRepo.findAll();
	}

//	CREATE
	public Book createBook(Book b) {
		return bookRepo.save(b);
	}

//	READ ONE
	public Book findBook(Long id) {
		Optional<Book> optionalBook = bookRepo.findById(id);

//		return optionalBook.isPresent() ? optionalBook.get() : null;
		if (optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}

//	Update
	
	  public Book updateBook (Book book) {
		  Book updateBook= bookRepo.save(book);
	        return updateBook;
	    }
//	DELETE
	public void  deleteBook(Long id) {
		bookRepo.deleteById(id);
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
