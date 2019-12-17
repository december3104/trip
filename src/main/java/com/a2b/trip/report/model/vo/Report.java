package com.a2b.trip.report.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Report implements Serializable {
	private static final long serialVersionUID = 6000L;
	
	private int report_no;
	private String clame_id;
	private String report_id;
	private String report_content;
	private String report_status;
	private Date report_date;
	private Date complete_date;
	private String report_alarm;

	public Report() {}

	public Report(int report_no, String clame_id, String report_id, String report_content, String report_status,
			Date report_date, Date complete_date, String report_alarm) {
		super();
		this.report_no = report_no;
		this.clame_id = clame_id;
		this.report_id = report_id;
		this.report_content = report_content;
		this.report_status = report_status;
		this.report_date = report_date;
		this.complete_date = complete_date;
		this.report_alarm = report_alarm;
	}

	public int getReport_no() {
		return report_no;
	}

	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}

	public String getClame_id() {
		return clame_id;
	}

	public void setClame_id(String clame_id) {
		this.clame_id = clame_id;
	}

	public String getReport_id() {
		return report_id;
	}

	public void setReport_id(String report_id) {
		this.report_id = report_id;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public String getReport_status() {
		return report_status;
	}

	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}

	public Date getReport_date() {
		return report_date;
	}

	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}

	public Date getComplete_date() {
		return complete_date;
	}

	public void setComplete_date(Date complete_date) {
		this.complete_date = complete_date;
	}

	public String getReport_alarm() {
		return report_alarm;
	}

	public void setReport_alarm(String report_alarm) {
		this.report_alarm = report_alarm;
	}

	@Override
	public String toString() {
		return "Report [report_no=" + report_no + ", clame_id=" + clame_id + ", report_id=" + report_id
				+ ", report_content=" + report_content + ", report_status=" + report_status + ", report_alarm="
				+ report_alarm + "]";
	}
	
}
