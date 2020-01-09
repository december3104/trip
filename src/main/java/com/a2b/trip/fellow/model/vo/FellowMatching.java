package com.a2b.trip.fellow.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class FellowMatching implements Serializable {
	private static final long serialVersionUID = 7001L;
	
	private int fb_no;
	private String fm_id;
	private String fm_gender;
	private Date fm_date;
	private int fm_number;
	private String fm_accept_check;
	private Date fm_accept_date;
	private String fm_content;
	private String fb_alarm;
	private String fm_alarm;
	private String fb_report;
	private String fm_report;

	public FellowMatching() {}

	public FellowMatching(int fb_no, String fm_id, String fm_gender, Date fm_date, int fm_number,
			String fm_accept_check, Date fm_accept_date, String fm_content, String fb_alarm, String fm_alarm,
			String fb_report, String fm_report) {
		super();
		this.fb_no = fb_no;
		this.fm_id = fm_id;
		this.fm_gender = fm_gender;
		this.fm_date = fm_date;
		this.fm_number = fm_number;
		this.fm_accept_check = fm_accept_check;
		this.fm_accept_date = fm_accept_date;
		this.fm_content = fm_content;
		this.fb_alarm = fb_alarm;
		this.fm_alarm = fm_alarm;
		this.fb_report = fb_report;
		this.fm_report = fm_report;
	}

	public int getFb_no() {
		return fb_no;
	}

	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}

	public String getFm_id() {
		return fm_id;
	}

	public void setFm_id(String fm_id) {
		this.fm_id = fm_id;
	}

	public String getFm_gender() {
		return fm_gender;
	}

	public void setFm_gender(String fm_gender) {
		this.fm_gender = fm_gender;
	}

	public Date getFm_date() {
		return fm_date;
	}

	public void setFm_date(Date fm_date) {
		this.fm_date = fm_date;
	}

	public int getFm_number() {
		return fm_number;
	}

	public void setFm_number(int fm_number) {
		this.fm_number = fm_number;
	}

	public String getFm_accept_check() {
		return fm_accept_check;
	}

	public void setFm_accept_check(String fm_accept_check) {
		this.fm_accept_check = fm_accept_check;
	}

	public Date getFm_accept_date() {
		return fm_accept_date;
	}

	public void setFm_accept_date(Date fm_accept_date) {
		this.fm_accept_date = fm_accept_date;
	}

	public String getFm_content() {
		return fm_content;
	}

	public void setFm_content(String fm_content) {
		this.fm_content = fm_content;
	}

	public String getFb_alarm() {
		return fb_alarm;
	}

	public void setFb_alarm(String fb_alarm) {
		this.fb_alarm = fb_alarm;
	}

	public String getFm_alarm() {
		return fm_alarm;
	}

	public void setFm_alarm(String fm_alarm) {
		this.fm_alarm = fm_alarm;
	}

	public String getFb_report() {
		return fb_report;
	}

	public void setFb_report(String fb_report) {
		this.fb_report = fb_report;
	}

	public String getFm_report() {
		return fm_report;
	}

	public void setFm_report(String fm_report) {
		this.fm_report = fm_report;
	}

	@Override
	public String toString() {
		return "FellowMatching [fb_no=" + fb_no + ", fm_id=" + fm_id + ", fm_gender=" + fm_gender + ", fm_date="
				+ fm_date + ", fm_number=" + fm_number + ", fm_accept_check=" + fm_accept_check + ", fm_accept_date="
				+ fm_accept_date + ", fm_content=" + fm_content + ", fb_alarm=" + fb_alarm + ", fm_alarm=" + fm_alarm
				+ ", fb_report=" + fb_report + ", fm_report=" + fm_report + "]";
	}

}
