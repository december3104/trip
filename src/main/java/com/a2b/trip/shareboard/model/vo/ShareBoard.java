package com.a2b.trip.shareboard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class ShareBoard implements Serializable {
	private static final long serialVersionUID = 13000L;
	
	private int sb_no;
	private String sb_id;
	private String sb_title;
	private Date sb_date;
	private int sb_like;
	private int sb_views;
	
	public ShareBoard() {}

	public ShareBoard(int sb_no, String sb_id, String sb_title, Date sb_date, int sb_like, int sb_views) {
		super();
		this.sb_no = sb_no;
		this.sb_id = sb_id;
		this.sb_title = sb_title;
		this.sb_date = sb_date;
		this.sb_like = sb_like;
		this.sb_views = sb_views;
	}

	public int getSb_no() {
		return sb_no;
	}

	public void setSb_no(int sb_no) {
		this.sb_no = sb_no;
	}

	public String getSb_id() {
		return sb_id;
	}

	public void setSb_id(String sb_id) {
		this.sb_id = sb_id;
	}

	public String getSb_title() {
		return sb_title;
	}

	public void setSb_title(String sb_title) {
		this.sb_title = sb_title;
	}

	public Date getSb_date() {
		return sb_date;
	}

	public void setSb_date(Date sb_date) {
		this.sb_date = sb_date;
	}

	public int getSb_like() {
		return sb_like;
	}

	public void setSb_like(int sb_like) {
		this.sb_like = sb_like;
	}

	public int getSb_views() {
		return sb_views;
	}

	public void setSb_views(int sb_views) {
		this.sb_views = sb_views;
	}

	@Override
	public String toString() {
		return "Shareboard [sb_no=" + sb_no + ", sb_id=" + sb_id + ", sb_title=" + sb_title + ", sb_date=" + sb_date
				+ ", sb_like=" + sb_like + ", sb_views=" + sb_views + "]";
	}
	
}
