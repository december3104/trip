package com.a2b.trip.member.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.a2b.trip.member.model.service.MailService;

@Controller
public class MailController {

	@Autowired
	private MailService mailService;
	
	// 이메일 인증 발송, 인증 함수
	@RequestMapping(value="createEmailCheck.do", method=RequestMethod.GET)
	@ResponseBody
	public boolean createEmailCheck(@RequestParam("member_email") String member_email, @RequestParam("random") int random, HttpServletRequest request) {
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = request.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		String subject = "회원가입 인증 코드 발급 안내입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는" + authCode + "입니다.");
		
		return mailService.send(subject, sb.toString(), "elcl248@gmail.com", member_email, null);
	}
	
	// 이메일 인증 확인
	@RequestMapping(value="emailAuth.do", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam("authCode") String authCode, @RequestParam("random") String random, HttpSession session){
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));
		if(originalJoinCode.equals(authCode) && originalRandom.equals(random)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}

}
