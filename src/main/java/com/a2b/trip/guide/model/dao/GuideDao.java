package com.a2b.trip.guide.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.guide.model.vo.GuideDetail;

@Repository("guideDao")
public class GuideDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public GuideDao() {}

	public GuideDetail selectDetailViewGuide(String guide_id) {
		return sqlSession.selectOne("guideMapper.selectDetailViewGuide",guide_id);
	}

	public GuideDetail selectDetailViewApplyGuide(String guide_id) {
		return sqlSession.selectOne("guideMapper.selectDetailViewApplyGuide", guide_id);
	}
}
