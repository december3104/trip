package com.a2b.trip.location.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Location implements Serializable {
	private static final long serialVersionUID = 3000L;
	
	private String loc_code;
	private String loc_name;
	
	public Location() {}

	public Location(String loc_code, String loc_name) {
		super();
		this.loc_code = loc_code;
		this.loc_name = loc_name;
	}

	public String getLoc_code() {
		return loc_code;
	}

	public void setLoc_code(String loc_code) {
		this.loc_code = loc_code;
	}

	public String getLoc_name() {
		return loc_name;
	}

	public void setLoc_name(String loc_name) {
		this.loc_name = loc_name;
	}

	@Override
	public String toString() {
		return "Location [loc_code=" + loc_code + ", loc_name=" + loc_name + "]";
	}
	
	
}
