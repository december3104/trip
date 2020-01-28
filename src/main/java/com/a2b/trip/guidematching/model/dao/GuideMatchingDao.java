package com.a2b.trip.guidematching.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.guidematching.model.vo.GuideMatching;
import com.a2b.trip.guidematching.model.vo.MyGuideMatching;

@Repository("guideMatchingDao")
public class GuideMatchingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public GuideMatchingDao() {}

	// 가이드 찾기 기록 목록 보기
	public ArrayList<MyGuideMatching> selectMyGuideMatching(String gm_id) {
		List<MyGuideMatching> list = sqlSession.selectList("guideMatchingMapper.selectMyGuideMatching", gm_id);
		return (ArrayList<MyGuideMatching>)list;
	}

	public int insertGuideMatching(GuideMatching gm) {
		return sqlSession.insert("guideMatchingMapper.insertGuideMatching", gm);
	}
	
	// 가이드 평점 남기기 여부
	public int updateGradeCheck(GuideMatching gm) {
		return sqlSession.update("guideMatchingMapper.updateGradeCheck", gm);
	}

	// 가이드 매칭 신고 처리
	public int updateGuideMatchingReport(int gb_no) {
		return sqlSession.update("guideMatchingMapper.updateGuideMatchingReport", gb_no);
	}

	// 가이드 상세 보기
	public MyGuideMatching selectMyGuideMatchingOne(String gb_id) {
		return sqlSession.selectOne("guideMatchingMapper.selectMyGuideMatchingOne", gb_id);

	}
}
