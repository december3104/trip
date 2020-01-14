package com.a2b.trip.guidematching.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.guidematching.model.vo.MyGuideMatching;

@Repository("guideBoardDao")
public class GuideBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public GuideBoardDao() {}

	// 가이드 매칭 기록 목록 보기
	public ArrayList<MyGuideMatching> selectMyGuideBoard(String gb_id) {
		List<MyGuideMatching> list = sqlSession.selectList("guideMatchingMapper.selectMyGuideBoard", gb_id);
		return (ArrayList<MyGuideMatching>)list;
	}
}
