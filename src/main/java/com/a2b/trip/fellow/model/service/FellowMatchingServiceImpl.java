package com.a2b.trip.fellow.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.fellow.model.dao.FellowMatchingDao;
import com.a2b.trip.fellow.model.vo.Fellow;

@Service("fellowMatchingService")
public class FellowMatchingServiceImpl implements FellowMatchingService {

	@Autowired
	private FellowMatchingDao fellowMatchingDao;
	
	public FellowMatchingServiceImpl() {}

	@Override
	public ArrayList<Fellow> selectMyFellowMatching(String fm_id) {
		return fellowMatchingDao.selectMyFellowMatching(fm_id);
	}

	@Override
	public Fellow selectMyFellowMatchingOne(String fb_id) {
		return fellowMatchingDao.selectMyFellowMatchingOne(fb_id);
	}

	// 신고 처리 
	@Override
	public int updateFellowMatchingReport(int fb_no) {
		return fellowMatchingDao.updateFellowMatchingReport(fb_no);
	}
}
