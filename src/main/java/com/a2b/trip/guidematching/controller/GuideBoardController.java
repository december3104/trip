package com.a2b.trip.guidematching.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.a2b.trip.guidematching.model.service.GuideBoardService;
import com.a2b.trip.guidematching.model.vo.MyGuideMatching;

@Controller
public class GuideBoardController {

	@Autowired
	private GuideBoardService guideBoardService;
	
	public GuideBoardController() {}
	
	// 신청자 정보 보기
	@RequestMapping("selectMyGuideBoardOne")
	@ResponseBody
	public String selectMyGuideBoardOne(@RequestParam ("gm_id") String gm_id, HttpServletResponse response) throws UnsupportedEncodingException {
		
		MyGuideMatching guideBoardOne = guideBoardService.selectMyGuideBoardOne(gm_id);

		response.setContentType("application/json; charset=utf-8");
		
		JSONObject job = new JSONObject();
		
		job.put("guideMatchingName", URLEncoder.encode(guideBoardOne.getMember_name(), "utf-8"));
		job.put("guideMatchingGender", guideBoardOne.getMember_gender());
		job.put("guideMatchingDate", guideBoardOne.getGm_date().toString());
		job.put("guideMatchingNumber", guideBoardOne.getGm_number());
		job.put("guideMatchingId", URLEncoder.encode(guideBoardOne.getGm_id(), "utf-8"));
		if (guideBoardOne.getMember_profile_rename() != null) {
			job.put("guideMatchingProfile", URLEncoder.encode("member_profile/" + guideBoardOne.getMember_profile_rename(), "utf-8"));
		}
		if (guideBoardOne.getMember_profile_rename() == null) {
			job.put("guideMatchingProfile", URLEncoder.encode("molly.png", "utf-8"));
		}
		job.put("guideStartDate", guideBoardOne.getGb_start_date().toString());
		job.put("guideEndDate", guideBoardOne.getGb_end_date().toString());
		
		return job.toJSONString();
	}
}
