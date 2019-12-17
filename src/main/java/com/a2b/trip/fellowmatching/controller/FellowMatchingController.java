package com.a2b.trip.fellowmatching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.fellowmatching.model.service.FellowMatchingService;

@Controller
public class FellowMatchingController {

	@Autowired
	private FellowMatchingService fellowMatchingService;
	
	public FellowMatchingController() {}
}
