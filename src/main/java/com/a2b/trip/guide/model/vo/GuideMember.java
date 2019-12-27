package com.a2b.trip.guide.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class GuideMember implements Serializable{
	private static final long serialVersionUID = 2222L;
	
	private String member_name;
	private String member_id;
	private String member_gender;
	private String member_email;
	private double guide_grade;
	private int guide_report_count;
	
	
	public GuideMember() {}

	public GuideMember(String member_name, String member_id, String member_gender, String member_email,
			double guide_grade, int guide_report_count) {
		super();
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_gender = member_gender;
		this.member_email = member_email;
		this.guide_grade = guide_grade;
		this.guide_report_count = guide_report_count;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public double getGuide_grade() {
		return guide_grade;
	}

	public void setGuide_grade(double guide_grade) {
		this.guide_grade = guide_grade;
	}

	public int getGuide_report_count() {
		return guide_report_count;
	}

	public void setGuide_report_count(int guide_report_count) {
		this.guide_report_count = guide_report_count;
	}


	@Override
	public String toString() {
		return "GuideMember [member_name=" + member_name + ", member_id=" + member_id + ", member_gender="
				+ member_gender + ", member_email=" + member_email + ", guide_grade=" + guide_grade
				+ ", guide_report_count=" + guide_report_count + "]";
	}
	
	
	

	
}
