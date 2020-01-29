package com.a2b.trip.guidematching.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.guide.model.service.GuideService;
import com.a2b.trip.guide.model.vo.Guide;
import com.a2b.trip.guidematching.model.service.GuideBoardService;
import com.a2b.trip.guidematching.model.service.GuideMatchingService;
import com.a2b.trip.guidematching.model.vo.GuideBoard;
import com.a2b.trip.guidematching.model.vo.GuideBoardInsert;
import com.a2b.trip.guidematching.model.vo.GuideMatching;
import com.a2b.trip.guidematching.model.vo.GuideSearch;
import com.a2b.trip.guidematching.model.vo.MyGuideMatching;
import com.a2b.trip.location.model.service.LocationService;
import com.a2b.trip.location.model.vo.Location;
import com.a2b.trip.member.model.vo.Member;

@Controller
public class GuideMatchingController {

	@Autowired
	private GuideMatchingService guideMatchingService;
	
	@Autowired
	private GuideBoardService guideBoardService;
	
	@Autowired
	private GuideService guideService;
	
	@Autowired
	private LocationService locationService;
	
	
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
	
//	ssm 2020.01.15
//	페이지 이동 처리
	@RequestMapping("guideMatchingPage.do")
	public ModelAndView guideMatchingPage(ModelAndView mv,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		if(member != null) {
			ArrayList<Location> list = locationService.selectAll();
			
			mv.addObject("loc", list);
			mv.setViewName("guidematching/guideMatchingPage");
		}else {
			String text = "로그인 후 이용가능합니다.";
			mv.addObject("text",text);
			mv.setViewName("common/error");
		}
		
		
		return mv;
	}
	
//	현지 가이드 매칭 리스트 조회 ajax requestBody = 클라이언트에서 json 보내면 컨트롤러에서도 json으로 받게해주는 어노테이션
	@RequestMapping(value="/selectListGM.do", method=RequestMethod.POST)
	@ResponseBody 
	public Object selectListGM(@RequestBody GuideSearch guideSearch) {
		logger.info(guideSearch.toString());
		ArrayList<GuideBoard> list = guideBoardService.selectListGuideBoard(guideSearch);
		logger.info(list.toString());
		
		return list;
	}
	
//	가이드 보드 상세보기
	@RequestMapping(value="/selectGB.do", method=RequestMethod.POST)
	@ResponseBody
	public Object selectGB(@RequestParam("gb_no")String gb_no) {
		logger.info(gb_no);
		GuideBoard gb = guideBoardService.selectGB(gb_no);
		return gb;
	}
	
//	이미 신청했는지 여부 확인
	@RequestMapping(value="chk_GM.do", method=RequestMethod.POST)
	public void chk_GM(@RequestParam("gb_no") String gb_no, @RequestParam("gm_id") String gm_id, HttpServletResponse response) throws IOException {
		logger.info(gb_no);
		logger.info(gm_id);
		GuideMatching gm = new GuideMatching();
		gm.setGb_no(Integer.parseInt(gb_no));
		gm.setGm_id(gm_id);
		logger.info("GM : "+gm);
		GuideMatching guideM = guideMatchingService.chk_GM(gm);
		String str = "";
		if(guideM == null) {
			logger.info("없단다~");
			str = "OK";
		}else {
			logger.info("있단다~");
			str = "NO";
		}
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(str);
		out.flush();
		out.close();
	}
	
//	가이드 상세보기 신청 버튼
	@RequestMapping(value="updateDetailAcceptGM.do", method=RequestMethod.POST)
	public String updateDetailAcceptGM(@RequestParam("no") String gb_no,@RequestParam("chk_number") int chk_number ,GuideBoard gb,GuideMatching gm,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		
		gb = guideBoardService.selectGB(gb_no);
		int gb_number_update = gb.getGb_number()+chk_number;
		gb.setGb_number(gb_number_update);
		
		int result1 = 0;
		int result2 = 0;
		
		if(gb.getGb_max_number() == gb.getGb_number()) {
			result1 = guideBoardService.updateDetailAcceptGM_cut(gb);
			gm.setGb_no(Integer.parseInt(gb_no));
			gm.setGm_id(member.getMember_id());
			gm.setGm_number(chk_number);
			logger.info("gm : "+gm.toString());
			result2 = guideMatchingService.insertGuideMatching(gm);
		}else {
			result1 = guideBoardService.updateDetailAcceptGM(gb);
			gm.setGb_no(Integer.parseInt(gb_no));
			gm.setGm_id(member.getMember_id());
			gm.setGm_number(chk_number);
			logger.info(gm.toString());
			result2 = guideMatchingService.insertGuideMatching(gm);
		}
		String viewFileName = "";
		if(result1 == 1) {
			viewFileName = "guidematching/guideMatchingPage";
		}else {
			viewFileName = "comment/error";
		}
		return viewFileName;
	}
	
	
	@RequestMapping("insertWordGuideBoardPage.do")
	public String insertWordGuideBoardPage(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		String viewFileName = "";
		if(member != null) {
			viewFileName = "guidematching/guideMatchingBoardInsertPage";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	@RequestMapping(value="insertWordGuideBoard.do", method=RequestMethod.POST)
	public String insertWordGuideBoard(GuideBoardInsert gbi,GuideBoard gb,HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		Guide guide = guideService.selectOne(member.getMember_id());
		logger.info(guide.toString());
		
		gb.setLoc_code(guide.getLoc_code());
		gb.setMember_gender(member.getMember_gender());
		gb.setGuide_lang(guide.getGuide_lang());
		gb.setGuide_grade(guide.getGuide_grade());
		gb.setGuide_profile_original(guide.getGuide_profile_original());
		gb.setGuide_profile_rename(guide.getGuide_profile_rename());
		gb.setMember_name(member.getMember_name());
		gb.setGuide_say(guide.getGuide_say());
		gb.setGb_id(member.getMember_id());
		gb.setGb_start_date(gbi.getGb_start_date());
		gb.setGb_end_date(gbi.getGb_end_date());
		gb.setGb_route(gbi.getGb_route());
		gb.setGb_price(gbi.getGb_price());
		gb.setGb_min_number(gbi.getGb_min_number());
		gb.setGb_max_number(gbi.getGb_max_number());
		gb.setGb_close_date(gbi.getGb_close_date());
		gb.setGb_title(gbi.getGb_title());
		logger.info(gb.toString());
		
		int result = guideBoardService.insertWordGuideBoard(gb);
		
		String viewFileName = "";
		
		if(result == 1 ) {
			viewFileName = "redirect:/guideMatchingPage.do";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	@RequestMapping(value="close_gb.do", method=RequestMethod.POST)
	public int close_gb(@RequestParam("gb_no")String gb_no) {
		int result = guideBoardService.close_gb(gb_no);
		return result;
	}
//	end

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
