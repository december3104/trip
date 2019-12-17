package com.a2b.trip.place.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.place.model.service.PlaceService;

@Controller
public class PlaceController {

	@Autowired
	private PlaceService placeService;
	
	public PlaceController() {}
}
