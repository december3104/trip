package com.a2b.trip.fellow.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.dao.FellowBoardDao;
import com.a2b.trip.fellow.model.vo.Fellow;
import com.a2b.trip.fellow.model.vo.FellowBoard;
import com.a2b.trip.fellow.model.vo.FellowMatching;
import com.a2b.trip.location.model.vo.Location;

@Service("fellowBoardService")
public class FellowBoardServiceImpl implements FellowBoardService {

	@Autowired
	private FellowBoardDao fellowBoardDao;
	
	public FellowBoardServiceImpl() {}

	@Override
	public int selectTotal() {
		return fellowBoardDao.selectTotal();
	}

	@Override
	public ArrayList<FellowBoard> selectAllFellowBoard(Page page) {
		return fellowBoardDao.selectAllFellowBoard(page);
	}

	@Override
	public FellowBoard selectOneFellowBoard(int fb_no) {
		return fellowBoardDao.selectOneFellowBoard(fb_no);
	}

	@Override
	public ArrayList<Location> selectAllLocation() {
		return fellowBoardDao.selectAllLocation();
	}

	@Override
	public ArrayList<FellowMatching> selectAllFellowMatching(int fb_no) {
		return fellowBoardDao.selectAllFellowmatching(fb_no);
	}
  
	// 동행 찾기 기록
	@Override
	public ArrayList<Fellow> selectMyFellowBoard(String fb_id) {
		return fellowBoardDao.selectMyFellowBoard(fb_id);
	}

	// 한명 조회
	@Override
	public Fellow selectMyFellowBoardOne(String fm_id) {
		return fellowBoardDao.selectMyFellowBoardOne(fm_id);
	}
	
	@Override
	public int insertFellowBoard(FellowBoard fb) {
		return fellowBoardDao.insertFellowBoard(fb);
	}
}
