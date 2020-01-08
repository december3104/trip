package com.a2b.trip.fellow.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.a2b.trip.fellow.model.service.FellowMatchingService;
import com.a2b.trip.fellow.model.vo.Fellow;
import com.a2b.trip.member.model.vo.Member;

@Controller
public class FellowMatchingController {

	@Autowired
	private FellowMatchingService fellowMatchingService;
	
	public FellowMatchingController() {}
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(FellowMatchingController.class);
		
	// 동행 매칭 기록 목록 보기
	@RequestMapping("selectMyFellowMatching.do")
	public String selectMyFellowMatching(Model model, HttpServletRequest request) {
		// 세션에서 정보 꺼내기
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		String fm_id = member.getMember_id();
		
		ArrayList<Fellow> list = fellowMatchingService.selectMyFellowMatching(fm_id);
		
		model.addAttribute("fellowMatchingMyList", list);
		
		return "fellow/fellowMatchingMyListPage";
	}
	
	@RequestMapping(value="selectMyFellowMatchingOne.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectMyFellowMatchingOne(@RequestParam ("fb_id") String fb_id, Model model, HttpServletResponse response) throws UnsupportedEncodingException {
		
		Fellow fellow = fellowMatchingService.selectMyFellowMatchingOne(fb_id);

		response.setContentType("application/json; charset=utf-8");
		
		JSONObject job = new JSONObject();
		if (fellow.getMember_profile_rename() != null) {
			job.put("fellowProfile", URLEncoder.encode("member_profile/" + fellow.getMember_profile_rename(), "utf-8"));
		} 
		if (fellow.getMember_profile_rename() == null) {
			job.put("fellowProfile", URLEncoder.encode("molly.png", "utf-8"));
		}
		job.put("fellowName", URLEncoder.encode(fellow.getMember_name(), "utf-8"));
		job.put("fellowId", fellow.getFb_id());
		job.put("fellowContry", URLEncoder.encode(fellow.getFb_contry(), "utf-8"));
		job.put("fellowCity", URLEncoder.encode(fellow.getFb_city(), "utf-8"));
		job.put("fellowStartDate", fellow.getFb_start_date().toString());
		job.put("fellowEndDate", fellow.getFb_end_date().toString());
		job.put("fellowTitle", URLEncoder.encode(fellow.getFb_title(), "utf-8"));
		job.put("fellowContent", URLEncoder.encode(fellow.getFb_content(), "utf-8"));
		
		return job.toJSONString();
	}
}