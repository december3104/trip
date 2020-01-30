package com.a2b.trip.guidematching.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidematching.model.dao.GuideBoardDao;
import com.a2b.trip.guidematching.model.vo.GuideBoard;
import com.a2b.trip.guidematching.model.vo.GuideSearch;
import com.a2b.trip.guidematching.model.vo.MyGuideMatching;

@Service("guideBoardService")
public class GuideBoardServiceImpl implements GuideBoardService {

	@Autowired
	private GuideBoardDao guideBoardDao;
	
	public GuideBoardServiceImpl() {}

	// 가이드 매칭 기록 목록 보기
	@Override
	public ArrayList<MyGuideMatching> selectMyGuideBoard(String gb_id) {
		return guideBoardDao.selectMyGuideBoard(gb_id);
	}

	@Override
	public ArrayList<GuideBoard> selectListGuideBoard(GuideSearch guideSearch) {
		return guideBoardDao.selectListGuideBoard(guideSearch);
	}

	@Override
	public GuideBoard selectGB(String gb_no) {
		return guideBoardDao.selectGB(gb_no);
	}

	@Override
	public int updateDetailAcceptGM(GuideBoard gb) {
		return guideBoardDao.updateDetailAcceptGM(gb);
	}

	@Override
	public int updateDetailAcceptGM_cut(GuideBoard gb) {
		return guideBoardDao.updateDetailAcceptGM_cut(gb);
	}

	@Override
	public int insertWordGuideBoard(GuideBoard gb) {
		return guideBoardDao.insertWordGuideBoard(gb);
	}
	
	@Override
	public int close_gb(String gb_no) {
		return guideBoardDao.close_gb(gb_no);
	}
	@Override
	public ArrayList<GuideBoard> selectGuideBoardList() {
		return guideBoardDao.selectGuideBoardList();
	}

	// 가이드 신고 처리
	@Override
	public int updateGuideBoardReport(int gb_no) {
		return guideBoardDao.updateGuideBoardReport(gb_no);
	}

	// 신청자 상세 보기
	@Override
	public MyGuideMatching selectMyGuideBoardOne(String gm_id) {
		return guideBoardDao.selectMyGuideBoardOne(gm_id);
	}

	@Override
	public int selectGetSeq() {
		return guideBoardDao.selectGetSeq();
	}
	

}
