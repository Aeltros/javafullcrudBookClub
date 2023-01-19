package com.assefa.bookclub.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.assefa.bookclub.models.UserModel;
@Repository
public interface UserRepository extends CrudRepository<UserModel, Long> {
	
	
	
//	=======implement this methods order from Interface=======
	
	List<UserModel>findAll();
	
//	=====our method======
	
	Optional<UserModel> findByEmail(String email);

}
