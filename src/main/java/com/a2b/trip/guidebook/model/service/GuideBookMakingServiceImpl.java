package com.a2b.trip.guidebook.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidebook.model.dao.GuideBookMakingDao;

@Service("guideBookMakingService")
public class GuideBookMakingServiceImpl implements GuideBookMakingService {

	@Autowired
	private GuideBookMakingDao guideBookMakingDao;
	
	public GuideBookMakingServiceImpl() {}
}
