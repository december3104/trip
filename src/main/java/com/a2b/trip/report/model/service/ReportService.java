package com.a2b.trip.report.model.service;

import java.util.ArrayList;

import com.a2b.trip.report.model.vo.GuideReport;
import com.a2b.trip.report.model.vo.NormalReport;
import com.a2b.trip.report.model.vo.Report;

public interface ReportService {

	ArrayList<NormalReport> selectListNormalReport();

	ArrayList<GuideReport> selectListGuideReport();

	ArrayList<Report> selectDetailViewNormalReport(String member_id);

	ArrayList<Report> selectDetailViewGuideReport(String member_id);


}
