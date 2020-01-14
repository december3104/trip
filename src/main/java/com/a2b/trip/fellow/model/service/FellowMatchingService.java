package com.a2b.trip.fellow.model.service;

import java.util.ArrayList;

import com.a2b.trip.fellow.model.vo.Fellow;
import com.a2b.trip.fellow.model.vo.FellowMatching;

public interface FellowMatchingService {

	ArrayList<Fellow> selectMyFellowMatching(String fm_id);
	Fellow selectMyFellowMatchingOne(String fb_id);
	int updateFellowMatchingReport(int fb_no);
	int insertFellowMatching(FellowMatching fm);
	int updateFellowMatching(FellowMatching fm);
}
