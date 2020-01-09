/*
 * QnA 글쓰기
 * QnA 상세보기
 * */

package com.a2b.trip.qna.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.a2b.trip.common.Page;
import com.a2b.trip.qna.model.service.QnaService;
import com.a2b.trip.qna.model.vo.Qna;
import com.a2b.trip.qna.model.vo.QnaComment;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	public QnaController() {
	}

	@RequestMapping("qna.do")
	public String selectAllQna(Page page, Model model) {

		int totalCount = qnaService.selectTotal(); // 게시물 총 갯수(현제 db에 저장된 값)
		int currentPage = page.getCurrentPage();
		page.setTotalCount(totalCount); // 전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
		page.calcRow(currentPage, page.getContentNum()); // db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage); // 페이지
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum()); // 맨 마지막 페이지 계산

		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());

		ArrayList<Qna> qnaList = qnaService.selectAllQna(page);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("page", page);
		return "qna/qna";
	}

	// QnA 글쓰기 페이지로 이동
	@RequestMapping("goPageInsertQna.do")
	public String goPageInsertQna() {
		return "qna/qnaForm";
	}

	// QnA 글쓰기
	@RequestMapping(value = "insertQna.do", method = RequestMethod.POST)
	public String insertQna(Page page, Qna qna, Model model) {
		// 페이지 이름 정해 줄 String
		String pageName = "";

		if (qna.getQna_alarm() == null)
			qna.setQna_alarm("N");

		int result = qnaService.insertQna(qna);

		if (result > 0) {

			int totalCount = qnaService.selectTotal(); // 게시물 총 갯수(현제 db에 저장된 값)
			int currentPage = page.getCurrentPage();
			page.setTotalCount(totalCount); // 전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
			page.calcRow(currentPage, page.getContentNum()); // db에서 조회할 ROWNUM 시작과 끝 계산
			page.saveCurrentBlock(currentPage); // 페이지
			page.saveLastBlock(totalCount);
			page.calcPage(totalCount, page.getContentNum()); // 맨 마지막 페이지 계산

			page.prevnext(currentPage);
			page.saveStartPage(page.getCurrentBlock());
			page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());

			ArrayList<Qna> qnaList = qnaService.selectAllQna(page);
			model.addAttribute("qnaList", qnaList);
			model.addAttribute("page", page);

			pageName = "qna/qna";
		} else {
			System.out.println("에러페이지로");
		}

		return pageName;
	}

	// QnA 상세보기
	@RequestMapping("selectDetailViewQna.do")
	public String selectDetailViewQna(@RequestParam("qna_no") int qna_no, Qna qna, Model model, QnaComment QC) {
		qna = qnaService.selectDetailViewQna(qna_no);
		QC = qnaService.selectQnaComment(qna_no);
		model.addAttribute("qna", qna);
		model.addAttribute("QC", QC);
		return "qna/qnaDetailView";
	}

	// QnA 내 글 수정페이지로 이동
	@RequestMapping("goPageUpdateQna.do")
	public String goPageUpdateQna(@RequestParam("qna_no") int qna_no, Qna qna, Model model) {
		qna = qnaService.selectDetailViewQna(qna_no);
		model.addAttribute("qna", qna);
		return "qna/qnaUpdateForm";
	}

	// QnA 내 글 수정
	@RequestMapping(value = "updateQna.do", method = RequestMethod.POST)
	public String updateQna(Qna qna, Model model) {
		// 페이지 이름 정해줄 String
		String pageName = "";

		Qna updateQna;

		if (qna.getQna_alarm() == null)
			qna.setQna_alarm("N");

		int result = qnaService.updateQna(qna);
		if (result > 0) {
			updateQna = qnaService.selectDetailViewQna(qna.getQna_no());
			model.addAttribute("qna", updateQna);

			pageName = "redirect:selectDetailViewQna.do?qna_no=" + qna.getQna_no();
		} else {
			System.out.println("에러페이지로");
		}

		return pageName;
	}

	@RequestMapping("selectListMyQna.do")
	public String selectListMyQna(Page page, Model model) {

		int totalCount = qnaService.selectMyTotal(page.getQna_id()); // 내가 쓴 게시물 총 갯수(현제 db에 저장된 값)
		int currentPage = page.getCurrentPage();
		page.setTotalCount(totalCount); // 전체 게시물 갯수 (db에서 조회해 와서 Page 클레스에 저장)
		page.calcRow(currentPage, page.getContentNum()); // db에서 조회할 ROWNUM 시작과 끝 계산
		page.saveCurrentBlock(currentPage); // 페이지
		page.saveLastBlock(totalCount);
		page.calcPage(totalCount, page.getContentNum()); // 맨 마지막 페이지 계산

		page.prevnext(currentPage);
		page.saveStartPage(page.getCurrentBlock());
		page.saveEndPage(page.getLastBlock(), page.getCurrentBlock());
		
		ArrayList<Qna> qnaList = qnaService.selectListMyQna(page);
		model.addAttribute("qnaList", qnaList);

		return "qna/qnaMyList";
	}

	// 게시글 삭제
	@RequestMapping("deleteQna.do")
	public String deleteQna(@RequestParam("qna_no") int qna_no) {

		int result = qnaService.deleteQna(qna_no);

		if (result > 0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
			return "redirect:qna.do";
	}
	
	//2020_01_09 ssm
	
	//qna 답글 작성
	@RequestMapping(value = "insertReplyQnA.ad", method = RequestMethod.POST)
	public String insertReplyQnA(QnaComment qc,@RequestParam(name="qna_no") int qna_no, @RequestParam(name="commentInput", required=false) String commentInput) {
		qc.setQc_content(commentInput);
		logger.info(qc.toString());
		int result = qnaService.insertReplyQnA(qc);
		
		logger.info(qc+"개 행 처리");
		
		String viewFileName = "";
		if (result > 0) {
			viewFileName = "redirect:selectDetailViewQna.do?qna_no="+qna_no;
		}else {
			viewFileName = "common/error";
		}
			return viewFileName;
	}
	
	//qna 답글 수정 페이지로 이동
	@RequestMapping("updateReplyQnAPage.ad")
	public String updateReplyQnAPage(@RequestParam("qna_no") int qna_no, Qna qna, Model model, QnaComment QC) {
		qna = qnaService.selectDetailViewQna(qna_no);
		QC = qnaService.selectQnaComment(qna_no);
		model.addAttribute("qna", qna);
		model.addAttribute("QC", QC);
		return "admin/qna/qnaUpdatePage";
	}
	
	//qna 답글 수정
	@RequestMapping(value = "updateReplyQnA.ad", method = RequestMethod.POST)
	public String updateReplyQnA(QnaComment qc,@RequestParam(name="qna_no") int qna_no, @RequestParam(name="commentInput", required=false) String commentInput) {
		qc.setQc_content(commentInput);
		int result = qnaService.updateReplyQnA(qc);
		
		String viewFileName = "";
		if (result > 0) {
			viewFileName = "redirect:selectDetailViewQna.do?qna_no="+qna_no;
		}else {
			viewFileName = "common/error";
		}
			return viewFileName;
	}
	
	
	//end

}
