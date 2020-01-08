package com.a2b.trip.fellow.model.service;

import java.util.ArrayList;

import com.a2b.trip.fellow.model.vo.Fellow;

public interface FellowMatchingService {

	ArrayList<Fellow> selectMyFellowMatching(String fm_id);
	Fellow selectMyFellowMatchingOne(String fb_id);
}
