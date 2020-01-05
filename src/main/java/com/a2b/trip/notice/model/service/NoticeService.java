package com.a2b.trip.notice.model.service;

import java.util.ArrayList;

import com.a2b.trip.notice.model.vo.Notice;

public interface NoticeService {

	ArrayList<Notice> selectListAllNotice();

	Notice selectDetailViewNotice(int notice_no);

	

}
