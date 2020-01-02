package com.a2b.trip.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Member implements Serializable {
	private static final long serialVersionUID = 1000L;
	
	private String member_id;
	private String member_name;
	private String member_pwd;
	private String member_email;
	private String member_gender;
	private String member_phone;
	private String member_birth;
	private String member_profile_original;
	private String member_profile_rename;
	private int member_report_count;
	private String guide_qualification;
	private int member_level;
	private Date enroll_date;
	private String guide_apply_alarm;

	public Member() {}

	public Member(String member_id, String member_name, String member_pwd, String member_email, String member_gender,
			String member_phone, String member_birth, String member_profile_original, String member_profile_rename,
			int member_report_count, String guide_qualification, int member_level, Date enroll_date,
			String guide_apply_alarm) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_pwd = member_pwd;
		this.member_email = member_email;
		this.member_gender = member_gender;
		this.member_phone = member_phone;
		this.member_birth = member_birth;
		this.member_profile_original = member_profile_original;
		this.member_profile_rename = member_profile_rename;
		this.member_report_count = member_report_count;
		this.guide_qualification = guide_qualification;
		this.member_level = member_level;
		this.enroll_date = enroll_date;
		this.guide_apply_alarm = guide_apply_alarm;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_pwd() {
		return member_pwd;
	}

	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_profile_original() {
		return member_profile_original;
	}

	public void setMember_profile_original(String member_profile_original) {
		this.member_profile_original = member_profile_original;
	}

	public String getMember_profile_rename() {
		return member_profile_rename;
	}

	public void setMember_profile_rename(String member_profile_rename) {
		this.member_profile_rename = member_profile_rename;
	}

	public int getMember_report_count() {
		return member_report_count;
	}

	public void setMember_report_count(int member_report_count) {
		this.member_report_count = member_report_count;
	}

	public String getGuide_qualification() {
		return guide_qualification;
	}

	public void setGuide_qualification(String guide_qualification) {
		this.guide_qualification = guide_qualification;
	}

	public int getMember_level() {
		return member_level;
	}

	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}

	public String getGuide_apply_alarm() {
		return guide_apply_alarm;
	}

	public void setGuide_apply_alarm(String guide_apply_alarm) {
		this.guide_apply_alarm = guide_apply_alarm;
	}

	@Override
	public String toString() {
		return "Member [member_id=" + member_id + ", member_name=" + member_name + ", member_pwd=" + member_pwd
				+ ", member_email=" + member_email + ", member_gender=" + member_gender + ", member_phone="
				+ member_phone + ", member_birth=" + member_birth + ", member_profile_original="
				+ member_profile_original + ", member_profile_rename=" + member_profile_rename
				+ ", member_report_count=" + member_report_count + ", guide_qualification=" + guide_qualification
				+ ", member_level=" + member_level + ", enroll_date=" + enroll_date + ", guide_apply_alarm="
				+ guide_apply_alarm + "]";
	}
	
	
}
