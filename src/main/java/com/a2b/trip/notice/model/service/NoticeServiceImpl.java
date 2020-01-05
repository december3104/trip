package com.a2b.trip.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.notice.model.dao.NoticeDao;
import com.a2b.trip.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	public NoticeServiceImpl() {}

	//관리자 공지사항 천제 조회
	@Override
	public ArrayList<Notice> selectListAllNotice() {
		return noticeDao.selectListAllNotice();
	}
	//관리자 공지사항 상세보기
	@Override
	public Notice selectDetailViewNotice(int notice_no) {
		return noticeDao.selectDetailViewNotice(notice_no);
	}
	
	
}
