package com.a2b.trip.guidematching.model.service;

import java.util.ArrayList;

import com.a2b.trip.guidematching.model.vo.GuideBoard;
import com.a2b.trip.guidematching.model.vo.GuideSearch;
import com.a2b.trip.guidematching.model.vo.MyGuideMatching;

public interface GuideBoardService {
	ArrayList<MyGuideMatching> selectMyGuideBoard(String gb_id);

	ArrayList<GuideBoard> selectListGuideBoard(GuideSearch guideSearch);

	GuideBoard selectGB(String gb_no);

	int updateDetailAcceptGM(GuideBoard gb);

	int updateDetailAcceptGM_cut(GuideBoard gb);

	int insertWordGuideBoard(GuideBoard gb);

	int updateGuideBoardReport(int gb_no);
	MyGuideMatching selectMyGuideBoardOne(String gm_id);

	int close_gb(String gb_no);

	ArrayList<GuideBoard> selectGuideBoardList();

	int selectGetSeq();

}
