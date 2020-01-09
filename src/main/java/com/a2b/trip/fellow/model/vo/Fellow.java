package com.a2b.trip.fellow.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Fellow implements Serializable {
	private static final long serialVersionUID = 7002L;
	
	private int fb_no;
	private String fb_id;
	private String fb_title;
	private String fb_content;
	private Date fb_start_date;
	private Date fb_end_date;
	private String fb_contry;
	private String fb_city;
	private String fb_gender;
	private Date fb_write_date;
	private String fb_deadline_check;
	private String fb_report;
	private String fm_report;
	private String fm_id;
	private String fm_gender;
	private Date fm_date;
	private int fm_number;
	private String fm_accept_check;
	private Date fm_accept_date;
	private String fm_content;
	private String fb_alarm;
	private String fm_alarm;
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
	
	public Fellow() {}

	public Fellow(int fb_no, String fb_id, String fb_title, String fb_content, Date fb_start_date, Date fb_end_date,
			String fb_contry, String fb_city, String fb_gender, Date fb_write_date, String fb_deadline_check,
			String fb_report, String fm_report, String fm_id, String fm_gender, Date fm_date, int fm_number,
			String fm_accept_check, Date fm_accept_date, String fm_content, String fb_alarm, String fm_alarm,
			String member_id, String member_name, String member_pwd, String member_email, String member_gender,
			String member_phone, String member_birth, String member_profile_original, String member_profile_rename,
			int member_report_count, String guide_qualification, int member_level, Date enroll_date,
			String guide_apply_alarm) {
		super();
		this.fb_no = fb_no;
		this.fb_id = fb_id;
		this.fb_title = fb_title;
		this.fb_content = fb_content;
		this.fb_start_date = fb_start_date;
		this.fb_end_date = fb_end_date;
		this.fb_contry = fb_contry;
		this.fb_city = fb_city;
		this.fb_gender = fb_gender;
		this.fb_write_date = fb_write_date;
		this.fb_deadline_check = fb_deadline_check;
		this.fb_report = fb_report;
		this.fm_report = fm_report;
		this.fm_id = fm_id;
		this.fm_gender = fm_gender;
		this.fm_date = fm_date;
		this.fm_number = fm_number;
		this.fm_accept_check = fm_accept_check;
		this.fm_accept_date = fm_accept_date;
		this.fm_content = fm_content;
		this.fb_alarm = fb_alarm;
		this.fm_alarm = fm_alarm;
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

	public int getFb_no() {
		return fb_no;
	}

	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}

	public String getFb_id() {
		return fb_id;
	}

	public void setFb_id(String fb_id) {
		this.fb_id = fb_id;
	}

	public String getFb_title() {
		return fb_title;
	}

	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}

	public String getFb_content() {
		return fb_content;
	}

	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}

	public Date getFb_start_date() {
		return fb_start_date;
	}

	public void setFb_start_date(Date fb_start_date) {
		this.fb_start_date = fb_start_date;
	}

	public Date getFb_end_date() {
		return fb_end_date;
	}

	public void setFb_end_date(Date fb_end_date) {
		this.fb_end_date = fb_end_date;
	}

	public String getFb_contry() {
		return fb_contry;
	}

	public void setFb_contry(String fb_contry) {
		this.fb_contry = fb_contry;
	}

	public String getFb_city() {
		return fb_city;
	}

	public void setFb_city(String fb_city) {
		this.fb_city = fb_city;
	}

	public String getFb_gender() {
		return fb_gender;
	}

	public void setFb_gender(String fb_gender) {
		this.fb_gender = fb_gender;
	}

	public Date getFb_write_date() {
		return fb_write_date;
	}

	public void setFb_write_date(Date fb_write_date) {
		this.fb_write_date = fb_write_date;
	}

	public String getFb_deadline_check() {
		return fb_deadline_check;
	}

	public void setFb_deadline_check(String fb_deadline_check) {
		this.fb_deadline_check = fb_deadline_check;
	}

	public String getFb_report() {
		return fb_report;
	}

	public void setFb_report(String fb_report) {
		this.fb_report = fb_report;
	}

	public String getFm_report() {
		return fm_report;
	}

	public void setFm_report(String fm_report) {
		this.fm_report = fm_report;
	}

	public String getFm_id() {
		return fm_id;
	}

	public void setFm_id(String fm_id) {
		this.fm_id = fm_id;
	}

	public String getFm_gender() {
		return fm_gender;
	}

	public void setFm_gender(String fm_gender) {
		this.fm_gender = fm_gender;
	}

	public Date getFm_date() {
		return fm_date;
	}

	public void setFm_date(Date fm_date) {
		this.fm_date = fm_date;
	}

	public int getFm_number() {
		return fm_number;
	}

	public void setFm_number(int fm_number) {
		this.fm_number = fm_number;
	}

	public String getFm_accept_check() {
		return fm_accept_check;
	}

	public void setFm_accept_check(String fm_accept_check) {
		this.fm_accept_check = fm_accept_check;
	}

	public Date getFm_accept_date() {
		return fm_accept_date;
	}

	public void setFm_accept_date(Date fm_accept_date) {
		this.fm_accept_date = fm_accept_date;
	}

	public String getFm_content() {
		return fm_content;
	}

	public void setFm_content(String fm_content) {
		this.fm_content = fm_content;
	}

	public String getFb_alarm() {
		return fb_alarm;
	}

	public void setFb_alarm(String fb_alarm) {
		this.fb_alarm = fb_alarm;
	}

	public String getFm_alarm() {
		return fm_alarm;
	}

	public void setFm_alarm(String fm_alarm) {
		this.fm_alarm = fm_alarm;
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
		return "Fellow [fb_no=" + fb_no + ", fb_id=" + fb_id + ", fb_title=" + fb_title + ", fb_content=" + fb_content
				+ ", fb_start_date=" + fb_start_date + ", fb_end_date=" + fb_end_date + ", fb_contry=" + fb_contry
				+ ", fb_city=" + fb_city + ", fb_gender=" + fb_gender + ", fb_write_date=" + fb_write_date
				+ ", fb_deadline_check=" + fb_deadline_check + ", fb_report=" + fb_report + ", fm_report=" + fm_report
				+ ", fm_id=" + fm_id + ", fm_gender=" + fm_gender + ", fm_date=" + fm_date + ", fm_number=" + fm_number
				+ ", fm_accept_check=" + fm_accept_check + ", fm_accept_date=" + fm_accept_date + ", fm_content="
				+ fm_content + ", fb_alarm=" + fb_alarm + ", fm_alarm=" + fm_alarm + ", member_id=" + member_id
				+ ", member_name=" + member_name + ", member_pwd=" + member_pwd + ", member_email=" + member_email
				+ ", member_gender=" + member_gender + ", member_phone=" + member_phone + ", member_birth="
				+ member_birth + ", member_profile_original=" + member_profile_original + ", member_profile_rename="
				+ member_profile_rename + ", member_report_count=" + member_report_count + ", guide_qualification="
				+ guide_qualification + ", member_level=" + member_level + ", enroll_date=" + enroll_date
				+ ", guide_apply_alarm=" + guide_apply_alarm + "]";
	}

}
