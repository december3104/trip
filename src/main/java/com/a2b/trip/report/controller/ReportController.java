package com.a2b.trip.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.report.model.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	public ReportController() {}
}
