package com.a2b.trip.fellow.model.service;

import java.util.ArrayList;

import com.a2b.trip.fellow.model.vo.FellowMatching;

public interface FellowMatchingService {

	ArrayList<FellowMatching> selectMyFellowMatching(String fm_id);
}
