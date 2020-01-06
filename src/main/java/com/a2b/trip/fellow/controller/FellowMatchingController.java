package com.a2b.trip.fellow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.fellow.model.service.FellowMatchingService;

@Controller
public class FellowMatchingController {

	@Autowired
	private FellowMatchingService fellowMatchingService;
	
	public FellowMatchingController() {}
}
