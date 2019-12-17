package com.a2b.trip.fellowboard.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class FellowBoard implements Serializable {
	private static final long serialVersionUID = 7000L;
	
	private int fb_no;
	private String fb_id;
	private String fb_title;
	private String fb_content;
	private Date fb_start_date;
	private Date fb_end_date;
	private String fb_contry;
	private String fb_city;
	private String fb_gender;
	private Date fb_write_date;
	private String fb_deadline_check;
	private int fb_number;
	private int fb_comp_number;

	public FellowBoard() {}

	public FellowBoard(int fb_no, String fb_id, String fb_title, String fb_content, Date fb_start_date,
			Date fb_end_date, String fb_contry, String fb_city, String fb_gender, Date fb_write_date,
			String fb_deadline_check, int fb_number, int fb_comp_number) {
		super();
		this.fb_no = fb_no;
		this.fb_id = fb_id;
		this.fb_title = fb_title;
		this.fb_content = fb_content;
		this.fb_start_date = fb_start_date;
		this.fb_end_date = fb_end_date;
		this.fb_contry = fb_contry;
		this.fb_city = fb_city;
		this.fb_gender = fb_gender;
		this.fb_write_date = fb_write_date;
		this.fb_deadline_check = fb_deadline_check;
		this.fb_number = fb_number;
		this.fb_comp_number = fb_comp_number;
	}

	public int getFb_no() {
		return fb_no;
	}

	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}

	public String getFb_id() {
		return fb_id;
	}

	public void setFb_id(String fb_id) {
		this.fb_id = fb_id;
	}

	public String getFb_title() {
		return fb_title;
	}

	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}

	public String getFb_content() {
		return fb_content;
	}

	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}

	public Date getFb_start_date() {
		return fb_start_date;
	}

	public void setFb_start_date(Date fb_start_date) {
		this.fb_start_date = fb_start_date;
	}

	public Date getFb_end_date() {
		return fb_end_date;
	}

	public void setFb_end_date(Date fb_end_date) {
		this.fb_end_date = fb_end_date;
	}

	public String getFb_contry() {
		return fb_contry;
	}

	public void setFb_contry(String fb_contry) {
		this.fb_contry = fb_contry;
	}

	public String getFb_city() {
		return fb_city;
	}

	public void setFb_city(String fb_city) {
		this.fb_city = fb_city;
	}

	public String getFb_gender() {
		return fb_gender;
	}

	public void setFb_gender(String fb_gender) {
		this.fb_gender = fb_gender;
	}

	public Date getFb_write_date() {
		return fb_write_date;
	}

	public void setFb_write_date(Date fb_write_date) {
		this.fb_write_date = fb_write_date;
	}

	public String getFb_deadline_check() {
		return fb_deadline_check;
	}

	public void setFb_deadline_check(String fb_deadline_check) {
		this.fb_deadline_check = fb_deadline_check;
	}

	public int getFb_number() {
		return fb_number;
	}

	public void setFb_number(int fb_number) {
		this.fb_number = fb_number;
	}

	public int getFb_comp_number() {
		return fb_comp_number;
	}

	public void setFb_comp_number(int fb_comp_number) {
		this.fb_comp_number = fb_comp_number;
	}

	@Override
	public String toString() {
		return "FellowBoard [fb_no=" + fb_no + ", fb_id=" + fb_id + ", fb_title=" + fb_title + ", fb_content="
				+ fb_content + ", fb_start_date=" + fb_start_date + ", fb_end_date=" + fb_end_date + ", fb_contry="
				+ fb_contry + ", fb_city=" + fb_city + ", fb_gender=" + fb_gender + ", fb_write_date=" + fb_write_date
				+ ", fb_deadline_check=" + fb_deadline_check + ", fb_number=" + fb_number + ", fb_comp_number="
				+ fb_comp_number + "]";
	}
	
}
