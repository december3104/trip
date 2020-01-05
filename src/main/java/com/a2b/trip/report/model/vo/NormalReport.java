package com.a2b.trip.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class NormalReport implements Serializable{
	private static final long serialVersionUID =  6222L;
	
	private String member_name;
	private int report_no;
	private String clame_id;
	private String report_id;
	private String report_content;
	private String report_status;
	private Date report_date;
	private Date complete_date;
	private String report_type;
	// 성별 , 아메일 ,  누적신고
	private String member_gender;
	private String member_email;
	private String member_report_count;
	
	public NormalReport() {}

	public NormalReport(String member_name, int report_no, String clame_id, String report_id, String report_content,
			String report_status, Date report_date, Date complete_date, String report_type, String member_gender,
			String member_email, String member_report_count) {
		super();
		this.member_name = member_name;
		this.report_no = report_no;
		this.clame_id = clame_id;
		this.report_id = report_id;
		this.report_content = report_content;
		this.report_status = report_status;
		this.report_date = report_date;
		this.complete_date = complete_date;
		this.report_type = report_type;
		this.member_gender = member_gender;
		this.member_email = member_email;
		this.member_report_count = member_report_count;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getClame_id() {
		return clame_id;
	}

	public void setClame_id(String clame_id) {
		this.clame_id = clame_id;
	}

	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_status() {
		return report_status;
	}

	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public Date getComplete_date() {
		return complete_date;
	}

	public void setComplete_date(Date complete_date) {
		this.complete_date = complete_date;
	}

	public String getReport_type() {
		return report_type;
	}

	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_report_count() {
		return member_report_count;
	}

	public void setMember_report_count(String member_report_count) {
		this.member_report_count = member_report_count;
	}


	@Override
	public String toString() {
		return "NormalReport [member_name=" + member_name + ", report_no=" + report_no + ", clame_id=" + clame_id
				+ ", report_id=" + report_id + ", report_content=" + report_content + ", report_status=" + report_status
				+ ", report_date=" + report_date + ", complete_date=" + complete_date + ", report_type=" + report_type
				+ ", member_gender=" + member_gender + ", member_email=" + member_email + ", member_report_count="
				+ member_report_count + "]";
	}



	
	
	

}
