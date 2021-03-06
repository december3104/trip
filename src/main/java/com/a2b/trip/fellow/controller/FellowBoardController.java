package com.a2b.trip.fellow.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.service.FellowBoardService;
import com.a2b.trip.fellow.model.vo.Fellow;
import com.a2b.trip.fellow.model.vo.FellowBoard;
import com.a2b.trip.fellow.model.vo.FellowMatching;
import com.a2b.trip.location.model.vo.Location;
import com.a2b.trip.qna.model.vo.Qna;

@Controller
public class FellowBoardController {

	@Autowired
	private FellowBoardService fellowBoardService;
	
	public FellowBoardController() {}
	
	@RequestMapping("selectAllFellowBoard.do")
	public String fellowBoard(Page page, Model model) {
		
		int totalCount = fellowBoardService.selectTotal();	//	게시물 총 갯수(현제 db에 저장된 값)
		int currentPage = page.getCurrentPage();
		page.setTotalCount(totalCount);	//	전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
		page.calcRow(currentPage, page.getContentNum());	//	db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage);	//	페이지 	
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum());	//	맨 마지막 페이지 계산
		
		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
		
		ArrayList<FellowBoard> fellowBoardList = fellowBoardService.selectAllFellowBoard(page);
		
		model.addAttribute("fellowBoardList", fellowBoardList);
		model.addAttribute("page", page);
		return "fellow/fellowBoard";
	}
	
	//동행찾기 상세 보기
	@RequestMapping("selectOneFellowBoard.do")
	public String selectOneFellowBoard(@RequestParam("fb_no") int fb_no, FellowBoard fb, FellowMatching fm, Model model) {
		fb = fellowBoardService.selectOneFellowBoard(fb_no);
		ArrayList<FellowMatching> fmList = fellowBoardService.selectAllFellowMatching(fb_no);
		
		model.addAttribute("fb", fb);
		model.addAttribute("fmList", fmList);
		
		return "fellow/fellowBoardDetailView";
	}
	
	//동행찾기 글 쓰기 페이지로 이동
	@RequestMapping("goPageInsertFellowBoard.do")
	public String goPageInsertFellowBoard(Location location, Model model) {
		ArrayList<Location> locationList = fellowBoardService.selectAllLocation();
		model.addAttribute("locationList", locationList);
		return "fellow/fellowBoardForm";
	}
	
	//동행찾기 글 쓰기
	@RequestMapping(value="insertFellowBoard.do", method= RequestMethod.POST)
	public String insertFellowBoard(Page page, FellowBoard fb, Model model) {
		// 페이지 이름 정해 줄 String
		String pageName = "";
		
		int result = fellowBoardService.insertFellowBoard(fb);
		
		if(result>0) {
			int totalCount = fellowBoardService.selectTotal();	//	게시물 총 갯수(현제 db에 저장된 값)
			int currentPage = page.getCurrentPage();
			page.setTotalCount(totalCount);	//	전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
			page.calcRow(currentPage, page.getContentNum());	//	db에서 조회할 ROWNUM 시작과 끝 계산
			page.saveCurrentBlock(currentPage);	//	페이지 	
			page.saveLastBlock(totalCount);
			page.calcPage(totalCount, page.getContentNum());	//	맨 마지막 페이지 계산
			
			page.prevnext(currentPage);
			page.saveStartPage(page.getCurrentBlock());
			page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
			
			ArrayList<FellowBoard> fellowBoardList = fellowBoardService.selectAllFellowBoard(page);
			
			model.addAttribute("fellowBoardList", fellowBoardList);
			model.addAttribute("page", page);
			
			pageName = "fellow/fellowBoard";
		}else {
			System.out.println("에러페이지로");
		}
		
		return pageName;
	}
	
	//동행찾기 수정 페이지로 이동
	@RequestMapping("goPageUpdateFellowBoard.do")
	public String goPageUpdateFellowBoard(@RequestParam("fb_no") int fb_no, FellowBoard fb, Model model) {
		
		fb = fellowBoardService.selectOneFellowBoard(fb_no);
		ArrayList<Location> locationList = fellowBoardService.selectAllLocation();
		
		model.addAttribute("locationList", locationList);
		model.addAttribute("fb", fb);
		
		return "fellow/fellowBoardUpdateForm";
	}
	
	// 한명 조회
	@RequestMapping(value="selectMyFellowBoardOne.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectMyFellowBoardOne(@RequestParam("fm_id") String fm_id, HttpServletResponse response) throws UnsupportedEncodingException {
		
		Fellow fellow = fellowBoardService.selectMyFellowBoardOne(fm_id);

		response.setContentType("application/json; charset=utf-8");
		
		JSONObject job = new JSONObject();
		if (fellow.getMember_profile_rename() != null) {
			job.put("fellowProfile", URLEncoder.encode("member_profile/" + fellow.getMember_profile_rename(), "utf-8"));
		} 
		if (fellow.getMember_profile_rename() == null) {
			job.put("fellowProfile", URLEncoder.encode("molly.png", "utf-8"));
		}
		job.put("fellowName", URLEncoder.encode(fellow.getMember_name(), "utf-8"));
		job.put("fellowId", fellow.getFm_id());
		job.put("fellowNumber", fellow.getFm_number());
		job.put("fellowContry", URLEncoder.encode(fellow.getFb_contry(), "utf-8"));
		job.put("fellowCity", URLEncoder.encode(fellow.getFb_city(), "utf-8"));
		job.put("fellowStartDate", fellow.getFb_start_date().toString());
		job.put("fellowEndDate", fellow.getFb_end_date().toString());
		job.put("fellowDate", fellow.getFm_date().toString());
		job.put("fellowContent", URLEncoder.encode(fellow.getFm_content(), "utf-8"));

		
		return job.toJSONString();
	}
	
	@RequestMapping("selectListMyFellowBoard.do")
	public String selectListMyFellowBoard(Page page, Model model) {
		int totalCount = fellowBoardService.selectMyTotal(page.getQna_id()); // 내가 쓴 게시물 총 갯수(현제 db에 저장된 값)
		int currentPage = page.getCurrentPage();
		page.setTotalCount(totalCount); // 전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
		page.calcRow(currentPage, page.getContentNum()); // db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage); // 페이지
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum()); // 맨 마지막 페이지 계산

		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
		
		ArrayList<FellowBoard> fbList = fellowBoardService.selectListMyFellowBoard(page);
		model.addAttribute("fbList", fbList);

		return "fellow/fellowBoardMyList";
	}
	
	//동행찾기 검색
	@RequestMapping("selectListFellowBoard.do")
	public String selectListFellowBoard(Page page, Model model) {
		String pageName = "";	
		
		int totalCount = fellowBoardService.selectSearchTotal(page.getSearch()); // 게시물 총 갯수(현제 db에 저장된 값)
		int currentPage = page.getCurrentPage();
		page.setTotalCount(totalCount); // 전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
		page.calcRow(currentPage, page.getContentNum()); // db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage); // 페이지
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum()); // 맨 마지막 페이지 계산

		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
		
		ArrayList<FellowBoard> fellowBoardList = fellowBoardService.selectListFellowBoard(page);
		
		model.addAttribute("fellowBoardList", fellowBoardList);
		model.addAttribute("page", page);

		pageName = "fellow/fellowBoardSearch";
		
		
		return pageName;
	}
	
	// 동행찾기 내 글 수정
	@RequestMapping(value="updateFellowBoard.do", method=RequestMethod.POST)
	public String updateFellowBoard(FellowBoard fb, Page page, Model model) {
		// 페이지 이름 정해 줄 String
		String pageName = "";
		
		int result = fellowBoardService.updateFellowBoard(fb);
		
		if(result>0) {
			int totalCount = fellowBoardService.selectTotal();	//	게시물 총 갯수(현제 db에 저장된 값)
			int currentPage = page.getCurrentPage();
			page.setTotalCount(totalCount);	//	전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
			page.calcRow(currentPage, page.getContentNum());	//	db에서 조회할 ROWNUM 시작과 끝 계산
			page.saveCurrentBlock(currentPage);	//	페이지 	
			page.saveLastBlock(totalCount);
			page.calcPage(totalCount, page.getContentNum());	//	맨 마지막 페이지 계산
			
			page.prevnext(currentPage);
			page.saveStartPage(page.getCurrentBlock());
			page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
			
			ArrayList<FellowBoard> fellowBoardList = fellowBoardService.selectAllFellowBoard(page);
			
			model.addAttribute("fellowBoardList", fellowBoardList);
			model.addAttribute("page", page);
			
			pageName = "redirect:selectOneFellowBoard.do?fb_no="+fb.getFb_no();
		}else {
			System.out.println("에러페이지로");
		}
		
		return pageName;
	}
	
	@RequestMapping("deleteFellowBoard.do")
	public String deleteFellowBoard(@RequestParam("fb_no")int fb_no) {
		int result = fellowBoardService.deleteFellowBoard(fb_no);

		if (result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
			return "redirect:selectAllFellowBoard.do";
	}
	
}
