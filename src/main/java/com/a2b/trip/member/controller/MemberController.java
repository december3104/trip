package com.a2b.trip.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.member.model.service.MemberService;
import com.a2b.trip.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public MemberController() {}
	
	// 일반 회원 로그인 처리
	@RequestMapping(value="loginMember.do", method=RequestMethod.POST)
	public String loginMember(Member member, HttpSession session, Model model) {
		
		Member loginMember = memberService.loginChkMember(member);
		
		String viewFileName = "main";
			if (bcryptPasswordEncoder.matches(member.getMember_pwd(), loginMember.getMember_pwd())) {
				session.setAttribute("loginMember", loginMember);
				if (loginMember.getMember_level() == 3) {
					viewFileName = "admin/main_ad";
				}
			} else {
				model.addAttribute("message", "일치하는 회원 정보가 없습니다.");
				viewFileName = "common/error";
		}
		return viewFileName;
	}
	
	// 일반 회원 로그아웃 처리
	@RequestMapping("logout.do")
	public String logoutMember(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			session.invalidate();
		}
		return "main";
	}
	
	// 일반 회원가입 페이지로 이동 처리
	@RequestMapping("moveMemberEnrollPage")
	public String moveMemberEnrollPage() {
		return "member/memberEnrollPage";
	}
	
	// 일반 회원가입 처리
	@RequestMapping(value="insertMember.do", method=RequestMethod.POST)
	public String insertMember(Member member, Model model, MultipartFile file, HttpServletRequest request) {
		// 비밀번호 암호화 처리
		member.setMember_pwd(bcryptPasswordEncoder.encode(member.getMember_pwd()));
		// 프로필 사진 저장 처리
		if (member.getMember_profile_original() != null) {
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/member_profile_upfiles");
			
		}
		// 서비스로 전송하고 결과 받기
		int result = memberService.insertMember(member);
		
		String viewFileName = "main";
		
		if (result <= 0) {		// 회원 가입 실패 했을 경우
			model.addAttribute("message", "회원 가입 실패!");
			viewFileName = "common/error";
		}
		return viewFileName;
	}
	
	// 일반 회원 정보 보기 처리
	public ModelAndView memberInfo(@RequestParam("member_id") String member_id, ModelAndView mv) {
		
		Member member = memberService.selectOneMember(member_id);
		
		if (member != null) {
			mv.addObject("member", member);
			mv.setViewName("member/memberInfo");
		} else {
			mv.addObject("message", "내 정보 보기 실패!");
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// 일반 회원 정보 수정 처리
	public String updateMember(Member member, Model model) {
		
		return "main";
	}
	
	// 가이드 회원 탈퇴 처리
	public String updateGuideMember(@Param("member_id") String member_id) {
		
		return "main";
	}
	
	// 일반 회원 탈퇴 처리
	public String deleteMember(Member member, Model model) {
		
		return "main";
	}
	
	// 아이디 중복 확인 처리
	public void selectSearchMemberId(@RequestParam("member_id") String member_id, HttpServletResponse response) throws IOException {
		
		int result = memberService.selectSearchMemberId(member_id);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (result == 0) {		// 사용 가능한 아이디
			out.append("OK");
			out.flush();
		}
		if (result == 1) {		// 존재하는 아이디
			out.append("DUP");
			out.flush();
		}
		out.close();
		
		
	}
	
	
}
