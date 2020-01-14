package com.a2b.trip.guidematching.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.a2b.trip.guidematching.model.service.GuideBoardService;
import com.a2b.trip.guidematching.model.service.GuideMatchingService;
import com.a2b.trip.guidematching.model.vo.MyGuideMatching;
import com.a2b.trip.member.model.vo.Member;

@Controller
public class GuideMatchingController {

	@Autowired
	private GuideMatchingService guideMatchingService;
	
	@Autowired
	private GuideBoardService guideBoardService;
	
	public GuideMatchingController() {}
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
		private static final Logger logger = LoggerFactory.getLogger(GuideMatchingController.class);
		
	// 가이드 매칭 기록 목록 보기
	@RequestMapping("selectMyGuideMatching.do")
	public String selectMyGuideMatching(HttpServletRequest request, Model model) {
		// 세션에서 정보 꺼내기
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		String gm_id = member.getMember_id();
		int memberLevel = member.getMember_level();
		
		// 가이드 회원일 때 가이드 매칭 기록 가져오기
		if (memberLevel == 2) {
			ArrayList<MyGuideMatching> list = guideBoardService.selectMyGuideBoard(gm_id);
			
			if (list.size() > 0) {
				model.addAttribute("guideBoardMyList", list);
				
			} 
		}
		
		ArrayList<MyGuideMatching> list2 = guideMatchingService.selectMyGuideMatching(gm_id);
		
		if (list2.size() > 0) {
			model.addAttribute("guideMatchingMyList", list2);
		}
		
		return "guidematching/guideMatchingMyListPage";
	
	}
}
