package com.a2b.trip.guidebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.guidebook.model.service.GuidebookService;

@Controller
public class GuideBookController {

	@Autowired
	private GuidebookService guideBookService;
	
	public GuideBookController() {}
}
