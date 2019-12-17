package com.a2b.trip.place.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Place implements Serializable {
	private static final long serialVersionUID = 9000L;
	
	private String place_code;
	private String place_user;	//
	private String place_kr;
	private String place_en;
	private String place_loc;
	private String place_address;
	private String place_phone;
	private String open_time;
	private String close_time;
	private Date place_date;
	private double place_lat;	//
	private double place_long;	//
	
	public Place() {}

	public Place(String place_code, String place_user, String place_kr, String place_en, String place_loc,
			String place_address, String place_phone, String open_time, String close_time, Date place_date,
			double place_lat, double place_long) {
		super();
		this.place_code = place_code;
		this.place_user = place_user;
		this.place_kr = place_kr;
		this.place_en = place_en;
		this.place_loc = place_loc;
		this.place_address = place_address;
		this.place_phone = place_phone;
		this.open_time = open_time;
		this.close_time = close_time;
		this.place_date = place_date;
		this.place_lat = place_lat;
		this.place_long = place_long;
	}

	public String getPlace_code() {
		return place_code;
	}

	public void setPlace_code(String place_code) {
		this.place_code = place_code;
	}

	public String getPlace_user() {
		return place_user;
	}

	public void setPlace_user(String place_user) {
		this.place_user = place_user;
	}

	public String getPlace_kr() {
		return place_kr;
	}

	public void setPlace_kr(String place_kr) {
		this.place_kr = place_kr;
	}

	public String getPlace_en() {
		return place_en;
	}

	public void setPlace_en(String place_en) {
		this.place_en = place_en;
	}

	public String getPlace_loc() {
		return place_loc;
	}

	public void setPlace_loc(String place_loc) {
		this.place_loc = place_loc;
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

	public String getOpen_time() {
		return open_time;
	}

	public void setOpen_time(String open_time) {
		this.open_time = open_time;
	}

	public String getClose_time() {
		return close_time;
	}

	public void setClose_time(String close_time) {
		this.close_time = close_time;
	}

	public Date getPlace_date() {
		return place_date;
	}

	public void setPlace_date(Date place_date) {
		this.place_date = place_date;
	}

	public double getPlace_lat() {
		return place_lat;
	}

	public void setPlace_lat(double place_lat) {
		this.place_lat = place_lat;
	}

	public double getPlace_long() {
		return place_long;
	}

	public void setPlace_long(double place_long) {
		this.place_long = place_long;
	}

	@Override
	public String toString() {
		return "Place [place_code=" + place_code + ", place_user=" + place_user + ", place_kr=" + place_kr
				+ ", place_en=" + place_en + ", place_loc=" + place_loc + ", place_address=" + place_address
				+ ", place_phone=" + place_phone + ", open_time=" + open_time + ", close_time=" + close_time
				+ ", place_date=" + place_date + ", place_lat=" + place_lat + ", place_long=" + place_long + "]";
	}
	
}
