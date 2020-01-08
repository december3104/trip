package com.a2b.trip.guidematching.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class GuideBoard implements Serializable {
	private static final long serialVersionUID = 8000L;
	
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

	public GuideBoard() {}

	public GuideBoard(int gb_no, String gb_id, Date gb_start_date, Date gb_end_date, String gb_route, int gb_price,
			int gb_min_number, int gb_max_number, Date gb_open_date, Date gb_close_date, String gb_title, int gb_number,
			String gb_deadline_check) {
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

	@Override
	public String toString() {
		return "GuideBoard [gb_no=" + gb_no + ", gb_id=" + gb_id + ", gb_start_date=" + gb_start_date + ", gb_end_date="
				+ gb_end_date + ", gb_route=" + gb_route + ", gb_price=" + gb_price + ", gb_min_number=" + gb_min_number
				+ ", gb_max_number=" + gb_max_number + ", gb_open_date=" + gb_open_date + ", gb_close_date="
				+ gb_close_date + ", gb_title=" + gb_title + ", gb_number=" + gb_number + ", gb_deadline_check="
				+ gb_deadline_check + "]";
	}
	
}
