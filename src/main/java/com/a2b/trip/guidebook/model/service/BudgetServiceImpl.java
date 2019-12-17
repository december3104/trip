package com.a2b.trip.guidebook.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.guidebook.model.dao.BudgetDao;

@Service("budgetService")
public class BudgetServiceImpl implements BudgetService {

	@Autowired
	private BudgetDao budgetDao;
	
	public BudgetServiceImpl() {}
}
