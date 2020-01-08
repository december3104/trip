package com.a2b.trip.report.model.service;

import java.util.ArrayList;

import com.a2b.trip.common.Page;
import com.a2b.trip.report.model.vo.GuideReport;
import com.a2b.trip.report.model.vo.NormalReport;
import com.a2b.trip.report.model.vo.Report;

public interface ReportService {

	ArrayList<NormalReport> selectListNormalReport(Page page);

	ArrayList<GuideReport> selectListGuideReport(Page page);

	ArrayList<Report> selectDetailViewNormalReport(String member_id);

	ArrayList<Report> selectDetailViewGuideReport(String member_id);

	int detailRejectNormalReport(int report_no);

	int updateDetailAcceptNormalReport1(String report_id);

	int updateDetailAcceptNormalReport2(int report_no);

	int detailRejectGuideReport(int report_no);

	int updateDetailAcceptGuideReport1(String report_id);

	int updateDetailAcceptGuideReport2(int report_no);

	int selectTotal();

	int selectTotalGuide();


}
