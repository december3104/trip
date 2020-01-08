package com.a2b.trip.guidematching.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.guidematching.model.service.GuideBoardService;

@Controller
public class GuideBoardController {

	@Autowired
	private GuideBoardService guideBoardService;
	
	public GuideBoardController() {}
}
