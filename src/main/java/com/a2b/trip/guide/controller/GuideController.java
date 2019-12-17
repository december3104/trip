package com.a2b.trip.guide.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.guide.model.service.GuideService;

@Controller
public class GuideController {

	@Autowired
	private GuideService guideService;
	
	public GuideController() {}
}
