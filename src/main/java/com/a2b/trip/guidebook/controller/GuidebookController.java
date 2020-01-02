package com.a2b.trip.guidebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.a2b.trip.guidebook.model.service.GuidebookService;

@Controller
public class GuidebookController {

	@Autowired
	private GuidebookService guidebookService;
	
	public GuidebookController() {}
	
	@RequestMapping("makeGuidebook.do")
	   public String makeGuidebook() {
		   return "guidebook/makeGuidebook";
	   }
	
	@RequestMapping("final.do")
	   public String Final() {
		   return "guidebook/final";
	   }
}
