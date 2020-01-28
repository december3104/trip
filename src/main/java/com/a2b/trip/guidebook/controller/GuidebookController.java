package com.a2b.trip.guidebook.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.fellow.model.vo.Fellow;
import com.a2b.trip.fellow.model.vo.FellowBoard;
import com.a2b.trip.guidebook.model.service.GuidebookService;
import com.a2b.trip.guidebook.model.vo.Guidebook;
import com.a2b.trip.location.model.vo.Location;
import com.a2b.trip.member.model.vo.Member;
import com.a2b.trip.notice.model.vo.Notice;
import com.a2b.trip.place.model.service.PlaceService;
import com.a2b.trip.place.model.vo.Place;
import com.a2b.trip.place.model.vo.PlaceDaylist;

@Controller
public class GuidebookController {
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
		private static final Logger logger = LoggerFactory.getLogger(GuidebookController.class);

	@Autowired
	private GuidebookService guidebookService;
	
	@Autowired
	private PlaceService placeService;
	
	public GuidebookController() {}
	
	//가이드북 제작하기 페이지
	@RequestMapping("makeGuidebook.do")
	   public String makeGuidebook(Model model, HttpServletRequest request) {
		//일정 불러오기
			HttpSession session = request.getSession(false);
			Member sessionMember = (Member)session.getAttribute("loginMember");
			String memberId = sessionMember.getMember_id();

			List<PlaceDaylist> gbdaylist;		

			gbdaylist = placeService.guideDaylist(memberId);	
			
			model.addAttribute("gbdaylist",gbdaylist);	

			return "guidebook/makeGuidebook";

		}
		

	
	//가이드북 생성하기
	@RequestMapping(value="insertGuidebook.do", method = {RequestMethod.POST})

	   public String guidebookInsertMethod(Guidebook guidebook, Model model, HttpServletRequest request) {
		   //성공하면 guidebook, 에러났을때 model
		
		HttpSession session = request.getSession(false);
		Member sessionMember = (Member)session.getAttribute("loginMember");
		String memberId = sessionMember.getMember_id();
		
		guidebook.setBook_id(memberId);
		
		System.out.println(guidebook.getBook_name() + ", " + guidebook.getTravel_detail() + ". " + guidebook.getTravel_theme() + ", " + guidebook.getTravel_start_date() + ", " + guidebook.getTravel_end_date() + ", " + guidebook.getBook_id());
		
		 int result = guidebookService.insertGuidebook(guidebook);
		   
		   String viewFileName = "guidebook/updateGuidebook";
		   
		 if(result <= 0) { //제작 실패시
			model.addAttribute("message", "가이드북 제작실패!");
			viewFileName = "common/error";		   
		   }
		   return viewFileName;
	   }
	
	
	
	//가이드북 수정
	@RequestMapping(value="updateGuidebook.do", method=RequestMethod.POST)
	public String guidebookUpdateMethod(Guidebook guidebook, Model model, HttpServletRequest request) {
		
		 int result = guidebookService.updateGuidebook(guidebook);
		 
		 System.out.println(result);
		
		String viewFileName = "redirect:/updateGuidebook.do";
		
		if(result <= 0) { //수정 실패시
			model.addAttribute("message", "가이드북  수정 실패!");
			viewFileName = "common/error";		   
		   }
		
		return viewFileName;
	}
	
	@RequestMapping(value="plusGbdate.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectMyFellowBoardOne(@RequestParam("member_id") int memberId, HttpServletResponse response) throws UnsupportedEncodingException {
		
		PlaceDaylist gbday = placeService.guideDaylistOne(memberId);	

		response.setContentType("application/json; charset=utf-8");
		
		JSONObject job = new JSONObject();
		
		job.put("daylist_start", gbday.getDaylist_start().toString());
		job.put("daylist_end", gbday.getDaylist_end().toString());
		

		
		return job.toJSONString();
	}
	
	
}
