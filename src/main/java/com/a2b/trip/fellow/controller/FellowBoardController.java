package com.a2b.trip.fellow.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.fellow.model.service.FellowBoardService;

@Controller
public class FellowBoardController {

	@Autowired
	private FellowBoardService fellowBoardService;
	
	public FellowBoardController() {}
}
