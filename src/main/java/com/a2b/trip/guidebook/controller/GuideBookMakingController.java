package com.a2b.trip.guidebook.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a2b.trip.guidebook.model.service.GuidebookMakingService;
import com.a2b.trip.guidebook.model.service.GuidebookService;
import com.a2b.trip.guidebook.model.vo.Guidebook;
import com.a2b.trip.guidebook.model.vo.GuidebookMaking;
import com.a2b.trip.member.model.vo.Member;

@Controller
public class GuideBookMakingController {
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
			private static final Logger logger = LoggerFactory.getLogger(GuidebookController.class);
	
	@Autowired
	private GuidebookMakingService guideBookMakingService;
	
	@Autowired
	private GuidebookService guideBookService;
	
	public GuideBookMakingController() {}
	
	
}
