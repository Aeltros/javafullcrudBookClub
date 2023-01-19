package com.assefa.bookclub.controllers;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.assefa.bookclub.models.Book;
import com.assefa.bookclub.models.UserModel;
import com.assefa.bookclub.services.BookService;
import com.assefa.bookclub.services.UserService;


@Controller
public class BookController {
//DEPENDENCY INJECTION //IOC//DEFAULT CONSTRACTOR 
		@Autowired
		private BookService bookServ;
		
		@Autowired
		private UserService userServ;


//==================================================Index Route
		@GetMapping("/dashboard")
		public String index(Model model ) {
			List<Book> allthebooks = bookServ.allBooks();
			List<UserModel> allusers = userServ.allUsers();
//			pass the book to the jsp page
			model.addAttribute("allthebooks", allthebooks);
			model.addAttribute("Users",allusers);
			return "index.jsp";
		}
//==================================================Create Route	
	@GetMapping("/create")
		public String create(Model model) {
//			create book object using empty constractor
		Book newBook = new Book();
		model.addAttribute("book", newBook);
//			Pass an empty book object
		return "create.jsp";
		}
//====================================================Create Post Route
	@PostMapping("/books")
	public String create(@Valid @ModelAttribute("book") Book book,
//validate submitted info from create page
			BindingResult result, RedirectAttributes flash) {
			if (result.hasErrors()) {
			return "create.jsp";
//errors==return to the page
		} else {
			bookServ.createBook(book);
			flash.addFlashAttribute("success", "cool you made a book!");
			return "redirect:/success";
		}
	}

		// ==================================================================Edit Page
	@GetMapping("/edit/{id}")
	public String updatePage(@PathVariable("id") Long id, Model model) {
		Book book = bookServ.findBook(id);
		model.addAttribute("book", book);
		return "edit.jsp";
	}

//=====================================================================EDIT POST ROUTE
		@RequestMapping(value = "/books/{id}", method = RequestMethod.PUT)
	public String updates(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		} else {
			bookServ.updateBook(book);
			return "redirect:/success";
		}
	}

	//=======================================================================DELETE
		@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
		public String destroy(@PathVariable("id") Long id) {
			bookServ.deleteBook(id);
			return "redirect:/success";
		}

	//=======================================================================DELETE	
	@GetMapping("/delete/{id}")
	public String deleteGet(@PathVariable("id") Long id) {
			bookServ.deleteBook(id);
		return "redirect:/success";
		}

		// ========================================================================SHOWONEBook
	@GetMapping("/show/{id}")
	public String showone(@PathVariable("id") Long bookId, Model model) {
			Book thisbook = bookServ.findBook(bookId);
			List<UserModel> allusers = userServ.allUsers();
			model.addAttribute("thisbook", thisbook);
			model.addAttribute("Users",allusers);
			return "show.jsp";
		}
	//=========================SHOW THIS USERS BOOKSSHOW
//	@GetMapping("/userbooks/{id}")
//	public String showonee(@PathVariable("id") Long userId, Model model) {
//		UserModel thisuser = userServ.getOneUser(userId);
//		model.addAttribute("thisuser", thisuser);
//		return "showuserbooks.jsp";
//	}


	
	
	
	
	

}
