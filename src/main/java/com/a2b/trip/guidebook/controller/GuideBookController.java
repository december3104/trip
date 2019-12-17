package com.a2b.trip.guidebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.guidebook.model.service.GuideBookService;

@Controller
public class GuideBookController {

	@Autowired
	private GuideBookService guideBookService;
	
	public GuideBookController() {}
}
