package com.a2b.trip.qna.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.a2b.trip.common.Page;
import com.a2b.trip.qna.model.service.QnaService;
import com.a2b.trip.qna.model.vo.Qna;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	public QnaController() {}
	
	@RequestMapping("qna.do")
	public String selectAllQna(Page page, Model model) {
		
		int totalCount = qnaService.selectTotal();	//	게시물 총 갯수(현제 db에 저장된 값)
		int currentPage = page.getCurrentPage();
		page.setTotalCount(totalCount);	//	전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
		page.calcRow(currentPage);	//	db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage);	//	페이지 	
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum());	//	맨 마지막 페이지 계산
		
		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
		
		
		ArrayList<Qna> qnaList = qnaService.selectAllQna(page);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("page", page);
		return "qna/qna";
	}
	
	@RequestMapping("goPageInsertQna.do")
	public String goPageInsertQna() {
		return "qna/qnaForm";
	}
	
	@RequestMapping(value="insertQna.do", method=RequestMethod.POST)
	public String insertQna(Page page, Qna qna, Model model) {
		String a = qna.getQna_title();
		String b = qna.getQna_content();
		String c = qna.getQna_id();
		String e = qna.getQna_comment();
		
		if(qna.getQna_alarm() == null)
			qna.setQna_alarm("N");
		
		System.out.println("제목 : "+ a + ", 내용 : " + b + ", 아이디 : " + c + ", 알람 : " + qna.getQna_alarm() + ", 답글 : " + e);
		int result = qnaService.insertQna(qna);
		
		
		int totalCount = qnaService.selectTotal();	//	게시물 총 갯수(현제 db에 저장된 값)
		int currentPage = page.getCurrentPage();
		page.setTotalCount(totalCount);	//	전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
		page.calcRow(currentPage);	//	db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage);	//	페이지 	
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum());	//	맨 마지막 페이지 계산
		
		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
		
		
		ArrayList<Qna> qnaList = qnaService.selectAllQna(page);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("page", page);
		return "qna/qna";
	}
}
