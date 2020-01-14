package com.a2b.trip.guide.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.guide.model.service.GuideService;
import com.a2b.trip.guide.model.vo.Guide;
import com.a2b.trip.guide.model.vo.GuideDetail;
import com.a2b.trip.location.model.service.LocationService;
import com.a2b.trip.location.model.vo.Location;
import com.a2b.trip.member.model.service.MemberService;
import com.a2b.trip.member.model.vo.Member;

@Controller
public class GuideController {

	@Autowired
	private GuideService guideService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private LocationService locationService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(GuideController.class);
	
	public GuideController() {}
	
	
	//가이드 회원 상세보기
	@RequestMapping("selectDetailViewGuide.ad")
	public ModelAndView selectDetailViewGuide(@RequestParam("guide_id") String guide_id, ModelAndView mv) {
		GuideDetail guide = guideService.selectDetailViewGuide(guide_id);
		
		mv.addObject("guide", guide);
		mv.setViewName("admin/member/guideDetailView_ad");
		
		return mv;
	}
	
	//가이드 신청 상세보기
	@RequestMapping("selectDetailViewApplyGuide.ad")
	public ModelAndView selectDetailViewApplyGuide(@RequestParam("guide_id") String guide_id, ModelAndView mv) {
		GuideDetail guide = guideService.selectDetailViewApplyGuide(guide_id);
		
		mv.addObject("guideApply", guide);
		mv.setViewName("admin/member/guideApplyDetailView");
		return mv;
	}
	
	//가이드 상세보기 거절
	@RequestMapping("detailApplyRejectGuide.ad")
	public String detailApplyRejectGuide(@RequestParam("guide_id") String guide_id) {
		int result = guideService.detailApplyRejectGuide1(guide_id);
		int result2 = guideService.detailApplyRejectGuide2(guide_id);
		String viewFileName = "";
		if(result == 1 && result2 == 1) {
			viewFileName = "redirect:/selectListApplyGuide.ad";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//가이드 상세보기 수락
	@RequestMapping("updateDetailAcceptGuide.ad")
	public String updateDetailAcceptGuide(@RequestParam("guide_id") String guide_id) {
		String viewFileName = "";
		
		int result = guideService.updateDetailAcceptGuide1(guide_id);
		int result2 = guideService.updateDetailAcceptGuide2(guide_id);
		
		logger.info(result + " // " + result2); 
		
		if(result == 1 && result2 == 1) {
			viewFileName = "redirect:/selectListApplyGuide.ad";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//가이드 자격박탈
	@RequestMapping("updateDetailForcedExitGuide.ad")
	public String updateDetailForcedExitGuide(@RequestParam("guide_id") String guide_id) {
		logger.info(guide_id);
		
		int result1 = memberService.updateDetailForcedExitGuide(guide_id);
		int result2 = guideService.updateDetailForcedExitGuide(guide_id);
		
		String viewFileName = "";
				
		if(result1 == 1 && result2 == 1 ) {
			viewFileName = "redirect:/selectListAllGuide.ad?currentPage=1&contentNum=10";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
	}
	
	//가이드 신청 페이지 이동
	@RequestMapping("guideApplyPage.do")
	public ModelAndView guideApplyPage(ModelAndView mv) {
		
		ArrayList<Location> list = locationService.selectAll();
		
		mv.addObject("loc", list);
		mv.setViewName("guide/guideApplyPage");
		
		return mv;
	}
	
	//가이드 신청하기 @RequestParam(name="upLicensefile") MultipartFile upLicensefile,
	@RequestMapping(value="insertWordGuide.do", method=RequestMethod.POST)
	public String insertWordGuide(Guide guide, @RequestParam(name="upGuideProfile") MultipartFile upGuideProfile, 
			 Model model, HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest) {
		
		
		
		
		
		
		
		logger.info(guide.toString());
		logger.info(upGuideProfile.toString());
//		logger.info(upLicensefile.toString());
		
		String guideSavePath = request.getSession().getServletContext().getRealPath("/resources/images/guide_profile");
		String guideLicensePath = request.getSession().getServletContext().getRealPath("/resources/images/license");
		logger.info(guideSavePath + " : 프로필");
//		logger.info(guideLicensePath + " : 자격증");
		//가이드 프로파일 업로드 처리
		String guideProfileOriginal = null;
		
		if (upGuideProfile.isEmpty() == false) {
			guideProfileOriginal = upGuideProfile.getOriginalFilename();
		}
		if (guideProfileOriginal != null) {
			guide.setGuide_profile_original(guideProfileOriginal);
			// 파일명 형식 변경
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			// 바꿀 파일명 만들기 : 확장자는 원본과 동일하게 함.
			String guideProfileRename = "GP_" + sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ guideProfileOriginal.substring(guideProfileOriginal.lastIndexOf(".") + 1);
			
			guide.setGuide_profile_rename(guideProfileRename);
			try {
				upGuideProfile.transferTo(new File(guideSavePath + "\\" + guideProfileRename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		
		List<MultipartFile> fileList = mtfRequest.getFiles("upLicensefile");
		String src = mtfRequest.getParameter("src");
		logger.info(src);
		String originalFileName = "";
		String renameFileName = "";
		for(MultipartFile mf : fileList) {
			String guideLicensefileOriginal = mf.getOriginalFilename();	//원본 파일명.
			
			logger.info(guide.getQualification_original());
			long fileSize = mf.getSize();							//파일 사이즈.
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String guideLicensefileRename = "GL_" + sdf.format(new java.sql.Date(System.currentTimeMillis())) +
					guideLicensefileOriginal;
			
			originalFileName += guideLicensefileOriginal+",";
			renameFileName += guideLicensefileRename+",";
			logger.info(guide.getQualification_rename());
			try {
				mf.transferTo(new File(guideLicensePath + "\\" +guideLicensefileRename));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e2) {
				e2.printStackTrace();
			}	
		}
		guide.setQualification_original(originalFileName);
		guide.setQualification_rename(renameFileName);
		/*
		//가이드 자격증 업로드 처리
		String guideLicensefileOriginal = null;
		if (upLicensefile.isEmpty() == false) {
			guideLicensefileOriginal = upLicensefile.getOriginalFilename();
		}
		if (guideLicensefileOriginal != null) {
			guide.setQualification_original(guideLicensefileOriginal);
			// 파일명 형식 변경
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			// 바꿀 파일명 만들기 : 확장자는 원본과 동일하게 함.
			String guideLicensefileRename = "GL_" + sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ guideLicensefileOriginal.substring(guideLicensefileOriginal.lastIndexOf(".") + 1);
			
			guide.setQualification_rename(guideLicensefileRename);
			try {
				upLicensefile.transferTo(new File(guideLicensePath + "\\" + guideLicensefileRename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		*/
		logger.info(guide.toString());
		int result1 = guideService.insertWordGuide(guide);
		int result2 = memberService.updateWordGuide(guide.getGuide_id());
		String viewFileName = "";
		
		if(result1 == 1 && result2 == 1) {
			HttpSession session = request.getSession(false);
			Member loginMember = memberService.selectOneMember(guide.getGuide_id());
			session.setAttribute("loginMember", loginMember);
			viewFileName = "redirect:/moveMainPage.do";
		}else {
			viewFileName = "common/error";
		}
		
		return viewFileName;
//		return null;
	}
}
