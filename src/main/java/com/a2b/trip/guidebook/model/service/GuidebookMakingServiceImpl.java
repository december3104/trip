package com.a2b.trip.guidebook.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidebook.model.dao.GuidebookMakingDao;
import com.a2b.trip.guidebook.model.vo.GuidebookMaking;

@Service("guidebookMakingService")
public class GuidebookMakingServiceImpl implements GuidebookMakingService {

	@Autowired
	private GuidebookMakingDao guidebookMakingDao;
	
	public GuidebookMakingServiceImpl() {}

	@Override
	public int insertBookpage(GuidebookMaking gbmaking) {
		return guidebookMakingDao.insertBookpage(gbmaking);
	}
}
