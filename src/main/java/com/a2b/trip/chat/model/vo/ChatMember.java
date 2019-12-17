package com.a2b.trip.chat.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ChatMember implements Serializable {
	private static final long serialVersionUID = 15000L;
	
	private int cr_no;
	private String cm_id;
	private Date cm_date;
	private String cm_login;
	private int cm_new;
	
	public ChatMember() {}

	public ChatMember(int cr_no, String cm_id, Date cm_date, String cm_login, int cm_new) {
		super();
		this.cr_no = cr_no;
		this.cm_id = cm_id;
		this.cm_date = cm_date;
		this.cm_login = cm_login;
		this.cm_new = cm_new;
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

	@Override
	public String toString() {
		return "Chatmember [cr_no=" + cr_no + ", cm_id=" + cm_id + ", cm_date=" + cm_date + ", cm_login=" + cm_login
				+ ", cm_new=" + cm_new + "]";
	}
	
}
