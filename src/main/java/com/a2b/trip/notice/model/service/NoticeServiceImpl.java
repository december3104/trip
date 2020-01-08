package com.a2b.trip.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.common.Page;
import com.a2b.trip.notice.model.dao.NoticeDao;
import com.a2b.trip.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	public NoticeServiceImpl() {}
	

	//관리자 공지사항 천제 조회
	@Override
	public ArrayList<Notice> selectListAllNotice(Page page) {
		return noticeDao.selectListAllNotice(page);
	}
	//관리자 공지사항 상세보기
	@Override
	public Notice selectDetailViewNotice(int notice_no) {
		return noticeDao.selectDetailViewNotice(notice_no);
	}

	//관리자 공지사항 글 삭제
	@Override
	public int deleteDetailNotice(int notice_no) {
		return noticeDao.deleteDetailNotice(notice_no);
	}

	//관리자 공지사항 글 등록
	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	//게시글 전체 갯수 조회
	@Override
	public int selectTotal() {
		return noticeDao.selectTotal();
	}

	//공지사항 수정
	@Override
	public int updateDetailNotice(Notice notice) {
		return noticeDao.updateDetailNotice(notice);
	}
	
	
	
}
