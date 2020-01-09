package com.a2b.trip.fellow.model.service;

import java.util.ArrayList;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.vo.FellowBoard;
import com.a2b.trip.fellow.model.vo.FellowMatching;
import com.a2b.trip.location.model.vo.Location;

public interface FellowBoardService {

	int selectTotal();
	ArrayList<FellowBoard> selectAllFellowBoard(Page page);
	FellowBoard selectOneFellowBoard(int fb_no);
	ArrayList<Location> selectAllLocation();
	ArrayList<FellowMatching> selectAllFellowMatching(int fb_no);
	int insertFellowBoard(FellowBoard fb);

}
