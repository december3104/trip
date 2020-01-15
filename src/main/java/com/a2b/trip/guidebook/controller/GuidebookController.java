package com.a2b.trip.guidebook.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.a2b.trip.guidebook.model.service.GuidebookService;
import com.a2b.trip.guidebook.model.vo.Guidebook;
import com.a2b.trip.member.model.vo.Member;

@Controller
public class GuidebookController {
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
		private static final Logger logger = LoggerFactory.getLogger(GuidebookController.class);

	@Autowired
	private GuidebookService guidebookService;
	
	public GuidebookController() {}
	
	//가이드북 제작하기 페이지
	@RequestMapping("makeGuidebook.do")
	   public String makeGuidebook() {
		   return "guidebook/makeGuidebook";
	   }
	
	//가이드북 생성하기
	@RequestMapping(value="insertGuidebook.do", method = {RequestMethod.GET, RequestMethod.POST})

	   public String guidebookInsertMethod(Guidebook guidebook, Model model, HttpServletRequest request) {
		   //성공하면 guidebook, 에러났을때 model
		
		HttpSession session = request.getSession(false);
		Member sessionMember = (Member)session.getAttribute("loginMember");
		String memberId = sessionMember.getMember_id();
		
		guidebook.setBook_id(memberId);
		
		System.out.println(guidebook.getBook_name() + ", " + guidebook.getTravel_detail() + ". " + guidebook.getTravel_theme() + ", " + guidebook.getTravel_start_date() + ", " + guidebook.getTravel_end_date() + ", " + guidebook.getBook_id());
		
		 int result = guidebookService.insertGuidebook(guidebook);
		   
		   String viewFileName = "guidebook/makeGuidebook";
		   
		 if(result <= 0) { //제작 실패시
			model.addAttribute("message", "가이드북 제작실패!");
			viewFileName = "common/error";		   
		   }
		   return viewFileName;
	   }
	
	//가이드북 수정하기
	@RequestMapping(value="updateGuidebook.do", method=RequestMethod.POST)
	public String guidebookUpdateMethod(Guidebook guidebook, Model model, HttpServletRequest request) {
		// 세션에서 정보 꺼내기
		HttpSession session = request.getSession(false);
		Member sessionMember = (Member)session.getAttribute("loginMember");
		

		// 서비스로 전송하고 결과 받기
		 int result = guidebookService.updateGuidebook(guidebook);
		 
		 System.out.println(result);
		
		String viewFileName = "redirect:/makeGuidebook.do";
		
		if(result <= 0) { //수정 실패시
			model.addAttribute("message", "가이드북  수정 실패!");
			viewFileName = "common/error";		   
		   }
		
		return viewFileName;
	}
	
}
