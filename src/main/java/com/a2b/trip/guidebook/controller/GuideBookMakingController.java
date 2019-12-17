package com.a2b.trip.guidebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.guidebook.model.service.GuideBookMakingService;

@Controller
public class GuideBookMakingController {
	
	@Autowired
	private GuideBookMakingService guideBookMakingService;
	
	public GuideBookMakingController() {}
}
