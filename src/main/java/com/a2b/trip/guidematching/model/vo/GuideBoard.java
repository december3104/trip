package com.a2b.trip.guidematching.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class GuideBoard implements Serializable {
	private static final long serialVersionUID = 8000L;
	
	private int gb_no;
	private String gb_id;
	private String gb_start_date;
	private String gb_end_date;
	private String gb_route;
	private int gb_price;
	private int gb_min_number;
	private int gb_max_number;
	private String gb_open_date;
	private String gb_close_date;
	private String gb_title;
	private int gb_number;
	private String gb_deadline_check;
	private String loc_code;
	private String member_gender;
	private String guide_lang;
	private double guide_grade;
	private String guide_profile_original;
	private String guide_profile_rename;
	private String member_name;
	private String guide_say;
	
	public GuideBoard() {}

	public GuideBoard(int gb_no, String gb_id, String gb_start_date, String gb_end_date, String gb_route, int gb_price,
			int gb_min_number, int gb_max_number, String gb_open_date, String gb_close_date, String gb_title,
			int gb_number, String gb_deadline_check, String loc_code, String member_gender, String guide_lang,
			double guide_grade, String guide_profile_original, String guide_profile_rename, String member_name,
			String guide_say) {
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
		this.loc_code = loc_code;
		this.member_gender = member_gender;
		this.guide_lang = guide_lang;
		this.guide_grade = guide_grade;
		this.guide_profile_original = guide_profile_original;
		this.guide_profile_rename = guide_profile_rename;
		this.member_name = member_name;
		this.guide_say = guide_say;
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

	public String getGb_start_date() {
		return gb_start_date;
	}

	public void setGb_start_date(String gb_start_date) {
		this.gb_start_date = gb_start_date;
	}

	public String getGb_end_date() {
		return gb_end_date;
	}

	public void setGb_end_date(String gb_end_date) {
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

	public String getGb_open_date() {
		return gb_open_date;
	}

	public void setGb_open_date(String gb_open_date) {
		this.gb_open_date = gb_open_date;
	}

	public String getGb_close_date() {
		return gb_close_date;
	}

	public void setGb_close_date(String gb_close_date) {
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

	public String getLoc_code() {
		return loc_code;
	}

	public void setLoc_code(String loc_code) {
		this.loc_code = loc_code;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public String getGuide_lang() {
		return guide_lang;
	}

	public void setGuide_lang(String guide_lang) {
		this.guide_lang = guide_lang;
	}

	public double getGuide_grade() {
		return guide_grade;
	}

	public void setGuide_grade(double guide_grade) {
		this.guide_grade = guide_grade;
	}

	public String getGuide_profile_original() {
		return guide_profile_original;
	}

	public void setGuide_profile_original(String guide_profile_original) {
		this.guide_profile_original = guide_profile_original;
	}

	public String getGuide_profile_rename() {
		return guide_profile_rename;
	}

	public void setGuide_profile_rename(String guide_profile_rename) {
		this.guide_profile_rename = guide_profile_rename;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getGuide_say() {
		return guide_say;
	}

	public void setGuide_say(String guide_say) {
		this.guide_say = guide_say;
	}

	@Override
	public String toString() {
		return "GuideBoard [gb_no=" + gb_no + ", gb_id=" + gb_id + ", gb_start_date=" + gb_start_date + ", gb_end_date="
				+ gb_end_date + ", gb_route=" + gb_route + ", gb_price=" + gb_price + ", gb_min_number=" + gb_min_number
				+ ", gb_max_number=" + gb_max_number + ", gb_open_date=" + gb_open_date + ", gb_close_date="
				+ gb_close_date + ", gb_title=" + gb_title + ", gb_number=" + gb_number + ", gb_deadline_check="
				+ gb_deadline_check + ", loc_code=" + loc_code + ", member_gender=" + member_gender + ", guide_lang="
				+ guide_lang + ", guide_grade=" + guide_grade + ", guide_profile_original=" + guide_profile_original
				+ ", guide_profile_rename=" + guide_profile_rename + ", member_name=" + member_name + ", guide_say="
				+ guide_say + "]";
	}

	
	
	

	

	
	

	
	
}
