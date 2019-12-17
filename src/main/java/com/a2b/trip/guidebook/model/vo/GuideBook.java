package com.a2b.trip.guidebook.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class GuideBook implements Serializable {
	private static final long serialVersionUID = 10000L;
	
	private String book_no;
	private String book_id;
	private Date book_change_date;
	private String travel_detail;
	private Date travel_start_date;
	private Date travel_end_date;
	private String travel_theme;
	private String book_name;
	private String share_check;
	private String pdf_file_name;
	
	public GuideBook() {}

	public GuideBook(String book_no, String book_id, Date book_change_date, String travel_detail,
			Date travel_start_date, Date travel_end_date, String travel_theme, String book_name, String share_check,
			String pdf_file_name) {
		super();
		this.book_no = book_no;
		this.book_id = book_id;
		this.book_change_date = book_change_date;
		this.travel_detail = travel_detail;
		this.travel_start_date = travel_start_date;
		this.travel_end_date = travel_end_date;
		this.travel_theme = travel_theme;
		this.book_name = book_name;
		this.share_check = share_check;
		this.pdf_file_name = pdf_file_name;
	}

	public String getBook_no() {
		return book_no;
	}

	public void setBook_no(String book_no) {
		this.book_no = book_no;
	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public Date getBook_change_date() {
		return book_change_date;
	}

	public void setBook_change_date(Date book_change_date) {
		this.book_change_date = book_change_date;
	}

	public String getTravel_detail() {
		return travel_detail;
	}

	public void setTravel_detail(String travel_detail) {
		this.travel_detail = travel_detail;
	}

	public Date getTravel_start_date() {
		return travel_start_date;
	}

	public void setTravel_start_date(Date travel_start_date) {
		this.travel_start_date = travel_start_date;
	}

	public Date getTravel_end_date() {
		return travel_end_date;
	}

	public void setTravel_end_date(Date travel_end_date) {
		this.travel_end_date = travel_end_date;
	}

	public String getTravel_theme() {
		return travel_theme;
	}

	public void setTravel_theme(String travel_theme) {
		this.travel_theme = travel_theme;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getShare_check() {
		return share_check;
	}

	public void setShare_check(String share_check) {
		this.share_check = share_check;
	}

	public String getPdf_file_name() {
		return pdf_file_name;
	}

	public void setPdf_file_name(String pdf_file_name) {
		this.pdf_file_name = pdf_file_name;
	}

	@Override
	public String toString() {
		return "Guidebook [book_no=" + book_no + ", book_id=" + book_id + ", book_change_date=" + book_change_date
				+ ", travel_detail=" + travel_detail + ", travel_start_date=" + travel_start_date + ", travel_end_date="
				+ travel_end_date + ", travel_theme=" + travel_theme + ", book_name=" + book_name + ", share_check="
				+ share_check + ", pdf_file_name=" + pdf_file_name + "]";
	}
	
}
