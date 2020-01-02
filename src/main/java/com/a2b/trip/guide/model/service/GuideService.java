package com.a2b.trip.guide.model.service;

import com.a2b.trip.guide.model.vo.GuideDetail;

public interface GuideService {

	GuideDetail selectDetailViewGuide(String guide_id);

	GuideDetail selectDetailViewApplyGuide(String guide_id);

}
