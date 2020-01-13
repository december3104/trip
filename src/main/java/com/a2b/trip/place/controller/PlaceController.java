package com.a2b.trip.place.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.a2b.trip.member.model.vo.Member;
import com.a2b.trip.place.model.service.PlaceService;
import com.a2b.trip.place.model.vo.Place;
import com.a2b.trip.place.model.vo.PlaceDaylist;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	public PlaceController() {}
	
	//계획하기 페이지 메소드
	@RequestMapping("goplace.do")
	public String placeViewPage(Model model, Date place_date, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		String member_id = member.getMember_id();
		
		Map<String,?> flashMap = RequestContextUtils.getInputFlashMap(request);
		
		if(flashMap != null) {
			String sendDir = (String)flashMap.get("sendDir");
			
			//일정 생성 후 redirect로 받은 값 꺼내기
			if(sendDir.equals("insertDaylist")) {
				member_id = (String)flashMap.get("member_id");
			}
			
			//날짜 클릭으로 넘어올시 해당 날짜의 장소리스트 받기
			//Map<String,?> flashMap2 = RequestContextUtils.getInputFlashMap(request);
			if(sendDir.equals("dailyPlaces")) {
				member_id = (String)flashMap.get("member_id");
				String daily_name = (String)flashMap.get("daily_name");
				Date daily_date = (Date)flashMap.get("daily_date");
				int daily_no = (int)flashMap.get("daily_no");
				@SuppressWarnings("unchecked")
				ArrayList<Place> dailyPlaces = (ArrayList<Place>)flashMap.get("dailyPlaces");
				model.addAttribute("dailyPlaces", dailyPlaces);
				model.addAttribute("daily_name", daily_name);
				model.addAttribute("daily_date", daily_date);
				model.addAttribute("daily_no", daily_no);
			}
		}
		
		
		//로그인 한 회원이 가진 리스트(날짜,장소)가 있으면 같이 뿌려주기
		ArrayList<PlaceDaylist> daylist = placeService.selectDaylist(member_id);
		ArrayList<Place> placeList = placeService.selectPlaceList(member_id);
		
		//조회한 리스트에서 시작/끝 날짜 범위 내 날짜 리스트 만들기 -> 리스트 번호로 구분
		Map<Integer, ArrayList<Date>> dateMap = new HashMap<>();
		int key = 0;	//dateMap 에 넣을 key값용 변수 생성
		ArrayList<Date> valueList = new ArrayList<Date>();	//dataMap의 value값용 리스트 생성
		
		for(int i=0; i<daylist.size(); i++) {
			key = daylist.get(i).getDaylist_no();
			valueList = placeService.selectDatelist(key);
			dateMap.put(key, valueList);
		}
		
		String fileName = "place/placeView";
		
		if(daylist.size() < 0) {
			model.addAttribute("message", "계획하기 페이지로 이동 실패");
			fileName = "common/error";
		}
		else {
			model.addAttribute("placeList", placeList);
			model.addAttribute("daylist", daylist);
			model.addAttribute("dateMap", dateMap);
		}
		 
		return fileName;
	}
	
	//일정리스트 생성 메소드
	@RequestMapping(value="insertDaylist.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String insertDaylist(PlaceDaylist daylist, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		String member_id = member.getMember_id();
		daylist.setDaylist_user(member_id);
		
		//서비스로 전송하고 결과 받기
		int result = placeService.insertDaylist(daylist);
		
		if(result <=0) {	//날짜리스트 생성 실패시
			model.addAttribute("message", "일정리스트 생성 실패");
			return "common/error";
		}
		else {
			FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
			flashMap.put("member_id", daylist.getDaylist_user());
			flashMap.put("sendDir", "insertDaylist");	//어디에서 보낸건지 구분용
			return "redirect:goplace.do";
		}
		
	}
	
	//일정 클릭시 해당 날짜의 장소리스트 불러오기 메소드
	@RequestMapping(value="dailyPlaces.do", method={RequestMethod.POST, RequestMethod.GET})
	public String selectDailyPlaceList(Place place, String daylist_name, int daylist_no, HttpServletRequest request) {
		//장소 목록 조회
		ArrayList<Place> dailyPlaces = placeService.selectDailyPlaceList(place);
		
		FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
		flashMap.put("dailyPlaces", dailyPlaces);
		flashMap.put("member_id", place.getPlace_user());
		flashMap.put("daily_name", daylist_name);
		flashMap.put("daily_date", place.getPlace_date());
		flashMap.put("daily_no", daylist_no);
		flashMap.put("sendDir", "dailyPlaces");		//어디에서 보낸건지 구분용
		return "redirect:goplace.do";
	}
	
	//일정 전체 수정(이름,날짜 모두) 메소드
	@RequestMapping(value="updateDaylist.do", method=RequestMethod.POST)
	public String updateDaylist(PlaceDaylist daylist, Model model) {
		int result = placeService.updateDaylist(daylist);
		
		String fileName = "redirect:goplace.do";

		if(result <=0) {
			model.addAttribute("message", "일정 정보 수정 실패!");
		}
		
		return fileName;
	}
	
	/*//날짜 클릭시 해당 날짜의 장소리스트 불러오기 메소드
	@RequestMapping(value="dailyPlaces.do", method={RequestMethod.POST, RequestMethod.GET})
	public String selectDailyPlaceList(Place place, String daylist_name, Model model, RedirectAttributes redirectAttr) {

		//장소 목록 조회
		ArrayList<Place> placeList = placeService.selectDailyPlaceList(place);
		
		String fileName = "place/placeView";
		
		if(placeList.size() <0) {
			model.addAttribute("message", "해당 날자의 장소리스트 조회 실패");
			fileName = "common/error";
		}
		else {
			model.addAttribute("dailyPlaces", placeList);
			model.addAttribute("daily_name", daylist_name);
			model.addAttribute("daily_date", place.getPlace_date());
		}
		
		return fileName;
	}*/
	
	//장소 리스트에서 장소 삭제 처리 메소드
	@RequestMapping(value="deletePlace.do", method= RequestMethod.POST)
	public void deletePlace(String place_code, HttpServletResponse response) throws IOException {
		int result = placeService.deletePlace(place_code);
		
		if(result >0) {
			PrintWriter out = response.getWriter();
			out.write("div_"+ place_code);
			out.flush();
			out.close();
		}
	}
	
	//일정 삭제 처리 메소드
	@RequestMapping(value="deleteDaylist.do", method= RequestMethod.POST)
	public void deleteDaylist(int daylist_no, HttpServletResponse response) throws IOException {
		int result =  placeService.deleteDaylist(daylist_no);
		
		if(result >0) {
			PrintWriter out = response.getWriter();
			out.write("div_"+ daylist_no);
			out.flush();
			out.close();
		}
	}
	
	//지도 연습 페이지로 넘기기
	@RequestMapping("mapPractice.do")
	public String mapPractice() {
		return "place/mapPractice";
	}
}
