package com.a2b.trip.fellow.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.service.FellowBoardService;
import com.a2b.trip.fellow.model.vo.FellowBoard;

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
		page.calcRow(currentPage);	//	db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage);	//	페이지 	
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum());	//	맨 마지막 페이지 계산
		
		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
		
		
		ArrayList<FellowBoard> fellowBoardList = fellowBoardService.selectAllFellowBoard(page);
		
		if (fellowBoardList.size() > 0) {
		
		}
		model.addAttribute("fellowBoardList", fellowBoardList);
		model.addAttribute("page", page);
		return "fellow/fellowBoard";
	}
}
