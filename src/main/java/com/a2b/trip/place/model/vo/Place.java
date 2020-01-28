package com.a2b.trip.place.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Place implements Serializable {
	private static final long serialVersionUID = 9000L;
	
	private String place_code;
	private String place_id;
	private String place_user;	
	private String place_name;
	private String place_address;
	private String place_phone;
	private String opening_time;
	private Date place_date;
	private String place_geo;	
	
	public Place() {}

	public Place(String place_code, String place_id, String place_user, String place_name, String place_address,
			String place_phone, String opening_time, Date place_date, String place_geo) {
		super();
		this.place_code = place_code;
		this.place_id = place_id;
		this.place_user = place_user;
		this.place_name = place_name;
		this.place_address = place_address;
		this.place_phone = place_phone;
		this.opening_time = opening_time;
		this.place_date = place_date;
		this.place_geo = place_geo;
	}

	public String getPlace_code() {
		return place_code;
	}

	public void setPlace_code(String place_code) {
		this.place_code = place_code;
	}

	public String getPlace_id() {
		return place_id;
	}

	public void setPlace_id(String place_id) {
		this.place_id = place_id;
	}

	public String getPlace_user() {
		return place_user;
	}

	public void setPlace_user(String place_user) {
		this.place_user = place_user;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getPlace_address() {
		return place_address;
	}

	public void setPlace_address(String place_address) {
		this.place_address = place_address;
	}

	public String getPlace_phone() {
		return place_phone;
	}

	public void setPlace_phone(String place_phone) {
		this.place_phone = place_phone;
	}

	public String getOpening_time() {
		return opening_time;
	}

	public void setOpening_time(String opening_time) {
		this.opening_time = opening_time;
	}

	public Date getPlace_date() {
		return place_date;
	}

	public void setPlace_date(Date place_date) {
		this.place_date = place_date;
	}

	public String getPlace_geo() {
		return place_geo;
	}

	public void setPlace_geo(String place_geo) {
		this.place_geo = place_geo;
	}

	@Override
	public String toString() {
		return "Place [place_code=" + place_code + ", place_id=" + place_id + ", place_user=" + place_user
				+ ", place_name=" + place_name + ", place_address=" + place_address + ", place_phone=" + place_phone
				+ ", opening_time=" + opening_time + ", place_date=" + place_date + ", place_geo=" + place_geo + "]";
	}

}
