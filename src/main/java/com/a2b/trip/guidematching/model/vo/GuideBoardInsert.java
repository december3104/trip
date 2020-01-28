package com.a2b.trip.guidematching.model.vo;

import java.io.Serializable;

public class GuideBoardInsert implements Serializable{
	private static final long serialVersionUID = 8222L;
	private String gb_start_date;
	private String gb_end_date;
	private String gb_route;
	private int gb_price;
	private int gb_min_number;
	private int gb_max_number;
	private String gb_open_date;
	private String gb_close_date;
	private String gb_title;
	
	public GuideBoardInsert() {}

	public GuideBoardInsert(String gb_start_date, String gb_end_date, String gb_route, int gb_price, int gb_min_number,
			int gb_max_number, String gb_open_date, String gb_close_date, String gb_title) {
		super();
		this.gb_start_date = gb_start_date;
		this.gb_end_date = gb_end_date;
		this.gb_route = gb_route;
		this.gb_price = gb_price;
		this.gb_min_number = gb_min_number;
		this.gb_max_number = gb_max_number;
		this.gb_open_date = gb_open_date;
		this.gb_close_date = gb_close_date;
		this.gb_title = gb_title;
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

	@Override
	public String toString() {
		return "GuideBoardInsert [gb_start_date=" + gb_start_date + ", gb_end_date=" + gb_end_date + ", gb_route="
				+ gb_route + ", gb_price=" + gb_price + ", gb_min_number=" + gb_min_number + ", gb_max_number="
				+ gb_max_number + ", gb_open_date=" + gb_open_date + ", gb_close_date=" + gb_close_date + ", gb_title="
				+ gb_title + "]";
	}

	
	
}
