package com.a2b.trip.guidematching.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class GuideMatching implements Serializable {
	private static final long serialVersionUID = 8001L;
	
	private int gb_no;
	private String gm_id;
	private Date gm_date;
	private int gm_number;
	private String gb_alarm;

	public GuideMatching() {}

	public GuideMatching(int gb_no, String gm_id, Date gm_date, int gm_number, String gb_alarm) {
		super();
		this.gb_no = gb_no;
		this.gm_id = gm_id;
		this.gm_date = gm_date;
		this.gm_number = gm_number;
		this.gb_alarm = gb_alarm;
	}

	public int getGb_no() {
		return gb_no;
	}

	public void setGb_no(int gb_no) {
		this.gb_no = gb_no;
	}

	public String getGm_id() {
		return gm_id;
	}

	public void setGm_id(String gm_id) {
		this.gm_id = gm_id;
	}

	public Date getGm_date() {
		return gm_date;
	}

	public void setGm_date(Date gm_date) {
		this.gm_date = gm_date;
	}

	public int getGm_number() {
		return gm_number;
	}

	public void setGm_number(int gm_number) {
		this.gm_number = gm_number;
	}

	public String getGb_alarm() {
		return gb_alarm;
	}

	public void setGb_alarm(String gb_alarm) {
		this.gb_alarm = gb_alarm;
	}

	@Override
	public String toString() {
		return "GuideMatching [gb_no=" + gb_no + ", gm_id=" + gm_id + ", gm_date=" + gm_date + ", gm_number="
				+ gm_number + ", gb_alarm=" + gb_alarm + "]";
	}
	
}
