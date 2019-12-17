package com.a2b.trip.location.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.location.model.dao.LocationDao;

@Service("locationService")
public class LocationServiceImpl implements LocationService {
	
	@Autowired
	private LocationDao locationDao;
	
	public LocationServiceImpl() {}
}
