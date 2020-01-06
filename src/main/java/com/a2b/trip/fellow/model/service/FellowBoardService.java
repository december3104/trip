package com.a2b.trip.fellow.model.service;

import java.util.ArrayList;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.vo.FellowBoard;

public interface FellowBoardService {

	int selectTotal();
	ArrayList<FellowBoard> selectAllFellowBoard(Page page);

}
