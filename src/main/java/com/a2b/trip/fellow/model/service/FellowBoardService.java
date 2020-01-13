package com.a2b.trip.fellow.model.service;

import java.util.ArrayList;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.vo.Fellow;
import com.a2b.trip.fellow.model.vo.FellowBoard;
import com.a2b.trip.fellow.model.vo.FellowMatching;
import com.a2b.trip.location.model.vo.Location;

public interface FellowBoardService {

	int selectTotal();
	ArrayList<FellowBoard> selectAllFellowBoard(Page page);
	FellowBoard selectOneFellowBoard(int fb_no);
	ArrayList<Location> selectAllLocation();
	ArrayList<FellowMatching> selectAllFellowMatching(int fb_no);
	ArrayList<Fellow> selectMyFellowBoard(String fb_id);
	Fellow selectMyFellowBoardOne(String fm_id);
	int insertFellowBoard(FellowBoard fb);
	int updateFellowBoardReport(int fb_no);
	int selectMyTotal(String qna_id);
	ArrayList<FellowBoard> selectListMyFellowBoard(Page page);
	int selectSearchTotal(String search);
	ArrayList<FellowBoard> selectListFellowBoard(Page page);
}
