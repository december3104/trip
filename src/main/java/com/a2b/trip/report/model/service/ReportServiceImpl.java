package com.a2b.trip.report.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.common.Page;
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
	public ArrayList<NormalReport> selectListNormalReport(Page page) {
		return reportDao.selectListNormalReport(page);
	}
	//가이드 회원 신고 목록 조회
	@Override
	public ArrayList<GuideReport> selectListGuideReport(Page page) {
		return reportDao.selectListGuideReport(page);
	}
	//일반 회원 신고 상세보기
	@Override
	public ArrayList<Report> selectDetailViewNormalReport(String member_id) {
		return reportDao.selectDetailViewNormalReport(member_id);
	}
	//가이드 회원 신고 상세보기
	@Override
	public ArrayList<Report> selectDetailViewGuideReport(String member_id) {
		return reportDao.selectDetailViewGuideReport(member_id);
	}
	//일반 회원 신고 승인(member)
	@Override
	public int updateDetailAcceptNormalReport1(String report_id) {
		return reportDao.updateDetailAcceptNormalReport1(report_id);
	}
	//일반 회원 신고 승인(report)
	@Override
	public int updateDetailAcceptNormalReport2(int report_no) {
		return reportDao.updateDetailAcceptNormalReport2(report_no);
	}
	// 일반 회원 신고 거절
	@Override
	public int detailRejectNormalReport(int report_no) {
		return reportDao.detailRejectNormalReport(report_no);
	}
	//가이드 회원 신고 승인(member)
	@Override
	public int updateDetailAcceptGuideReport1(String report_id) {
		return reportDao.updateDetailAcceptGuideReport1(report_id);
	}
	//가이드 회원 신고 승인(report)
	@Override
	public int updateDetailAcceptGuideReport2(int report_no) {
		return reportDao.updateDetailAcceptGuideReport2(report_no);
	}
	//가이드 회원 신고 거절
	@Override
	public int detailRejectGuideReport(int report_no) {
		return reportDao.detailRejectGuideReport(report_no);
	}
	//일반 회원 신고 전체 갯수 조회
	@Override
	public int selectTotal() {
		return reportDao.selectTotal();
	}
	//가이드 회원 신고 전체 갯수 조회
	@Override
	public int selectTotalGuide() {
		return reportDao.selectTotalGuide();
	}
	

	
	
	
	
	
	
	
}
