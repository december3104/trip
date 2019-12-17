package com.a2b.trip.guidebook.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.guidebook.model.service.BudgetService;

@Controller
public class BudgetController {

	@Autowired
	private BudgetService budgetService;
	
	public BudgetController() {}
}
