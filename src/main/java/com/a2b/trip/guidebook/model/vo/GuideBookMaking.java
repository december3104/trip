package com.a2b.trip.guidebook.model.vo;

import java.io.Serializable; 

public class GuideBookMaking implements Serializable {
	private static final long serialVersionUID = 11000L;
	
	private int book_page;
	private String book_no;
	private String maing_id;
	private String book_content;
	
	public GuideBookMaking() {}

	public GuideBookMaking(int book_page, String book_no, String maing_id, String book_content) {
		super();
		this.book_page = book_page;
		this.book_no = book_no;
		this.maing_id = maing_id;
		this.book_content = book_content;
	}

	public int getBook_page() {
		return book_page;
	}

	public void setBook_page(int book_page) {
		this.book_page = book_page;
	}

	public String getBook_no() {
		return book_no;
	}

	public void setBook_no(String book_no) {
		this.book_no = book_no;
	}

	public String getMaing_id() {
		return maing_id;
	}

	public void setMaing_id(String maing_id) {
		this.maing_id = maing_id;
	}

	public String getBook_content() {
		return book_content;
	}

	public void setBook_content(String book_content) {
		this.book_content = book_content;
	}

	@Override
	public String toString() {
		return "Guidebookmaking [book_page=" + book_page + ", book_no=" + book_no + ", maing_id=" + maing_id
				+ ", book_content=" + book_content + "]";
	}
	
}
