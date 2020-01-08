package com.a2b.trip.report.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.common.Page;
import com.a2b.trip.report.model.vo.GuideReport;
import com.a2b.trip.report.model.vo.NormalReport;
import com.a2b.trip.report.model.vo.Report;

@Repository("reportDao")
public class ReportDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ReportDao() {}
	//일반 회원 신고 목록 조회
	public ArrayList<NormalReport> selectListNormalReport(Page page) {
		List<NormalReport> list = sqlSession.selectList("reportMapper.selectListNormalReport", page);
		return (ArrayList<NormalReport>)list;
	}
	//가이드 회원 신고 목록 조회
	public ArrayList<GuideReport> selectListGuideReport(Page page) {
		List<GuideReport> list = sqlSession.selectList("reportMapper.selectListGuideReport", page);
		return (ArrayList<GuideReport>)list;
	}
	//일반 회원 신고 상세보기
	public ArrayList<Report> selectDetailViewNormalReport(String member_id) {
		List<Report> list = sqlSession.selectList("reportMapper.selectDetailViewNormalReport", member_id);
		return (ArrayList<Report>)list;
	}
	//가이드 회원 신고 상세보기
	public ArrayList<Report> selectDetailViewGuideReport(String member_id) {
		List<Report> list = sqlSession.selectList("reportMapper.selectDetailViewGuideReport", member_id);
		return (ArrayList<Report>)list;
	}
	//일반 회원 신고 거절 처리
	public int detailRejectNormalReport(int report_no) {
		return sqlSession.delete("reportMapper.detailRejectNormalReport", report_no);
	}
	//일반 회원 신고 승인 처리(membrer)
	public int updateDetailAcceptNormalReport1(String report_id) {
		return sqlSession.update("memberMapper.updateDetailAcceptNormalReport1", report_id);
	}
	//일반 회원 신고 승인 처리(report)
	public int updateDetailAcceptNormalReport2(int report_no) {
		return sqlSession.update("reportMapper.updateDetailAcceptNormalReport2",report_no);
	}
	//가이드 회원 신고 승인(member)
	public int updateDetailAcceptGuideReport1(String report_id) {
		return sqlSession.update("memberMapper.updateDetailAcceptGuideReport1",report_id);
	}
	//가이드 회원 신고 승인(report)
	public int updateDetailAcceptGuideReport2(int report_no) {
		return sqlSession.update("reportMapper.updateDetailAcceptGuideReport2",report_no);
	}
	//가이드 회원 신고 거절 
	public int detailRejectGuideReport(int report_no) {
		return sqlSession.delete("reportMapper.detailRejectGuideReport",report_no);
	}
	public int selectTotal() {
		return sqlSession.selectOne("reportMapper.selectTotal");
	}
	public int selectTotalGuide() {
		return sqlSession.selectOne("reportMapper.selectTotalGuide");
	}
	
	


}
