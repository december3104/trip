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
	
	// 가이드 평점 남기기 여부 수정
	@Override
	public int updateGradeCheck(GuideMatching gm) {
		return guideMatchingDao.updateGradeCheck(gm);
	}

	// 가이드 매칭 신고 처리
	@Override
	public int updateGuideMatchingReport(int gb_no) {
		return guideMatchingDao.updateGuideMatchingReport(gb_no);
	}

	// 가이드 상세 보기
	@Override
	public MyGuideMatching selectMyGuideMatchingOne(String gb_id) {
		return guideMatchingDao.selectMyGuideMatchingOne(gb_id);
	}
//	신청여부 체크
	@Override
	public GuideMatching chk_GM(GuideMatching gm) {
		return guideMatchingDao.chk_GM(gm);
	}
	

	

}
