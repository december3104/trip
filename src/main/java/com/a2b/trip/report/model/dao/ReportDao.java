package com.a2b.trip.report.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.report.model.vo.GuideReport;
import com.a2b.trip.report.model.vo.NormalReport;
import com.a2b.trip.report.model.vo.Report;

@Repository("reportDao")
public class ReportDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ReportDao() {}
	//일반 회원 신고 목록 조회
	public ArrayList<NormalReport> selectListNormalReport() {
		List<NormalReport> list = sqlSession.selectList("reportMapper.selectListNormalReport");
		return (ArrayList<NormalReport>)list;
	}
	//가이드 회원 신고 목록 조회
	public ArrayList<GuideReport> selectListGuideReport() {
		List<GuideReport> list = sqlSession.selectList("reportMapper.selectListGuideReport");
		return (ArrayList<GuideReport>)list;
	}
	//일반 회원 신고 상세보기
	public ArrayList<Report> selectDetailViewNormalReport(String member_id) {
		List<Report> list = sqlSession.selectList("reportMapper.selectDetailViewNormalReport", member_id);
		return (ArrayList<Report>)list;
	}
	public ArrayList<Report> selectDetailViewGuideReport(String member_id) {
		List<Report> list = sqlSession.selectList("reportMapper.selectDetailViewGuideReport", member_id);
		return (ArrayList<Report>)list;
	}


}
