package com.a2b.trip.guide.model.service;

import com.a2b.trip.guide.model.vo.Guide;
import com.a2b.trip.guide.model.vo.GuideDetail;

public interface GuideService {

	GuideDetail selectDetailViewGuide(String guide_id);

	GuideDetail selectDetailViewApplyGuide(String guide_id);

	int detailApplyRejectGuide1(String guide_id);

	int detailApplyRejectGuide2(String guide_id);

	int updateDetailAcceptGuide1(String guide_id);

	int updateDetailAcceptGuide2(String guide_id);

	int updateDetailForcedExitGuide(String guide_id);

	int insertWordGuide(Guide guide);
	
	Guide selectGuideOne(String guide_id);
	int updateGuideGrade(Guide guide);

	Guide selectOne(String member_id);

}
