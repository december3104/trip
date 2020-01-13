package com.a2b.trip.guidematching.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MyGuideMatching implements Serializable {
	private static final long serialVersionUID = 8002L;
	
	private int gb_no;
	private String gb_id;
	private Date gb_start_date;
	private Date gb_end_date;
	private String gb_route;
	private int gb_price;
	private int gb_min_number;
	private int gb_max_number;
	private Date gb_open_date;
	private Date gb_close_date;
	private String gb_title;
	private int gb_number;
	private String gb_deadline_check;
	private String gm_id;
	private Date gm_date;
	private int gm_number;
	private String gb_alarm;
	private String gb_report;
	private String gm_report;
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
	private String member_secession;
	
	public MyGuideMatching() {}

	public MyGuideMatching(int gb_no, String gb_id, Date gb_start_date, Date gb_end_date, String gb_route, int gb_price,
			int gb_min_number, int gb_max_number, Date gb_open_date, Date gb_close_date, String gb_title, int gb_number,
			String gb_deadline_check, String gm_id, Date gm_date, int gm_number, String gb_alarm, String gb_report,
			String gm_report, String member_id, String member_name, String member_pwd, String member_email,
			String member_gender, String member_phone, String member_birth, String member_profile_original,
			String member_profile_rename, int member_report_count, String guide_qualification, int member_level,
			Date enroll_date, String guide_apply_alarm, String member_secession) {
		super();
		this.gb_no = gb_no;
		this.gb_id = gb_id;
		this.gb_start_date = gb_start_date;
		this.gb_end_date = gb_end_date;
		this.gb_route = gb_route;
		this.gb_price = gb_price;
		this.gb_min_number = gb_min_number;
		this.gb_max_number = gb_max_number;
		this.gb_open_date = gb_open_date;
		this.gb_close_date = gb_close_date;
		this.gb_title = gb_title;
		this.gb_number = gb_number;
		this.gb_deadline_check = gb_deadline_check;
		this.gm_id = gm_id;
		this.gm_date = gm_date;
		this.gm_number = gm_number;
		this.gb_alarm = gb_alarm;
		this.gb_report = gb_report;
		this.gm_report = gm_report;
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
		this.member_secession = member_secession;
	}

	public int getGb_no() {
		return gb_no;
	}

	public void setGb_no(int gb_no) {
		this.gb_no = gb_no;
	}

	public String getGb_id() {
		return gb_id;
	}

	public void setGb_id(String gb_id) {
		this.gb_id = gb_id;
	}

	public Date getGb_start_date() {
		return gb_start_date;
	}

	public void setGb_start_date(Date gb_start_date) {
		this.gb_start_date = gb_start_date;
	}

	public Date getGb_end_date() {
		return gb_end_date;
	}

	public void setGb_end_date(Date gb_end_date) {
		this.gb_end_date = gb_end_date;
	}

	public String getGb_route() {
		return gb_route;
	}

	public void setGb_route(String gb_route) {
		this.gb_route = gb_route;
	}

	public int getGb_price() {
		return gb_price;
	}

	public void setGb_price(int gb_price) {
		this.gb_price = gb_price;
	}

	public int getGb_min_number() {
		return gb_min_number;
	}

	public void setGb_min_number(int gb_min_number) {
		this.gb_min_number = gb_min_number;
	}

	public int getGb_max_number() {
		return gb_max_number;
	}

	public void setGb_max_number(int gb_max_number) {
		this.gb_max_number = gb_max_number;
	}

	public Date getGb_open_date() {
		return gb_open_date;
	}

	public void setGb_open_date(Date gb_open_date) {
		this.gb_open_date = gb_open_date;
	}

	public Date getGb_close_date() {
		return gb_close_date;
	}

	public void setGb_close_date(Date gb_close_date) {
		this.gb_close_date = gb_close_date;
	}

	public String getGb_title() {
		return gb_title;
	}

	public void setGb_title(String gb_title) {
		this.gb_title = gb_title;
	}

	public int getGb_number() {
		return gb_number;
	}

	public void setGb_number(int gb_number) {
		this.gb_number = gb_number;
	}

	public String getGb_deadline_check() {
		return gb_deadline_check;
	}

	public void setGb_deadline_check(String gb_deadline_check) {
		this.gb_deadline_check = gb_deadline_check;
	}

	public String getGm_id() {
		return gm_id;
	}

	public void setGm_id(String gm_id) {
		this.gm_id = gm_id;
	}

	public Date getGm_date() {
		return gm_date;
	}

	public void setGm_date(Date gm_date) {
		this.gm_date = gm_date;
	}

	public int getGm_number() {
		return gm_number;
	}

	public void setGm_number(int gm_number) {
		this.gm_number = gm_number;
	}

	public String getGb_alarm() {
		return gb_alarm;
	}

	public void setGb_alarm(String gb_alarm) {
		this.gb_alarm = gb_alarm;
	}

	public String getGb_report() {
		return gb_report;
	}

	public void setGb_report(String gb_report) {
		this.gb_report = gb_report;
	}

	public String getGm_report() {
		return gm_report;
	}

	public void setGm_report(String gm_report) {
		this.gm_report = gm_report;
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

	public String getMember_secession() {
		return member_secession;
	}

	public void setMember_secession(String member_secession) {
		this.member_secession = member_secession;
	}

	@Override
	public String toString() {
		return "MyGuideMatching [gb_no=" + gb_no + ", gb_id=" + gb_id + ", gb_start_date=" + gb_start_date
				+ ", gb_end_date=" + gb_end_date + ", gb_route=" + gb_route + ", gb_price=" + gb_price
				+ ", gb_min_number=" + gb_min_number + ", gb_max_number=" + gb_max_number + ", gb_open_date="
				+ gb_open_date + ", gb_close_date=" + gb_close_date + ", gb_title=" + gb_title + ", gb_number="
				+ gb_number + ", gb_deadline_check=" + gb_deadline_check + ", gm_id=" + gm_id + ", gm_date=" + gm_date
				+ ", gm_number=" + gm_number + ", gb_alarm=" + gb_alarm + ", gb_report=" + gb_report + ", gm_report="
				+ gm_report + ", member_id=" + member_id + ", member_name=" + member_name + ", member_pwd=" + member_pwd
				+ ", member_email=" + member_email + ", member_gender=" + member_gender + ", member_phone="
				+ member_phone + ", member_birth=" + member_birth + ", member_profile_original="
				+ member_profile_original + ", member_profile_rename=" + member_profile_rename
				+ ", member_report_count=" + member_report_count + ", guide_qualification=" + guide_qualification
				+ ", member_level=" + member_level + ", enroll_date=" + enroll_date + ", guide_apply_alarm="
				+ guide_apply_alarm + ", member_secession=" + member_secession + "]";
	}

	
}
