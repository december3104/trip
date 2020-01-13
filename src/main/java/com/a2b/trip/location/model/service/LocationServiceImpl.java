package com.a2b.trip.location.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.location.model.dao.LocationDao;
import com.a2b.trip.location.model.vo.Location;

@Service("locationService")
public class LocationServiceImpl implements LocationService {
	
	@Autowired
	private LocationDao locationDao;
	
	public LocationServiceImpl() {}

	@Override
	public ArrayList<Location> selectAll() {
		return locationDao.selectAll();
	}
	
	
}
