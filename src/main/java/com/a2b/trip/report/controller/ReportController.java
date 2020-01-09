package com.a2b.trip.report.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.service.FellowMatchingService;
import com.a2b.trip.member.model.vo.Member;
import com.a2b.trip.report.model.service.ReportService;
import com.a2b.trip.report.model.vo.GuideReport;
import com.a2b.trip.report.model.vo.NormalReport;
import com.a2b.trip.report.model.vo.Report;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	@Autowired
	private FellowMatchingService fellowMatchingService;
	
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	
	public ReportController() {}
	
	//2019.12.27 ssm 작성
	//일반 회원 신고처리 목록 조회
	@RequestMapping("selectListNormalReport.ad")
	public ModelAndView selectListNormalReport(ModelAndView mv, Page page) {
		int totalCount = reportService.selectTotal();	//	게시물 총 갯수(현제 db에 저장된 값)
		int currentPage = page.getCurrentPage();
		page.setTotalCount(totalCount);	//	전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
		page.calcRow(currentPage, 10);	//	db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage);	//	페이지 	
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum());	//	맨 마지막 페이지 계산
		
		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
		
		ArrayList<NormalReport> list = reportService.selectListNormalReport(page);
		
		logger.info(list.toString());
		
		mv.addObject("memberReportList", list);
		mv.setViewName("admin/report/memberReportList");
		
		return mv;
	}

	//일반 회원 신고처리 상세 보기
	@RequestMapping("selectDetailViewNormalReport.ad")
	public ModelAndView selectDetailViewNormalReport(@RequestParam("member_id") String member_id,ModelAndView mv) {
		ArrayList<Report> list = reportService.selectDetailViewNormalReport(member_id);
		
		logger.info(list.toString());
		
		mv.addObject("normalDetailViewReportList",list);
		mv.setViewName("admin/report/normalDetailReportList");
		
		return mv;
	}
	
	//가이드 회원 신고처리 목록 조회
	@RequestMapping("selectListGuideReport.ad")
	public ModelAndView selectListGuideReport(ModelAndView mv,Page page) {
		int totalCount = reportService.selectTotalGuide();	//	게시물 총 갯수(현제 db에 저장된 값)
		int currentPage = page.getCurrentPage();
		page.setTotalCount(totalCount);	//	전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
		page.calcRow(currentPage,10);	//	db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage);	//	페이지 	
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum());	//	맨 마지막 페이지 계산
		
		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
		
		ArrayList<GuideReport> list = reportService.selectListGuideReport(page);
		
		logger.info(list.toString());
		
		mv.addObject("guideReportList", list);
		mv.setViewName("admin/report/guideReportList");
		
		return mv;
	}
	
	//가이드 회원 신고처리 상세 보기
	@RequestMapping("selectDetailViewGuideReport.ad")
	public ModelAndView selectDetailViewGuideReport(@RequestParam("member_id") String member_id ,ModelAndView mv) {
		ArrayList<Report> list = reportService.selectDetailViewGuideReport(member_id);
		
		logger.info(list.toString());
		
		mv.addObject("guideDetailViewReportList", list);
		mv.setViewName("admin/report/guideDetailReportList");
		
		return mv;
	}
	
	//일반 회원 신고 처리 승인
	@RequestMapping("updateDetailAcceptNormalReport.ad")
	public String updateDetailAcceptNormalReport(@RequestParam("report_id") String report_id,@RequestParam("report_no") int report_no) {
		int result1 = reportService.updateDetailAcceptNormalReport1(report_id);
		int result2 = reportService.updateDetailAcceptNormalReport2(report_no);
		String viewFileName = " ";
		if(result1 == 1 && result2 == 1) {
			viewFileName = "redirect:/selectListNormalReport.ad";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//일반 회원 신고 거절 처리
		@RequestMapping("detailRejectNormalReport.ad")
		public String detailRejectNormalReport(@RequestParam("report_id") String report_id,@RequestParam("report_no") int report_no) {
			int result = reportService.detailRejectNormalReport(report_no);
			String viewFileName = " ";
			if(result == 1) {
				viewFileName = "redirect:/selectListNormalReport.ad";
			}else {
				viewFileName = "common/error";
			}
			return viewFileName;
		}
		
	//가이드 회원 신고 승인 처리
		@RequestMapping("updateDetailAcceptGuideReport.ad")
		public String updateDetailAcceptGuideReport(@RequestParam("report_id") String report_id,@RequestParam("report_no") int report_no) {
			
			int result1 = reportService.updateDetailAcceptGuideReport1(report_id);
			int result2 = reportService.updateDetailAcceptGuideReport2(report_no);
			
			String viewFileName = " ";
			if(result1 == 1 && result2 == 1) {
				viewFileName = "redirect:/selectListGuideReport.ad";
			}else {
				viewFileName = "common/error";
			}
			
			return viewFileName;
		}
		
	//가이드 회원 신고 거절 처리
		@RequestMapping("detailRejectGuideReport.ad")
		public String detailRejectGuideReport(@RequestParam("report_id") String report_id,@RequestParam("report_no") int report_no) {
			logger.info(report_id + " / / " + report_no);
			
			int result = reportService.detailRejectGuideReport(report_no);
			logger.info(result + "개 행 처리");
			
			String viewFileName = "";
			if(result == 1) {
				viewFileName = "redirect:/selectListGuideReport.ad";
			}else {
				viewFileName = "common/error";
			}
			return viewFileName;
		}
		
		
		
		
		
	//end
		
	// 혜진
	//신고하기
	@RequestMapping(value="insertReport.do", method=RequestMethod.POST)
	public String insertReport(Report report, HttpServletRequest request, Model model) {
		// 세션에서 정보 꺼내기
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		String clame_id = member.getMember_id();
		
		report.setClame_id(clame_id);
		
		int result = reportService.insertReport(report);
		
		String viewFileName = "redirect:/selectMyFellowMatching.do";
	
		if (result <= 0) {
			viewFileName = "common/error";
		}
	
		return viewFileName;
	}
	
	
}

