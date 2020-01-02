package com.a2b.trip.guide.model.vo;

import java.io.Serializable;

public class GuideDetail implements Serializable{
	private static final long serialVersionUID = 2444L;
	
//	활동국가/지역 loc + guide contry
	private String loc_name;
//	가이드 가능지역 loc
	private String guide_contry;
//	현 거주지 주소
	private String guide_address;			//현 거주지
//	가능 서비스
	private String guide_service;			//가능서비스
//	사용 가능 언어
	private String guide_lang;				//사용가능 언어
//	이름 member
	private String member_name;
//	성별 member
	private String member_gender;
//	출생년도 member
	private String member_birth;
//	국적 컬럼을 추가할까...뺄까...흠.... 중요한 정보는 아닌데..
//	휴대전화
	private String guide_phone;				//전화번호
//	이메일 member
//	본인차량 및 인승여부	
	private String car_check;				//차량여부
	private int car_number;					//차량수용인원수
	private String guide_qualification;
//------------------------------------------------------------
	
	public GuideDetail() {}
	
	
	public GuideDetail(String loc_name, String guide_contry, String guide_address, String guide_service, String guide_lang,
			String member_name, String member_gender, String member_birth, String guide_phone, String car_check,
			int car_number, String guide_qualification) {
		super();
		this.loc_name = loc_name;
		this.guide_contry = guide_contry;
		this.guide_address = guide_address;
		this.guide_service = guide_service;
		this.guide_lang = guide_lang;
		this.member_name = member_name;
		this.member_gender = member_gender;
		this.member_birth = member_birth;
		this.guide_phone = guide_phone;
		this.car_check = car_check;
		this.car_number = car_number;
		this.guide_qualification = guide_qualification;
	}
	public String getLoc_name() {
		return loc_name;
	}
	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}
	public String getGuide_contry() {
		return guide_contry;
	}
	public void setGuide_contry(String guide_contry) {
		this.guide_contry = guide_contry;
	}
	public String getGuide_address() {
		return guide_address;
	}
	public void setGuide_address(String guide_address) {
		this.guide_address = guide_address;
	}
	public String getGuide_service() {
		return guide_service;
	}
	public void setGuide_service(String guide_service) {
		this.guide_service = guide_service;
	}
	public String getGuide_lang() {
		return guide_lang;
	}
	public void setGuide_lang(String guide_lang) {
		this.guide_lang = guide_lang;
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
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
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
	public String getGuide_qualification() {
		return guide_qualification;
	}
	public void setGuide_qualification(String guide_qualification) {
		this.guide_qualification = guide_qualification;
	}
	@Override
	public String toString() {
		return "GuideDetail [loc_name=" + loc_name + ", guide_contry=" + guide_contry + ", guide_address=" + guide_address
				+ ", guide_service=" + guide_service + ", guide_lang=" + guide_lang + ", member_name=" + member_name
				+ ", member_gender=" + member_gender + ", member_birth=" + member_birth + ", guide_phone=" + guide_phone
				+ ", car_check=" + car_check + ", car_number=" + car_number + ", guide_qualification=" + guide_qualification
				+ "]";
	}

		
	
	
}
