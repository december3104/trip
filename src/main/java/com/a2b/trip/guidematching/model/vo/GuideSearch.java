package com.a2b.trip.guidematching.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class GuideSearch implements Serializable{
	private static final long serialVersionUID = 8111L;
	
	private String trip_city;
	private java.sql.Date befor_day;
	private java.sql.Date after_day;
	private String gender;
	private String lang;
	private int average_score;
	
	public GuideSearch() {
		
	}

	public GuideSearch(String trip_city, Date befor_day, Date after_day, String gender, String lang,
			int average_score) {
		super();
		this.trip_city = trip_city;
		this.befor_day = befor_day;
		this.after_day = after_day;
		this.gender = gender;
		this.lang = lang;
		this.average_score = average_score;
	}

	public String getTrip_city() {
		return trip_city;
	}

	public void setTrip_city(String trip_city) {
		this.trip_city = trip_city;
	}

	public java.sql.Date getBefor_day() {
		return befor_day;
	}

	public void setBefor_day(java.sql.Date befor_day) {
		this.befor_day = befor_day;
	}

	public java.sql.Date getAfter_day() {
		return after_day;
	}

	public void setAfter_day(java.sql.Date after_day) {
		this.after_day = after_day;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public int getAverage_score() {
		return average_score;
	}

	public void setAverage_score(int average_score) {
		this.average_score = average_score;
	}

	@Override
	public String toString() {
		return "GuideSearch [trip_city=" + trip_city + ", befor_day=" + befor_day + ", after_day=" + after_day
				+ ", gender=" + gender + ", lang=" + lang + ", average_score=" + average_score + "]";
	}

	
	
}
