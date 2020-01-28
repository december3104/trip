package com.a2b.trip.guide.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Guide implements Serializable {
	private static final long serialVersionUID = 2000L;
	
	private String guide_id;
	private String loc_code;
	private String guide_profile_original;
	private String guide_profile_rename;
	private String guide_lang;
	private String guide_introduce;
	private String guide_say;
	private int guide_count;
	private double guide_grade;
	private String guide_address;
	private String guide_contry;
	private String guide_service;
	private String guide_phone;
	private String car_check;
	private int car_number;
	private String guide_recommend;
	private String qualification_original;
	private String qualification_rename;
	private int guide_report_count;
	private String city_name;
	private String guide_telephone;
	private int price;
	private int grade_number;
	
	public Guide() {}

	public Guide(String guide_id, String loc_code, String guide_profile_original, String guide_profile_rename,
			String guide_lang, String guide_introduce, String guide_say, int guide_count, double guide_grade,
			String guide_address, String guide_contry, String guide_service, String guide_phone, String car_check,
			int car_number, String guide_recommend, String qualification_original, String qualification_rename,
			int guide_report_count, String city_name, String guide_telephone, int price, int grade_number) {
		super();
		this.guide_id = guide_id;
		this.loc_code = loc_code;
		this.guide_profile_original = guide_profile_original;
		this.guide_profile_rename = guide_profile_rename;
		this.guide_lang = guide_lang;
		this.guide_introduce = guide_introduce;
		this.guide_say = guide_say;
		this.guide_count = guide_count;
		this.guide_grade = guide_grade;
		this.guide_address = guide_address;
		this.guide_contry = guide_contry;
		this.guide_service = guide_service;
		this.guide_phone = guide_phone;
		this.car_check = car_check;
		this.car_number = car_number;
		this.guide_recommend = guide_recommend;
		this.qualification_original = qualification_original;
		this.qualification_rename = qualification_rename;
		this.guide_report_count = guide_report_count;
		this.city_name = city_name;
		this.guide_telephone = guide_telephone;
		this.price = price;
		this.grade_number = grade_number;
	}

	public String getGuide_id() {
		return guide_id;
	}

	public void setGuide_id(String guide_id) {
		this.guide_id = guide_id;
	}

	public String getLoc_code() {
		return loc_code;
	}

	public void setLoc_code(String loc_code) {
		this.loc_code = loc_code;
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

	public String getGuide_lang() {
		return guide_lang;
	}

	public void setGuide_lang(String guide_lang) {
		this.guide_lang = guide_lang;
	}

	public String getGuide_introduce() {
		return guide_introduce;
	}

	public void setGuide_introduce(String guide_introduce) {
		this.guide_introduce = guide_introduce;
	}

	public String getGuide_say() {
		return guide_say;
	}

	public void setGuide_say(String guide_say) {
		this.guide_say = guide_say;
	}

	public int getGuide_count() {
		return guide_count;
	}

	public void setGuide_count(int guide_count) {
		this.guide_count = guide_count;
	}

	public double getGuide_grade() {
		return guide_grade;
	}

	public void setGuide_grade(double guide_grade) {
		this.guide_grade = guide_grade;
	}

	public String getGuide_address() {
		return guide_address;
	}

	public void setGuide_address(String guide_address) {
		this.guide_address = guide_address;
	}

	public String getGuide_contry() {
		return guide_contry;
	}

	public void setGuide_contry(String guide_contry) {
		this.guide_contry = guide_contry;
	}

	public String getGuide_service() {
		return guide_service;
	}

	public void setGuide_service(String guide_service) {
		this.guide_service = guide_service;
	}

	public String getGuide_phone() {
		return guide_phone;
	}

	public void setGuide_phone(String guide_phone) {
		this.guide_phone = guide_phone;
	}

	public String getCar_check() {
		return car_check;
	}

	public void setCar_check(String car_check) {
		this.car_check = car_check;
	}

	public int getCar_number() {
		return car_number;
	}

	public void setCar_number(int car_number) {
		this.car_number = car_number;
	}

	public String getGuide_recommend() {
		return guide_recommend;
	}

	public void setGuide_recommend(String guide_recommend) {
		this.guide_recommend = guide_recommend;
	}

	public String getQualification_original() {
		return qualification_original;
	}

	public void setQualification_original(String qualification_original) {
		this.qualification_original = qualification_original;
	}

	public String getQualification_rename() {
		return qualification_rename;
	}

	public void setQualification_rename(String qualification_rename) {
		this.qualification_rename = qualification_rename;
	}

	public int getGuide_report_count() {
		return guide_report_count;
	}

	public void setGuide_report_count(int guide_report_count) {
		this.guide_report_count = guide_report_count;
	}

	public String getCity_name() {
		return city_name;
	}

	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}

	public String getGuide_telephone() {
		return guide_telephone;
	}

	public void setGuide_telephone(String guide_telephone) {
		this.guide_telephone = guide_telephone;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getGrade_number() {
		return grade_number;
	}

	public void setGrade_number(int grade_number) {
		this.grade_number = grade_number;
	}

	@Override
	public String toString() {
		return "Guide [guide_id=" + guide_id + ", loc_code=" + loc_code + ", guide_profile_original="
				+ guide_profile_original + ", guide_profile_rename=" + guide_profile_rename + ", guide_lang="
				+ guide_lang + ", guide_introduce=" + guide_introduce + ", guide_say=" + guide_say + ", guide_count="
				+ guide_count + ", guide_grade=" + guide_grade + ", guide_address=" + guide_address + ", guide_contry="
				+ guide_contry + ", guide_service=" + guide_service + ", guide_phone=" + guide_phone + ", car_check="
				+ car_check + ", car_number=" + car_number + ", guide_recommend=" + guide_recommend
				+ ", qualification_original=" + qualification_original + ", qualification_rename="
				+ qualification_rename + ", guide_report_count=" + guide_report_count + ", city_name=" + city_name
				+ ", guide_telephone=" + guide_telephone + ", price=" + price + ", grade_number=" + grade_number + "]";
	}

	
}
