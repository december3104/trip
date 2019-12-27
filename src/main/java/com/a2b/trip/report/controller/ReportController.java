package com.a2b.trip.report.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.member.model.vo.Member;
import com.a2b.trip.report.model.service.ReportService;
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
		ArrayList<Member> list = reportService.selectListNormalReport();
		
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
		ArrayList<Member> list = reportService.selectListGuideReport();
		
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
	
	
	
	//end
	
	
}
