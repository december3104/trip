package com.a2b.trip.guidematching.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.guidematching.model.vo.GuideBoard;
import com.a2b.trip.guidematching.model.vo.GuideSearch;
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

	public ArrayList<GuideBoard> selectListGuideBoard(GuideSearch guideSearch) {
		List<GuideBoard> list = sqlSession.selectList("guideMatchingMapper.selectListGuideBoard", guideSearch);
		return (ArrayList<GuideBoard>)list;
	}

	public GuideBoard selectGB(String gb_no) {
		return sqlSession.selectOne("guideMatchingMapper.selectGB", gb_no);
	}

	public int updateDetailAcceptGM(GuideBoard gb) {
		return sqlSession.update("guideMatchingMapper.updateDetailAcceptGM", gb);
	}

	public int updateDetailAcceptGM_cut(GuideBoard gb) {
		return sqlSession.update("guideMatchingMapper.updateDetailAcceptGM_cut",gb);
	}

	public int insertWordGuideBoard(GuideBoard gb) {
		return sqlSession.insert("guideMatchingMapper.insertWordGuideBoard", gb);
	}
}
