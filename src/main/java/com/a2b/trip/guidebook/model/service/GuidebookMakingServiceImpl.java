package com.a2b.trip.guidebook.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidebook.model.dao.GuidebookMakingDao;

@Service("guidebookMakingService")
public class GuidebookMakingServiceImpl implements GuidebookMakingService {

	@Autowired
	private GuidebookMakingDao guidebookMakingDao;
	
	public GuidebookMakingServiceImpl() {}
}
