package com.a2b.trip.guidematching.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidematching.model.dao.GuideBoardDao;

@Service("guideBoardService")
public class GuideBoardServiceImpl implements GuideBoardService {

	@Autowired
	private GuideBoardDao guideBoardDao;
	
	public GuideBoardServiceImpl() {}
}