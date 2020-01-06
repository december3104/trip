package com.a2b.trip.fellow.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Fellow implements Serializable {
	private static final long serialVersionUID = 7002L;
	
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
	private String fm_id;
	private String fm_gender;
	private Date fm_date;
	private int fm_number;
	private String fm_accept_check;
	private String fm_content;
	private String fb_alarm;
	private String fm_alarm;
	
	private Fellow() {}

	public Fellow(int fb_no, String fb_id, String fb_title, String fb_content, Date fb_start_date, Date fb_end_date,
			String fb_contry, String fb_city, String fb_gender, Date fb_write_date, String fb_deadline_check,
			int fb_number, int fb_comp_number, String fm_id, String fm_gender, Date fm_date, int fm_number,
			String fm_accept_check, String fm_content, String fb_alarm, String fm_alarm) {
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
		this.fm_id = fm_id;
		this.fm_gender = fm_gender;
		this.fm_date = fm_date;
		this.fm_number = fm_number;
		this.fm_accept_check = fm_accept_check;
		this.fm_content = fm_content;
		this.fb_alarm = fb_alarm;
		this.fm_alarm = fm_alarm;
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

	public String getFm_id() {
		return fm_id;
	}

	public void setFm_id(String fm_id) {
		this.fm_id = fm_id;
	}

	public String getFm_gender() {
		return fm_gender;
	}

	public void setFm_gender(String fm_gender) {
		this.fm_gender = fm_gender;
	}

	public Date getFm_date() {
		return fm_date;
	}

	public void setFm_date(Date fm_date) {
		this.fm_date = fm_date;
	}

	public int getFm_number() {
		return fm_number;
	}

	public void setFm_number(int fm_number) {
		this.fm_number = fm_number;
	}

	public String getFm_accept_check() {
		return fm_accept_check;
	}

	public void setFm_accept_check(String fm_accept_check) {
		this.fm_accept_check = fm_accept_check;
	}

	public String getFm_content() {
		return fm_content;
	}

	public void setFm_content(String fm_content) {
		this.fm_content = fm_content;
	}

	public String getFb_alarm() {
		return fb_alarm;
	}

	public void setFb_alarm(String fb_alarm) {
		this.fb_alarm = fb_alarm;
	}

	public String getFm_alarm() {
		return fm_alarm;
	}

	public void setFm_alarm(String fm_alarm) {
		this.fm_alarm = fm_alarm;
	}

	@Override
	public String toString() {
		return "Fellow [fb_no=" + fb_no + ", fb_id=" + fb_id + ", fb_title=" + fb_title + ", fb_content=" + fb_content
				+ ", fb_start_date=" + fb_start_date + ", fb_end_date=" + fb_end_date + ", fb_contry=" + fb_contry
				+ ", fb_city=" + fb_city + ", fb_gender=" + fb_gender + ", fb_write_date=" + fb_write_date
				+ ", fb_deadline_check=" + fb_deadline_check + ", fb_number=" + fb_number + ", fb_comp_number="
				+ fb_comp_number + ", fm_id=" + fm_id + ", fm_gender=" + fm_gender + ", fm_date=" + fm_date
				+ ", fm_number=" + fm_number + ", fm_accept_check=" + fm_accept_check + ", fm_content=" + fm_content
				+ ", fb_alarm=" + fb_alarm + ", fm_alarm=" + fm_alarm + "]";
	}
	
	

}
