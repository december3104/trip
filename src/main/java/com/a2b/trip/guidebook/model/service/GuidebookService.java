package com.a2b.trip.guidebook.model.service;

import java.util.ArrayList;

import com.a2b.trip.guidebook.model.vo.Guidebook;

public interface GuidebookService {

	int insertGuidebook(Guidebook guidebook);

	int updateGuidebook(Guidebook guidebook);
	
	ArrayList<Guidebook> selectGuidebookMyList(String book_id);
	
	int deleteGuidebook(String book_no);
	
	Guidebook selectMyGuidebookOne(String book_no);
}
