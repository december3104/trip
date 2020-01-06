package com.a2b.trip.fellow.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.fellow.model.dao.FellowMatchingDao;
import com.a2b.trip.fellow.model.vo.FellowMatching;

@Service("fellowMatchingService")
public class FellowMatchingServiceImpl implements FellowMatchingService {

	@Autowired
	private FellowMatchingDao fellowMatchingDao;
	
	public FellowMatchingServiceImpl() {}

	@Override
	public ArrayList<FellowMatching> selectMyFellowMatching(String fm_id) {
		return fellowMatchingDao.selectMyFellowMatching(fm_id);
	}
}
