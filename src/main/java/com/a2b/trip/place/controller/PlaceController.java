package com.a2b.trip.place.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.a2b.trip.place.model.service.PlaceService;
import com.a2b.trip.place.model.vo.Place;
import com.a2b.trip.place.model.vo.PlaceDaylist;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	public PlaceController() {}
	
	//계획하기 페이지로 이동처리용 메소드
	@RequestMapping("goplace.do")
	public String placeViewPage(Model model, String member_id) {
		
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
			/*for(int j=0; j<valueList.size(); j++) {
				java.util.Date utilDate = new java.util.Date();		
				utilDate = valueList.get(j);
				java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());	//util.Date를 sql.Date로 바꿔서 map에 집어넣음
				dateMap.put(key, sqlDate);
			}*/
			dateMap.put(key, valueList);
		}
		
		String fileName = "place/placeView";
		
		if(daylist.size() < 0) {
			model.addAttribute("message", "계획하기 페이지로 이동 실패");
			fileName = "common/error";
		}
		else {
			model.addAttribute("daylist", daylist);
			model.addAttribute("dateMap", dateMap);
			model.addAttribute("placeList", placeList);
		}
		 
		return fileName;
	}
	
	//날짜리스트 생성 메소드
	@RequestMapping(value="insertDaylist.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String insertDaylist(PlaceDaylist daylist, Model model, RedirectAttributes redirectAttr) {
		//서비스로 전송하고 결과 받기
		int result = placeService.insertDaylist(daylist);
		
		String fileName = "place/placeView";
		
		if(result <=0) {	//날짜리스트 생성 실패시
			model.addAttribute("message", "날짜리스트 생성 실패");
			fileName = "common/error";
		}
		else {
//			redirectAttr.addFlashAttribute("member_id", daylist.getDaylist_user());
//			fileName = "redirect:goplace.do?member_id="+ daylist.getDaylist_user();
			placeViewPage(model, daylist.getDaylist_user());
		}
		
		return fileName;
	}
	
	//날짜 클릭시 해당 날짜의 장소리스트 불러오기 메소드
	@RequestMapping(value="dailyPlaces.do", method={RequestMethod.POST, RequestMethod.GET})
	public String selectDailyPlaceList(Place place, Model model, RedirectAttributes redirectAttr) {

		//장소 목록 조회
		ArrayList<Place> placeList = placeService.selectDailyPlaceList(place);
		
		String fileName = "place/placeView";
		
		if(placeList.size() <0) {
			model.addAttribute("message", "해당 날자의 장소리스트 조회 실패");
			fileName = "common/error";
		}
		else {
			model.addAttribute("dailyPlaces", placeList);
//			redirectAttr.addFlashAttribute("member_id", place.getPlace_user());
//			fileName = "redirect:goplace.do?member_id="+ place.getPlace_user();
		}
		
		return fileName;
	}
	
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
	
}
