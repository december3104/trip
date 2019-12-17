package com.a2b.trip.chat.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ChatRoom implements Serializable {
	private static final long serialVersionUID = 14000L;
	
	private int cr_no;
	private String cr_title;
	private String cr_contry;
	private String cr_city;
	private int cr_number;
	private Date cr_date;
	private String cr_type;
	private String cr_master;
	
	public ChatRoom() {}

	public ChatRoom(int cr_no, String cr_title, String cr_contry, String cr_city, int cr_number, Date cr_date,
			String cr_type, String cr_master) {
		super();
		this.cr_no = cr_no;
		this.cr_title = cr_title;
		this.cr_contry = cr_contry;
		this.cr_city = cr_city;
		this.cr_number = cr_number;
		this.cr_date = cr_date;
		this.cr_type = cr_type;
		this.cr_master = cr_master;
	}

	public int getCr_no() {
		return cr_no;
	}

	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
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

	@Override
	public String toString() {
		return "Chatroom [cr_no=" + cr_no + ", cr_title=" + cr_title + ", cr_contry=" + cr_contry + ", cr_city="
				+ cr_city + ", cr_number=" + cr_number + ", cr_date=" + cr_date + ", cr_type=" + cr_type
				+ ", cr_master=" + cr_master + "]";
	}
	
}
