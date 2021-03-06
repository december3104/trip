package com.a2b.trip.qna.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Qna implements Serializable {
	private static final long serialVersionUID = 5000L;
	
	private int qna_no;
	private String qna_id;
	private String qna_title;
	private String qna_content;
	private Date qna_date;
	private String qna_comment;
	private String qna_alarm;
	private String member_name;
	private String member_gender;
	private String member_profile_rename;

	public Qna() {}

	public Qna(int qna_no, String qna_id, String qna_title, String qna_content, Date qna_date, String qna_comment,
			String qna_alarm, String member_name, String member_gender, String member_profile_rename) {
		super();
		this.qna_no = qna_no;
		this.qna_id = qna_id;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_date = qna_date;
		this.qna_comment = qna_comment;
		this.qna_alarm = qna_alarm;
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_profile_rename = member_profile_rename;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQna_id() {
		return qna_id;
	}

	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public String getQna_comment() {
		return qna_comment;
	}

	public void setQna_comment(String qna_comment) {
		this.qna_comment = qna_comment;
	}

	public String getQna_alarm() {
		return qna_alarm;
	}

	public void setQna_alarm(String qna_alarm) {
		this.qna_alarm = qna_alarm;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_profile_rename() {
		return member_profile_rename;
	}

	public void setMember_profile_rename(String member_profile_rename) {
		this.member_profile_rename = member_profile_rename;
	}

	@Override
	public String toString() {
		return "Qna [qna_no=" + qna_no + ", qna_id=" + qna_id + ", qna_title=" + qna_title + ", qna_content="
				+ qna_content + ", qna_date=" + qna_date + ", qna_comment=" + qna_comment + ", qna_alarm=" + qna_alarm
				+ ", member_name=" + member_name + ", member_gender=" + member_gender + ", member_profile_rename="
				+ member_profile_rename + "]";
	}
	
}
