package com.a2b.trip.guidebook.model.vo;

import java.io.Serializable;
 
public class Budget implements Serializable {
	private static final long serialVersionUID = 12000L;
	
	private String budget_no;
	private String place_code;
	private String budget_book_no;
	private String place_name;
	private int place_money;
	
	public Budget() {}

	public Budget(String budget_no, String place_code, String budget_book_no, String place_name, int place_money) {
		super();
		this.budget_no = budget_no;
		this.place_code = place_code;
		this.budget_book_no = budget_book_no;
		this.place_name = place_name;
		this.place_money = place_money;
	}

	public String getBudget_no() {
		return budget_no;
	}

	public void setBudget_no(String budget_no) {
		this.budget_no = budget_no;
	}

	public String getPlace_code() {
		return place_code;
	}

	public void setPlace_code(String place_code) {
		this.place_code = place_code;
	}

	public String getBudget_book_no() {
		return budget_book_no;
	}

	public void setBudget_book_no(String budget_book_no) {
		this.budget_book_no = budget_book_no;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public int getPlace_money() {
		return place_money;
	}

	public void setPlace_money(int place_money) {
		this.place_money = place_money;
	}

	@Override
	public String toString() {
		return "Budget [budget_no=" + budget_no + ", place_code=" + place_code + ", budget_book_no=" + budget_book_no
				+ ", place_name=" + place_name + ", place_money=" + place_money + "]";
	}
	
}
