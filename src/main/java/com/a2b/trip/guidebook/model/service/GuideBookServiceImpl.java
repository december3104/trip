package com.a2b.trip.guidebook.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidebook.model.dao.GuideBookDao;

@Service("guideBookService")
public class GuideBookServiceImpl implements GuideBookService {

	@Autowired
	private GuideBookDao guideBookDao;
	
	public GuideBookServiceImpl() {}
}
