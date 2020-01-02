package com.a2b.trip.guide.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guide.model.dao.GuideDao;
import com.a2b.trip.guide.model.vo.GuideDetail;

@Service("guideService")
public class GuideServiceImpl implements GuideService {

	@Autowired
	private GuideDao guideDao;
	
	public GuideServiceImpl() {}

	@Override
	public GuideDetail selectDetailViewGuide(String guide_id) {
		return guideDao.selectDetailViewGuide(guide_id);
	}

	@Override
	public GuideDetail selectDetailViewApplyGuide(String guide_id) {
		return guideDao.selectDetailViewApplyGuide(guide_id);
	}
	
	
}
