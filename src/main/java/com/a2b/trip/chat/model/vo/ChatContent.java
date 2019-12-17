package com.a2b.trip.chat.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ChatContent implements Serializable {
	private static final long serialVersionUID = 16000L;
	
	private int cc_no;
	private int cc_cr_no;
	private String cc_id;
	private Date cc_date;
	private String cc_content;
	private int cc_count;
	
	public ChatContent() {}

	public ChatContent(int cc_no, int cc_cr_no, String cc_id, Date cc_date, String cc_content, int cc_count) {
		super();
		this.cc_no = cc_no;
		this.cc_cr_no = cc_cr_no;
		this.cc_id = cc_id;
		this.cc_date = cc_date;
		this.cc_content = cc_content;
		this.cc_count = cc_count;
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

	@Override
	public String toString() {
		return "Chatcontent [cc_no=" + cc_no + ", cc_cr_no=" + cc_cr_no + ", cc_id=" + cc_id + ", cc_date=" + cc_date
				+ ", cc_content=" + cc_content + ", cc_count=" + cc_count + "]";
	}
	
}
