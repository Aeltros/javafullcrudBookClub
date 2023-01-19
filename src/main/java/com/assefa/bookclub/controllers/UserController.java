package com.assefa.bookclub.controllers;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.assefa.bookclub.models.Book;
import com.assefa.bookclub.models.LoginUser;
import com.assefa.bookclub.models.UserModel;
import com.assefa.bookclub.services.BookService;
import com.assefa.bookclub.services.UserService;

@Controller
public class UserController {
	

//	=========Auto wired services======

	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookServ;

//==========Bind empty UserModel and LoginUser objects to the JSP to capture the form input======

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new UserModel());
		model.addAttribute("newLogin", new LoginUser());
		return "loginRegister.jsp";
	}

	// ====== Register new UserModel Post method after service method=========

	@PostMapping("/register")
	public String registerUser(@Valid @ModelAttribute("newUser") UserModel newUser, BindingResult result, Model model,
			HttpSession session) {

		userService.registerUser(newUser, result);

//======if form has errors=====

		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "loginRegister.jsp";
		} else {
			session.setAttribute("user_id", newUser.getId());

			return "redirect:/success";
		}
	}
//=====login post method======

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		UserModel userModel = userService.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new UserModel());
			return "loginRegister.jsp";
		} else {
			session.setAttribute("user_id", userModel.getId());
			return "redirect:/success";
		}

	}

	
	
//SUCCESS RENDERS TO HOME PAGE
//=======take home route======================================================================================================

	@GetMapping("/success")
	public String success(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("user_id");
		// ====check if in session====
		if (userId == null) {
			return "redirect:/";
			}
//===*Pass user in session
		UserModel thisUser = userService.getOneUser(userId);
		model.addAttribute("thisUser", thisUser);
//===*Pass All books in the database
		List<Book> allthebooks = bookServ.allBooks();
		model.addAttribute("allthebooks", allthebooks);
//=====*Send Books/and logged in user to the dashboard
	
		return "index.jsp";
	}
	
//SUCCESS RENDERS TO HOME PAGE=====================================================================================
//	=== LOGOUT route ===
	@GetMapping("/logout")
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:/";
	}
	
	
//SHOW ALL USERS BOOKS=========================================================*
	@GetMapping("/showuserbooks/{id}")
	public String showonee(@PathVariable("id") Long userId, Model model) {
		UserModel thisuser = userService.getOneUser(userId);
		model.addAttribute("thisuser", thisuser);
		
		
		
		return "Showuserbooks.jsp";
	}
	
	
	
	
	
	
	
	
	

}
