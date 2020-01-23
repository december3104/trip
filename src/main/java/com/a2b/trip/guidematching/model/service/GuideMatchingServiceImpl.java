package com.a2b.trip.guidematching.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidematching.model.dao.GuideMatchingDao;
import com.a2b.trip.guidematching.model.vo.GuideMatching;
import com.a2b.trip.guidematching.model.vo.MyGuideMatching;

@Service("guideMatchingService")
public class GuideMatchingServiceImpl implements GuideMatchingService {

	@Autowired
	private GuideMatchingDao guideMatchingDao;
	
	public GuideMatchingServiceImpl() {}

	// 가이드 찾기 기록 목록 보기
	@Override
	public ArrayList<MyGuideMatching> selectMyGuideMatching(String gm_id) {
		return guideMatchingDao.selectMyGuideMatching(gm_id);
	}

	@Override
	public int insertGuideMatching(GuideMatching gm) {
		return guideMatchingDao.insertGuideMatching(gm);
	}
	
}
