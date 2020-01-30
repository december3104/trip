package com.a2b.trip.guidebook.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.a2b.trip.guidebook.model.service.GuidebookService;
import com.a2b.trip.guidebook.model.vo.Guidebook;
import com.a2b.trip.member.model.vo.Member;
import com.a2b.trip.place.model.service.PlaceService;
import com.a2b.trip.place.model.vo.PlaceAll;
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
			
				HttpSession session = request.getSession(false);
				Member sessionMember = (Member)session.getAttribute("loginMember");
				String memberId = sessionMember.getMember_id();

				//일정 불러오기
				List<PlaceDaylist> gbdaylist;
				
				gbdaylist = placeService.guideDaylist(memberId);	

				
				model.addAttribute("gbdaylist",gbdaylist);	
				
				
				//장소 불러오기
				List<PlaceDaylist> gbplacelist;
				
				gbplacelist = placeService.guideDaylist(memberId);	

				
				model.addAttribute("gbplacelist",gbplacelist);	
				
				
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
		
		//일정 불러와서 추가하기
		@RequestMapping(value="plusGbdate.do", method=RequestMethod.GET)
		public String guideDaylistOne(@RequestParam("daylist_no") String daylist_no, HttpServletResponse response) throws IOException {
			logger.info(daylist_no);
			
			PlaceDaylist gbday = placeService.guideDaylistOne(daylist_no);	

			System.out.println("gbday:" + gbday);
			
			
			JSONObject job = new JSONObject();
		
			
			job.put("daylist_start", gbday.getDaylist_start().toString());
			String ss = gbday.getDaylist_start().toString();
			System.out.println("daylist_start:" + ss);
			
			String ee = gbday.getDaylist_end().toString();
			job.put("daylist_end", gbday.getDaylist_end().toString());
			System.out.println("daylist_end:"+ee);
			

			System.out.println(job);
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(job.toJSONString()); //객체 정보를 문자열로 바꾸어 내보냄.
			out.flush();
			out.close();
			
			return job.toJSONString();
			
		}
		
		//장소 불러오기
		/*@RequestMapping(value="Placelist.do") 
		public ModelAndView placeNameList(@RequestParam("no") String daylist_no,ModelAndView mv) {

			PlaceDaylist pdl = placeService.guideDaylistOne(daylist_no);
			
			ArrayList<Place> placelist = placeService.guidePlacelist(pdl);
			
			
			
		return mv;
		}*/
		
		@RequestMapping(value="Placelist.do", method=RequestMethod.GET)
		public void selectPlacelist(@RequestParam("placelist_no") String daylist_no, PlaceAll placeall, HttpServletResponse response) throws IOException {
			logger.info("daylist_no : " + daylist_no);
			
			ArrayList<PlaceAll> gbplace = placeService.guidePlacelist(daylist_no);
			logger.info("gbplace : " + gbplace);
			System.out.println("gbplace:" + gbplace);
			
			
			//전송용 객체 준비
					JSONObject sendJson = new JSONObject();
					//list 안의 객체들을 저장할 json 배열 객체 생성
					JSONArray jarr = new JSONArray();
		
					for(PlaceAll pl : gbplace) {
						
						JSONObject job = new JSONObject();
						job.put("place_name", URLEncoder.encode(pl.getPlace_name(), "UTF-8"));
						String el = pl.getPlace_name();
						System.out.println("getPlace_name:"+el);
								
						jarr.add(job);
						
						System.out.println(job);
					}		
			
					sendJson.put("list", jarr);
			
					response.setContentType("application/json");
					PrintWriter out = response.getWriter();
					out.print(sendJson.toJSONString());
					out.flush();
					out.close();
					
					
			
		}
	
	// 내 가이드북 보기 페이지로 이동
	@RequestMapping("moveGuidebookMyListPage.do")
	public String moveGuidebookMyListPage() {
		return "guidebook/guidebookMyListPage";
	}
	
	// 내 가이드북 보기 정보 가져오기
	@RequestMapping("selectGuidebookMyList.do")
	public String selectGuidebookMyList(Guidebook guidebook, HttpServletRequest request, Model model) {
		// 세션에서 정보 꺼내기
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		String memberId = member.getMember_id();
		ArrayList<Guidebook> list = guidebookService.selectGuidebookMyList(memberId);
		model.addAttribute("myGuidebookList", list);
		return "guidebook/guidebookMyListPage";
	}
	
	// 내 가이드북 삭제 처리
	@RequestMapping(value="deleteGuidebook.do", method=RequestMethod.POST)
	public void deleteGuidebook(@RequestParam("book_no") String book_no, HttpServletResponse response) throws IOException {
		int result = guidebookService.deleteGuidebook(book_no);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (result > 0) {
			out.append("OK");
			out.flush();
		} else {
			out.append("NO");
			out.flush();
		}
		out.close();
	}
	
	// 내 가이드북 상세 보기
	@RequestMapping("selectMyGuidebookOne.do")
	public String selectMyGuidebookOne(@RequestParam("book_no") String book_no, Model model) {
		Guidebook guidebook = guidebookService.selectMyGuidebookOne(book_no);
		if (guidebook != null) {
			model.addAttribute("myGuidebookOne", guidebook);
		} 
		return "guidebook/guidebookMyPage";
	}
	
}
