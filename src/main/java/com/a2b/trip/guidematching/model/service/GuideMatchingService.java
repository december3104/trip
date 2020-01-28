package com.a2b.trip.guidematching.model.service;

import java.util.ArrayList;

import com.a2b.trip.guidematching.model.vo.GuideMatching;
import com.a2b.trip.guidematching.model.vo.MyGuideMatching;

public interface GuideMatchingService {

	ArrayList<MyGuideMatching> selectMyGuideMatching(String gm_id);
	int updateGradeCheck(GuideMatching gm);
	int updateGuideMatchingReport(int gb_no);
	MyGuideMatching selectMyGuideMatchingOne(String gb_id);
}
