package com.a2b.trip.shareboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.shareboard.model.service.ShareBoardService;

@Controller
public class ShareBoardController {

	@Autowired
	private ShareBoardService shareBoardService;
	
	public ShareBoardController() {}
}
