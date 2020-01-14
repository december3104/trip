package com.a2b.trip.guidematching.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
