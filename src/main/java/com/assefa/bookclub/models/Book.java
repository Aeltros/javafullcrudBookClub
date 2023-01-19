package com.assefa.bookclub.models;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="books")
//lower case plural sql table
public class Book {
//	Member Variables of the class/ID/title/author/pages
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min=3, max =200, message=" minimum title lengh required")
	private String title;
	
	@NotNull
	@Size(min=3, max =200,   message="required field"            )
	private String author;
	
	@NotNull
	@Size(min=5, max =200,   message="Please Enter your thoughts"            )
	private String mythoughts;
	
//================= ASSOCIATION====================================================
		@ManyToOne( fetch = FetchType.LAZY)
		@JoinColumn(name="user_id")
		private UserModel user;
//================= ASSOCIATION====================================================	
		//for created/updated
	    // This will not allow the createdAt column to be updated after creation
	    @Column(updatable=false)
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date createdAt;
	    @DateTimeFormat(pattern="yyyy-MM-dd")
	    private Date updatedAt;
	    
//================= EMPTY CONSTRUCTOR====================================================

//EMPTY CONSTRACTOR
	  public Book( )
	  {}
 //================= Getters AND SETTERS====================================================

	public Long getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getAuthor() {
		return author;
	}

	public String getMythoughts() {
		return mythoughts;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setMythoughts(String mythoughts) {
		this.mythoughts = mythoughts;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	public UserModel getUser() {
		return user;
	}

	public void setUser(UserModel user) {
		this.user = user;
	}

}
