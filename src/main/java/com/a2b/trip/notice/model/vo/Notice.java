package com.a2b.trip.notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Notice implements Serializable {
	private static final long serialVersionUID = 4000L;
	
	private int notice_no;
	private String notice_id;
	private Date notice_date;
	private String notice_title;
	private int notice_view_count;
	private String notice_file_origin;
	private String notice_file_rename;
	private String notice_content;

	public Notice() {}

	public Notice(int notice_no, String notice_id, Date notice_date, String notice_title, int notice_view_count,
			String notice_file_origin, String notice_file_rename, String notice_content) {
		super();
		this.notice_no = notice_no;
		this.notice_id = notice_id;
		this.notice_date = notice_date;
		this.notice_title = notice_title;
		this.notice_view_count = notice_view_count;
		this.notice_file_origin = notice_file_origin;
		this.notice_file_rename = notice_file_rename;
		this.notice_content = notice_content;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public String getNotice_id() {
		return notice_id;
	}

	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public int getNotice_view_count() {
		return notice_view_count;
	}

	public void setNotice_view_count(int notice_view_count) {
		this.notice_view_count = notice_view_count;
	}

	public String getNotice_file_origin() {
		return notice_file_origin;
	}

	public void setNotice_file_origin(String notice_file_origin) {
		this.notice_file_origin = notice_file_origin;
	}

	public String getNotice_file_rename() {
		return notice_file_rename;
	}

	public void setNotice_file_rename(String notice_file_rename) {
		this.notice_file_rename = notice_file_rename;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_id=" + notice_id + ", notice_title=" + notice_title
				+ ", notice_view_count=" + notice_view_count + ", notice_file_origin=" + notice_file_origin
				+ ", notice_file_rename=" + notice_file_rename + ", notice_content=" + notice_content + "]";
	}
	
	
}
