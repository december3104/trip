package com.a2b.trip.qna.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class QnaComment implements Serializable {
	private static final long serialVersionUID = 5001L;
	
	private int qna_no;
	private String qc_id;
	private String qc_content;
	private Date qc_date;
	private String member_profile_rename;

	public QnaComment() {}

	public QnaComment(int qna_no, String qc_id, String qc_content, Date qc_date, String member_profile_rename) {
		super();
		this.qna_no = qna_no;
		this.qc_id = qc_id;
		this.qc_content = qc_content;
		this.qc_date = qc_date;
		this.member_profile_rename = member_profile_rename;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}

	public String getQc_id() {
		return qc_id;
	}

	public void setQc_id(String qc_id) {
		this.qc_id = qc_id;
	}

	public String getQc_content() {
		return qc_content;
	}

	public void setQc_content(String qc_content) {
		this.qc_content = qc_content;
	}

	public Date getQc_date() {
		return qc_date;
	}

	public void setQc_date(Date qc_date) {
		this.qc_date = qc_date;
	}

	public String getMember_profile_rename() {
		return member_profile_rename;
	}

	public void setMember_profile_rename(String member_profile_rename) {
		this.member_profile_rename = member_profile_rename;
	}

	@Override
	public String toString() {
		return "QnaComment [qna_no=" + qna_no + ", qc_id=" + qc_id + ", qc_content=" + qc_content + ", qc_date="
				+ qc_date + ", member_profile_rename=" + member_profile_rename + "]";
	}

	
	
}
