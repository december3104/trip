package com.a2b.trip.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.guide.model.vo.Guide;
import com.a2b.trip.member.model.service.MemberService;
import com.a2b.trip.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	public MemberController() {}
	
	// 일반 회원 로그인 처리
	@RequestMapping(value="loginMember.do", method=RequestMethod.POST)
	public String loginMember(Member member, HttpSession session, Model model) {
		
		Member loginMember = memberService.loginChkMember(member);
		
		String viewFileName = "main";
			if (bcryptPasswordEncoder.matches(member.getMember_pwd(), loginMember.getMember_pwd())) {
				session.setAttribute("loginMember", loginMember);
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
	public String insertMember(Member member, @RequestParam(name="upProfile") MultipartFile file, Model model, HttpServletRequest request) {
		// 비밀번호 암호화 처리
		member.setMember_pwd(bcryptPasswordEncoder.encode(member.getMember_pwd()));
	
		logger.info(file.getOriginalFilename());
		
		// 프로필 사진 저장 처리
		String savePath = request.getSession().getServletContext().getRealPath("/resources/images/member_profile");
		
		String memberProfileOriginal = file.getOriginalFilename();

		if (memberProfileOriginal != null) {
			member.setMember_profile_original(memberProfileOriginal);
			// 파일명 형식 변경
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			// 바꿀 파일명 만들기 : 확장자는 원본과 동일하게 함.
			String memberProfileRename = member.getMember_id() + "_" + sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ memberProfileOriginal.substring(memberProfileOriginal.lastIndexOf(".") + 1);
			logger.info(memberProfileRename);
			member.setMember_profile_rename(memberProfileRename);
			try {
				file.transferTo(new File(savePath + "\\" + memberProfileRename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
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
	
	// 일반 회원 정보 보기 - 비밀번호 확인 페이지로 이동
	@RequestMapping("moveMemberInfoPage.do")
	public String moveMemberInfoPage() {
		return "member/memberInfoChkPage";
	}
	
	// 일반 회원 정보 보기 - 비밀번호 확인 처리
	@RequestMapping(value="selectMemberPwdChk.do", method=RequestMethod.POST)
	public void selectMemberPwdChk(@RequestParam(name="member_pwd") String member_pwd, HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 세션에서 정보 꺼내기
		HttpSession session = request.getSession(false);
		Member member = (Member)session.getAttribute("loginMember");
		String memberPwd = member.getMember_pwd();
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (bcryptPasswordEncoder.matches(member_pwd, memberPwd)) {
			out.append("OK");
			out.flush();
		} else {
			out.append("NO");
			out.flush();
		}
		
		out.close();
		
	}
	
	// 일반 회원 정보 보기 - 수정 페이지로 이동
	@RequestMapping("moveMemberUpdatePage.do")
	public String moveMemberUpdatePage() {
		return "member/memberUpdatePage";
	}
	
	// 일반 회원 정보 보기 처리
	@RequestMapping("memberInfo.do")
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
	@RequestMapping(value="updateMember.do", method=RequestMethod.POST)
	public String updateMember(Member member, Model model, @RequestParam("updateProfileUpload") MultipartFile file, HttpServletRequest request) {
		// 세션에서 정보 꺼내기
		HttpSession session = request.getSession(false);
		Member sessionMember = (Member)session.getAttribute("loginMember");
		
		String deleteProfileName = sessionMember.getMember_profile_rename();

		String updateOriginalFileName = null;
		String updateRenameFileName = null;
		
		// 전화번호 같은지 확인
		if (!(member.getMember_phone().equals(sessionMember.getMember_phone()))) {
			sessionMember.setMember_phone(member.getMember_phone());
		} 
		
		System.out.println(file.isEmpty());
		
		// 비밀번호 암호화 처리
		sessionMember.setMember_pwd(bcryptPasswordEncoder.encode(member.getMember_pwd()));
			

		// 파일 저장될 경로 설정
		String savePath = request.getSession().getServletContext().getRealPath("/resources/images/member_profile");

			try {
				if (file.isEmpty() == false) {
					updateOriginalFileName = file.getOriginalFilename();
					// 프로필 사진 삭제 처리
					
					File deleteFile = new File(savePath + "\\" + deleteProfileName);
					if (deleteFile.exists()) {
						logger.info("넘오옴");
						deleteFile.delete();
					}
					
					if(!deleteFile.exists()) {
						logger.info("넘어옴");
					}
					

					
					
					sessionMember.setMember_profile_original(updateOriginalFileName);
					// 파일명 형식 변경
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					// 바꿀 파일명 만들기 : 확장자는 원본과 동일하게 함.
					
					updateRenameFileName = sessionMember.getMember_id() + "_" + sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
							+ updateOriginalFileName.substring(updateOriginalFileName.lastIndexOf(".") + 1);
					// logger.info(updateRenameFileName);
				// 프로필 사진 저장 처리
				
				file.transferTo(new File(savePath + "\\" + updateRenameFileName));
				sessionMember.setMember_profile_rename(updateRenameFileName);
				}
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		
		
		// 서비스로 전송하고 결과 받기
		 int result = memberService.updateMember(sessionMember);
		 
		 System.out.println(result);
		
		String viewFileName = "main";
		
		if (result <= 0) {		// 회원 가입 실패 했을 경우
			model.addAttribute("message", "회원 가입 실패!");
			viewFileName = "common/error";
		} else {
			session.setAttribute("loginMember", sessionMember);
		}
		
		return viewFileName;
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
	@RequestMapping(value="selectSearchMemberId.do", method=RequestMethod.POST)
	public void selectSearchMemberId(@RequestParam("member_id") String member_id, HttpServletResponse response) throws IOException {
		
		logger.info(member_id);
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
	
	// 이메일 주소 중복 확인 처리
	@RequestMapping(value="selectSearchMemberEmail.do", method=RequestMethod.POST)
	public void selectSearchMemberEmail(@RequestParam("member_email") String member_email, HttpServletResponse response) throws IOException {
		
		int result = memberService.selectSearchMemberEmail(member_email);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (result == 0) {
			out.append("OK");
			out.flush();
		}
		
		if (result == 1) {
			out.append("DUP");
			out.flush();
		}
		
		out.close();
	}
	
	// 전화번호 중복 확인 처리
	@RequestMapping(value="selectSearchMemberPhone.do", method=RequestMethod.POST)
	public void selectSearchMemberPhone(@RequestParam("member_phone") String member_phone, HttpServletResponse response) throws IOException {
		
		int result = memberService.selectSearchMemberPhone(member_phone);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (result == 0) {
			out.append("OK");
			out.flush();
		}
		
		if (result == 1) {
			out.append("DUP");
			out.flush();
		}
		
		out.close();
	}
	
	
	//작성자 : ssm
	//2019.12.26
	
	//일반 회원 목록 조회
	@RequestMapping("selectListAllMember.ad")
	public ModelAndView selectListAllMember(ModelAndView mv) {		
		ArrayList<Member> list = memberService.selectListAllMember();
		
		logger.info(list.toString());
		
		mv.addObject("memberList", list);
		mv.setViewName("admin/member/memberList_ad");
		
		return mv;
	}
	
	
	
	// 가이드 목록 조회
	@RequestMapping("selectListAllGuide.ad")
	public ModelAndView selectListAllGuide(ModelAndView mv) {
		ArrayList<Member> list = memberService.selectListAllGuide();
		
		logger.info(list.toString());
		
		mv.addObject("guideList", list);
		mv.setViewName("admin/member/guideList_ad");
		
		return mv;
	}
	
	//가이드 신청 목록 조회
	@RequestMapping("selectListApplyGuide.ad")
	public ModelAndView selectListApplyGuide(ModelAndView mv) {
		ArrayList<Member> list = memberService.selectListApplyGuide();
		
		logger.info(list.toString());
		
		mv.addObject("guideApplyList", list);
		mv.setViewName("admin/member/guideApplyList");
		
		return mv;
	}
	
	//회원 상세보기
	@RequestMapping("selectDetailViewMember.ad")
	public ModelAndView selectDetailViewMember(@RequestParam("member_id") String member_id,ModelAndView mv) {
		Member member = memberService.selectDetailViewMember(member_id);
		
		logger.info(member.toString());
		
		mv.addObject("member", member);
		mv.setViewName("admin/member/memberDetailView_ad");
		
		return mv;
	}

	
	//end
	
}
