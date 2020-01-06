package com.a2b.trip.fellow.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.fellow.model.service.FellowMatchingService;
import com.a2b.trip.fellow.model.vo.FellowMatching;

@Controller
public class FellowMatchingController {

	@Autowired
	private FellowMatchingService fellowMatchingService;
	
	public FellowMatchingController() {}
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(FellowMatchingController.class);
		
	// 동행 매칭 기록 목록 보기
	@RequestMapping("selectMyFellowMatching")
	public ModelAndView selectMyFellowMatching(@RequestParam("fm_id") String fm_id, ModelAndView mv) {
		logger.info(fm_id);
		
		ArrayList<FellowMatching> list = fellowMatchingService.selectMyFellowMatching(fm_id);
		
		mv.addObject("selectMyFellowMatchingList", list);
		mv.setViewName("fellow/fellowMatchingMyListPage");
		
		return mv;
	}
}
