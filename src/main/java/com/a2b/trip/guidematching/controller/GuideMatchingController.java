package com.a2b.trip.guidematching.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.a2b.trip.fellow.model.vo.Fellow;
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
	
	// 가이드 정보 보기
	@RequestMapping("selectMyGuideMatchingOne.do")
	@ResponseBody
	public String selectMyGuideMatchingOne(@RequestParam ("gb_id") String gb_id, HttpServletResponse response) throws UnsupportedEncodingException {
		
		MyGuideMatching guideMatchingOne = guideMatchingService.selectMyGuideMatchingOne(gb_id);

		response.setContentType("application/json; charset=utf-8");
		
		JSONObject job = new JSONObject();

		job.put("guideName", URLEncoder.encode(guideMatchingOne.getMember_name(), "utf-8"));
		job.put("guideGender", guideMatchingOne.getMember_gender());
		job.put("guideStartDate", guideMatchingOne.getGb_start_date().toString());
		job.put("guideEndDate", guideMatchingOne.getGb_end_date().toString());
		job.put("guideRoute", URLEncoder.encode(guideMatchingOne.getGb_route(), "utf-8"));
		job.put("guideIntro", URLEncoder.encode(guideMatchingOne.getGuide_say(), "utf-8"));
		job.put("guideTitle", URLEncoder.encode(guideMatchingOne.getGb_title(), "utf-8"));
		job.put("guideLang", URLEncoder.encode(guideMatchingOne.getGuide_lang(), "utf-8"));
		job.put("guideProfile", URLEncoder.encode("guide_profile/" + guideMatchingOne.getGuide_profile_rename(), "utf-8"));
		
		return job.toJSONString();
	}
}
