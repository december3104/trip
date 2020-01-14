package com.a2b.trip.guidematching.model.service;

import java.util.ArrayList;

import com.a2b.trip.guidematching.model.vo.MyGuideMatching;

public interface GuideBoardService {
	ArrayList<MyGuideMatching> selectMyGuideBoard(String gb_id);
}
