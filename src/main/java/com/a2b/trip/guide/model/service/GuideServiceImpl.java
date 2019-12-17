package com.a2b.trip.guide.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guide.model.dao.GuideDao;

@Service("guideService")
public class GuideServiceImpl implements GuideService {

	@Autowired
	private GuideDao guideDao;
	
	public GuideServiceImpl() {}
}
