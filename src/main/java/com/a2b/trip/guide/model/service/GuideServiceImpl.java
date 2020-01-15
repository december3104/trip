package com.a2b.trip.guide.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guide.model.dao.GuideDao;
import com.a2b.trip.guide.model.vo.Guide;
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
	//가이드 신청 거절
	@Override
	public int detailApplyRejectGuide1(String guide_id) {
		return guideDao.detailApplyRejectGuide1(guide_id);
	}
	//가이드 신청 거절
	@Override
	public int detailApplyRejectGuide2(String guide_id) {
		return guideDao.detailApplyRejectGuide2(guide_id);
	}
	//가이드 신청 승인
	@Override
	public int updateDetailAcceptGuide1(String guide_id) {
		return guideDao.updateDetailAcceptGuide1(guide_id);
	}
	//가이드 신청 승인
	@Override
	public int updateDetailAcceptGuide2(String guide_id) {
		return guideDao.updateDetailAcceptGuide2(guide_id);
	}
	//가이드 자격박탈 처리
	@Override
	public int updateDetailForcedExitGuide(String guide_id) {
		return guideDao.updateDetailForcedExitGuide(guide_id);
	}
	//가이드 신청 입력
	@Override
	public int insertWordGuide(Guide guide) {
		return guideDao.insertWordGuide(guide);
	}
	
	
}
