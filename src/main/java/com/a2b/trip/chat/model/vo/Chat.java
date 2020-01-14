package com.a2b.trip.chat.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Chat implements Serializable{
	private static final long serialVersionUID = 16020L;
	
	private int cc_no;
	private int cc_cr_no;
	private String cc_id;
	private Date cc_date;
	private String cc_content;
	private int cc_count;
	private int cr_no;
	private String cm_id;
	private Date cm_date;
	private String cm_login;
	private int cm_new;
	private String cr_title;
	private String cr_contry;
	private String cr_city;
	private int cr_number;
	private Date cr_date;
	private String cr_type;
	private String cr_master;
	
	public Chat() {}
	
	public Chat(int cc_no, int cc_cr_no, String cc_id, Date cc_date, String cc_content, int cc_count, int cr_no,
			String cm_id, Date cm_date, String cm_login, int cm_new, String cr_title, String cr_contry, String cr_city,
			int cr_number, Date cr_date, String cr_type, String cr_master) {
		super();
		this.cc_no = cc_no;
		this.cc_cr_no = cc_cr_no;
		this.cc_id = cc_id;
		this.cc_date = cc_date;
		this.cc_content = cc_content;
		this.cc_count = cc_count;
		this.cr_no = cr_no;
		this.cm_id = cm_id;
		this.cm_date = cm_date;
		this.cm_login = cm_login;
		this.cm_new = cm_new;
		this.cr_title = cr_title;
		this.cr_contry = cr_contry;
		this.cr_city = cr_city;
		this.cr_number = cr_number;
		this.cr_date = cr_date;
		this.cr_type = cr_type;
		this.cr_master = cr_master;
	}

	public int getCc_no() {
		return cc_no;
	}

	public void setCc_no(int cc_no) {
		this.cc_no = cc_no;
	}

	public int getCc_cr_no() {
		return cc_cr_no;
	}

	public void setCc_cr_no(int cc_cr_no) {
		this.cc_cr_no = cc_cr_no;
	}

	public String getCc_id() {
		return cc_id;
	}

	public void setCc_id(String cc_id) {
		this.cc_id = cc_id;
	}

	public Date getCc_date() {
		return cc_date;
	}

	public void setCc_date(Date cc_date) {
		this.cc_date = cc_date;
	}

	public String getCc_content() {
		return cc_content;
	}

	public void setCc_content(String cc_content) {
		this.cc_content = cc_content;
	}

	public int getCc_count() {
		return cc_count;
	}

	public void setCc_count(int cc_count) {
		this.cc_count = cc_count;
	}

	public int getCr_no() {
		return cr_no;
	}

	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}

	public String getCm_id() {
		return cm_id;
	}

	public void setCm_id(String cm_id) {
		this.cm_id = cm_id;
	}

	public Date getCm_date() {
		return cm_date;
	}

	public void setCm_date(Date cm_date) {
		this.cm_date = cm_date;
	}

	public String getCm_login() {
		return cm_login;
	}

	public void setCm_login(String cm_login) {
		this.cm_login = cm_login;
	}

	public int getCm_new() {
		return cm_new;
	}

	public void setCm_new(int cm_new) {
		this.cm_new = cm_new;
	}

	public String getCr_title() {
		return cr_title;
	}

	public void setCr_title(String cr_title) {
		this.cr_title = cr_title;
	}

	public String getCr_contry() {
		return cr_contry;
	}

	public void setCr_contry(String cr_contry) {
		this.cr_contry = cr_contry;
	}

	public String getCr_city() {
		return cr_city;
	}

	public void setCr_city(String cr_city) {
		this.cr_city = cr_city;
	}

	public int getCr_number() {
		return cr_number;
	}

	public void setCr_number(int cr_number) {
		this.cr_number = cr_number;
	}

	public Date getCr_date() {
		return cr_date;
	}

	public void setCr_date(Date cr_date) {
		this.cr_date = cr_date;
	}

	public String getCr_type() {
		return cr_type;
	}

	public void setCr_type(String cr_type) {
		this.cr_type = cr_type;
	}

	public String getCr_master() {
		return cr_master;
	}

	public void setCr_master(String cr_master) {
		this.cr_master = cr_master;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Chat [cc_no=" + cc_no + ", cc_cr_no=" + cc_cr_no + ", cc_id=" + cc_id + ", cc_date=" + cc_date
				+ ", cc_content=" + cc_content + ", cc_count=" + cc_count + ", cr_no=" + cr_no + ", cm_id=" + cm_id
				+ ", cm_date=" + cm_date + ", cm_login=" + cm_login + ", cm_new=" + cm_new + ", cr_title=" + cr_title
				+ ", cr_contry=" + cr_contry + ", cr_city=" + cr_city + ", cr_number=" + cr_number + ", cr_date="
				+ cr_date + ", cr_type=" + cr_type + ", cr_master=" + cr_master + "]";
	}
	
}
