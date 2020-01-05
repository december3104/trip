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

	@Override
	public int detailApplyRejectGuide(String guide_id) {
		return guideDao.detailApplyRejectGuide(guide_id);
	}

	@Override
	public int detailApplyRejectGuide2(String guide_id) {
		return guideDao.detailApplyRejectGuide1(guide_id);
	}

	@Override
	public int updateDetailAcceptGuide(String guide_id) {
		return guideDao.updateDetailAcceptGuide(guide_id);
	}

	@Override
	public int updateDetailAcceptGuide2(String guide_id) {
		return guideDao.updateDetailAcceptGuide2(guide_id);
	}
	
	
}
