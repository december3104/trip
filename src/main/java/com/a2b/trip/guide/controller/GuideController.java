package com.a2b.trip.guide.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.guide.model.service.GuideService;
import com.a2b.trip.guide.model.vo.GuideDetail;
import com.a2b.trip.location.model.service.LocationService;
import com.a2b.trip.location.model.vo.Location;
import com.a2b.trip.member.model.service.MemberService;

@Controller
public class GuideController {

	@Autowired
	private GuideService guideService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private LocationService locationService;
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(GuideController.class);
	
	public GuideController() {}
	
	
	//가이드 회원 상세보기
	@RequestMapping("selectDetailViewGuide.ad")
	public ModelAndView selectDetailViewGuide(@RequestParam("guide_id") String guide_id, ModelAndView mv) {
		GuideDetail guide = guideService.selectDetailViewGuide(guide_id);
		
		mv.addObject("guide", guide);
		mv.setViewName("admin/member/guideDetailView_ad");
		
		return mv;
	}
	
	//가이드 신청 상세보기
	@RequestMapping("selectDetailViewApplyGuide.ad")
	public ModelAndView selectDetailViewApplyGuide(@RequestParam("guide_id") String guide_id, ModelAndView mv) {
		GuideDetail guide = guideService.selectDetailViewApplyGuide(guide_id);
		
		mv.addObject("guideApply", guide);
		mv.setViewName("admin/member/guideApplyDetailView");
		return mv;
	}
	
	//가이드 상세보기 거절
	@RequestMapping("detailApplyRejectGuide.ad")
	public String detailApplyRejectGuide(@RequestParam("guide_id") String guide_id) {
		int result = guideService.detailApplyRejectGuide1(guide_id);
		int result2 = guideService.detailApplyRejectGuide2(guide_id);
		String viewFileName = "";
		if(result == 1 && result2 == 1) {
			viewFileName = "redirect:/selectListApplyGuide.ad";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//가이드 상세보기 수락
	@RequestMapping("updateDetailAcceptGuide.ad")
	public String updateDetailAcceptGuide(@RequestParam("guide_id") String guide_id) {
		String viewFileName = "";
		
		int result = guideService.updateDetailAcceptGuide1(guide_id);
		int result2 = guideService.updateDetailAcceptGuide2(guide_id);
		
		logger.info(result + " // " + result2); 
		
		if(result == 1 && result2 == 1) {
			viewFileName = "redirect:/selectListApplyGuide.ad";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//가이드 자격박탈
	@RequestMapping("updateDetailForcedExitGuide.ad")
	public String updateDetailForcedExitGuide(@RequestParam("guide_id") String guide_id) {
		logger.info(guide_id);
		
		int result1 = memberService.updateDetailForcedExitGuide(guide_id);
		int result2 = guideService.updateDetailForcedExitGuide(guide_id);
		
		String viewFileName = "";
				
		if(result1 == 1 && result2 == 1 ) {
			viewFileName = "redirect:/selectListAllGuide.ad?currentPage=1&contentNum=10";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//가이드 신청 페이지 이동
	@RequestMapping("guideApplyPage.do")
	public ModelAndView guideApplyPage(ModelAndView mv) {
		
		ArrayList<Location> list = locationService.selectAll();
		
		mv.addObject("loc", list);
		mv.setViewName("guide/guideApplyPage");
		
		return mv;
	}
}
