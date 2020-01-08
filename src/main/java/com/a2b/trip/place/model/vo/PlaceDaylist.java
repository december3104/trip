package com.a2b.trip.place.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class PlaceDaylist implements Serializable {
	private static final long serialVersionUID = 9100L;
	
	private int daylist_no;
	private String daylist_name;
	private String daylist_user;
	private Date daylist_start;
	private Date daylist_end;
	
	public PlaceDaylist() {}

	public PlaceDaylist(int daylist_no, String daylist_name, String daylist_user, Date daylist_start,
			Date daylist_end) {
		super();
		this.daylist_no = daylist_no;
		this.daylist_name = daylist_name;
		this.daylist_user = daylist_user;
		this.daylist_start = daylist_start;
		this.daylist_end = daylist_end;
	}

	public int getDaylist_no() {
		return daylist_no;
	}

	public void setDaylist_no(int daylist_no) {
		this.daylist_no = daylist_no;
	}

	public String getDaylist_name() {
		return daylist_name;
	}

	public void setDaylist_name(String daylist_name) {
		this.daylist_name = daylist_name;
	}

	public String getDaylist_user() {
		return daylist_user;
	}

	public void setDaylist_user(String daylist_user) {
		this.daylist_user = daylist_user;
	}

	public Date getDaylist_start() {
		return daylist_start;
	}

	public void setDaylist_start(Date daylist_start) {
		this.daylist_start = daylist_start;
	}

	public Date getDaylist_end() {
		return daylist_end;
	}

	public void setDaylist_end(Date daylist_end) {
		this.daylist_end = daylist_end;
	}

	@Override
	public String toString() {
		return "PlaceDaylist [daylist_no=" + daylist_no + ", daylist_name=" + daylist_name + ", daylist_user="
				+ daylist_user + ", daylist_start=" + daylist_start + ", daylist_end=" + daylist_end + "]";
	}
	
}
