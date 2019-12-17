package com.a2b.trip.location.controllder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.location.model.service.LocationService;

@Controller
public class LocationController {

	@Autowired
	private LocationService locationService;
	
	public LocationController() {}
}
