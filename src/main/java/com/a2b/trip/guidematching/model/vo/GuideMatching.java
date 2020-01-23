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
	private String gb_report;
	private String gm_report;
	private String grade_check;

	public GuideMatching() {}

	public GuideMatching(int gb_no, String gm_id, Date gm_date, int gm_number, String gb_alarm, String gb_report,
			String gm_report, String grade_check) {
		super();
		this.gb_no = gb_no;
		this.gm_id = gm_id;
		this.gm_date = gm_date;
		this.gm_number = gm_number;
		this.gb_alarm = gb_alarm;
		this.gb_report = gb_report;
		this.gm_report = gm_report;
		this.grade_check = grade_check;
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

	public String getGb_report() {
		return gb_report;
	}

	public void setGb_report(String gb_report) {
		this.gb_report = gb_report;
	}

	public String getGm_report() {
		return gm_report;
	}

	public void setGm_report(String gm_report) {
		this.gm_report = gm_report;
	}

	public String getGrade_check() {
		return grade_check;
	}

	public void setGrade_check(String grade_check) {
		this.grade_check = grade_check;
	}

	@Override
	public String toString() {
		return "GuideMatching [gb_no=" + gb_no + ", gm_id=" + gm_id + ", gm_date=" + gm_date + ", gm_number="
				+ gm_number + ", gb_alarm=" + gb_alarm + ", gb_report=" + gb_report + ", gm_report=" + gm_report
				+ ", grade_check=" + grade_check + "]";
	}

	

	
}
