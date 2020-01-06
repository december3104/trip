package com.a2b.trip.fellow.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.fellow.model.dao.FellowMatchingDao;

@Service("fellowMatchingService")
public class FellowMatchingServiceImpl implements FellowMatchingService {

	@Autowired
	private FellowMatchingDao fellowMatchingDao;
	
	public FellowMatchingServiceImpl() {}
}
