package com.a2b.trip.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.report.model.dao.ReportDao;
import com.a2b.trip.report.model.vo.GuideReport;
import com.a2b.trip.report.model.vo.NormalReport;
import com.a2b.trip.report.model.vo.Report;

@Service("reportService")
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao reportDao;
	
	public ReportServiceImpl() {}
	
	//일반 회원 신고 목록 조회
	@Override
	public ArrayList<NormalReport> selectListNormalReport() {
		return reportDao.selectListNormalReport();
	}
	//가이드 회원 신고 목록 조회
	@Override
	public ArrayList<GuideReport> selectListGuideReport() {
		return reportDao.selectListGuideReport();
	}
	//일반 회원 신고 상세보기
	@Override
	public ArrayList<Report> selectDetailViewNormalReport(String member_id) {
		return reportDao.selectDetailViewNormalReport(member_id);
	}

	@Override
	public ArrayList<Report> selectDetailViewGuideReport(String member_id) {
		return reportDao.selectDetailViewGuideReport(member_id);
	}
	
	
	
	
	
}
