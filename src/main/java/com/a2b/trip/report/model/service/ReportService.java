package com.a2b.trip.report.model.service;

import java.util.ArrayList;

import com.a2b.trip.member.model.vo.Member;
import com.a2b.trip.report.model.vo.Report;

public interface ReportService {

	ArrayList<Member> selectListNormalReport();

	ArrayList<Member> selectListGuideReport();

	ArrayList<Report> selectDetailViewNormalReport(String member_id);


}
