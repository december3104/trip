package com.a2b.trip.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.report.model.dao.ReportDao;

@Service("reportService")
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao reportDao;
	
	public ReportServiceImpl() {}
}
