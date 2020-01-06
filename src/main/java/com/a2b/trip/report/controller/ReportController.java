package com.a2b.trip.report.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.report.model.service.ReportService;
import com.a2b.trip.report.model.vo.GuideReport;
import com.a2b.trip.report.model.vo.NormalReport;
import com.a2b.trip.report.model.vo.Report;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	
	public ReportController() {}
	
	//2019.12.27 ssm 작성
	//일반 회원 신고처리 목록 조회
	@RequestMapping("selectListNormalReport.ad")
	public ModelAndView selectListNormalReport(ModelAndView mv) {
		ArrayList<NormalReport> list = reportService.selectListNormalReport();
		
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
	public ModelAndView selectListGuideReport(ModelAndView mv) {
		ArrayList<GuideReport> list = reportService.selectListGuideReport();
		
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
	
	
}
