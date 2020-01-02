package com.a2b.trip.guide.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.guide.model.service.GuideService;
import com.a2b.trip.guide.model.vo.GuideDetail;

@Controller
public class GuideController {

	@Autowired
	private GuideService guideService;
	
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
}
