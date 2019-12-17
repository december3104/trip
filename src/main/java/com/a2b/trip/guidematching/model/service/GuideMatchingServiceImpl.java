package com.a2b.trip.guidematching.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidematching.model.dao.GuideMatchingDao;

@Service("guideMatchingService")
public class GuideMatchingServiceImpl implements GuideMatchingService {

	@Autowired
	private GuideMatchingDao guideMatchingDao;
	
	public GuideMatchingServiceImpl() {}
}
