package com.a2b.trip.fellow.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.service.FellowBoardService;
import com.a2b.trip.fellow.model.vo.FellowBoard;
import com.a2b.trip.fellow.model.vo.FellowMatching;
import com.a2b.trip.location.model.vo.Location;

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
	
	//동행찾기 글 보기
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
}
