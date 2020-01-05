package com.a2b.trip.notice.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.notice.model.service.NoticeService;
import com.a2b.trip.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	public NoticeController() {}
	
	
	//관리자 공지사항 천제 목록 조회
	@RequestMapping("selectListAllNotice.ad")
	public ModelAndView selectListAllNotice(ModelAndView mv) {
		ArrayList<Notice> list = noticeService.selectListAllNotice();
		
		logger.info(list.toString());
		
		mv.addObject("nList", list);
		mv.setViewName("admin/notice/noticeAllList");
		
		return mv;
	}
	//관리자 공지사항 글쓰기
	@RequestMapping("insertWordNotice.ad")
	public String insertWordNotice() {
		return "admin/notice/insertNotice";
	}
	
	//관리자 공지사항 상세보기
	@RequestMapping("selectDetailViewNotice.ad")
	public ModelAndView selectDetailViewNotice(@RequestParam("notice_no") int notice_no, ModelAndView mv) {
		System.out.println(notice_no);
		Notice notice = noticeService.selectDetailViewNotice(notice_no);
		
		mv.addObject("notice", notice);
		mv.setViewName("admin/notice/noticeDetailView");
		
		return mv;
	}
}
