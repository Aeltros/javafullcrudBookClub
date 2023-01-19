package com.assefa.bookclub.services;
import java.util.List;
import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import com.assefa.bookclub.models.LoginUser;
import com.assefa.bookclub.models.UserModel;
import com.assefa.bookclub.repositories.UserRepository;

//=====business logic here!!!!=======

@Service
public class UserService {
	

	@Autowired
	private UserRepository userRepository;

//======register user===========

	public UserModel registerUser(UserModel newUser, BindingResult result) {

//==========is email already in the system?========

		Optional<UserModel> potentialUser = userRepository.findByEmail(newUser.getEmail());
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "registerError", "this email is already taken");
		}

//===========is password match with confirm password?==========	

		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "registerError", "password must match");
		}
//===========Does the object has errors?========

		if (result.hasErrors()) {
			return null;
		}
//=======Good to register user? then hash the password and save user to DB=========

		else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			return userRepository.save(newUser);
		}
	}

//	==========login user=========

	public UserModel login(LoginUser newLoginObject, BindingResult result) {
		Optional<UserModel> potentialUser = userRepository.findByEmail(newLoginObject.getEmail());
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "loginError", "email not in DB");
		} else {
			UserModel user = potentialUser.get();
//=====check given password against hashed password=====

			if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
				result.rejectValue("password", "loginError", "Invalid Password!");
			}
			if (result.hasErrors()) {
				return null;
			} else {
				return user;
			}

		}

		return null;
	}

//		======method to retrieve all users from DB if you are admin user======

	public List<UserModel> allUsers() {

		return userRepository.findAll();
	}

//		=======retrieve one specific user======

	public UserModel getOneUser(Long id) {
		Optional<UserModel> optionalUser = userRepository.findById(id);
		if (optionalUser.isPresent()) {
			return optionalUser.get();
		} else {
			return null;
		}

	}

	
	
	

}
