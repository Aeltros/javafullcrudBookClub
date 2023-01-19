package com.assefa.bookclub.repositories;
import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.assefa.bookclub.models.Book;

@Repository
public interface BookRepo extends CrudRepository<Book, Long> {
	


	
//Model/ID type
//OVERIDE findALL
List<Book>findAll();





	

}
  