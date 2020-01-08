package com.a2b.trip.notice.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.common.Page;
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
	public ModelAndView selectListAllNotice(Page page,ModelAndView mv) {
		
		int totalCount = noticeService.selectTotal();	//	게시물 총 갯수(현제 db에 저장된 값)
		int currentPage = page.getCurrentPage();
		page.setTotalCount(totalCount);	//	전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
		page.calcRow(currentPage,10);	//	db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage);	//	페이지 	
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum());	//	맨 마지막 페이지 계산
		
		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
		
		ArrayList<Notice> list = noticeService.selectListAllNotice(page);
		
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
		Notice notice = noticeService.selectDetailViewNotice(notice_no);
		
		mv.addObject("notice", notice);
		mv.setViewName("admin/notice/noticeDetailView");
		
		return mv;
	}
	
	//관리자 공지사항 삭제
	@RequestMapping("deleteDetailNotice.ad")
	public String deleteDetailNotice(@RequestParam("notice_no") int notice_no) {
		int result = noticeService.deleteDetailNotice(notice_no);
		
		String viewFileName =" ";
		if(result == 1) {
			viewFileName = "redirect:/selectListAllNotice.ad";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//관리자 공지사항 작성
	@RequestMapping(value="insertNotice.ad", method= {RequestMethod.POST})
	public String insertWordNotice(Notice notice) {
		int result = noticeService.insertNotice(notice);
		
		String viewFileName =" ";
		if(result == 1) {
			viewFileName = "redirect:/selectListAllNotice.ad";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//수정 버튼 클릭 시 수정페이지로 이동
	@RequestMapping("updateDetailNoticePage.ad")
	public ModelAndView updateDetailNoticePage(@RequestParam("notice_no") int notice_no, ModelAndView mv) {
		Notice notice = noticeService.selectDetailViewNotice(notice_no);
		
		mv.addObject("notice", notice);
		mv.setViewName("admin/notice/noticeUpdateView");
		
		return mv;
	}
	
	//관리자 공자사항 글 수정
	@RequestMapping(value="updateDetailNotice.ad", method= {RequestMethod.POST})
	public String updateDetailNotice(Notice notice) {
		logger.info(notice.toString());
		
		int result = noticeService.updateDetailNotice(notice);
		
		logger.info(result+" 개 행 처리 완료");
		
		String viewFileName =" ";
		if(result == 1) {
			viewFileName = "redirect:/selectDetailViewNotice.ad?notice_no="+notice.getNotice_no();
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}

}
