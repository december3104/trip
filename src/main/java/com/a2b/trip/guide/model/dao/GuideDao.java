package com.a2b.trip.guide.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.guide.model.vo.Guide;
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
	//관리자 가이드 신청 거절 가이드 테이블 
	public int detailApplyRejectGuide1(String guide_id) {
		return sqlSession.update("guideMapper.detailApplyRejectGuide1",guide_id);
	}
	//관리자 가이드 신청 거절 멤버 테이블
	public int detailApplyRejectGuide2(String guide_id) {
		return sqlSession.delete("memberMapper.detailApplyRejectGuide2",guide_id);
	}
	//관리자 가이드 신청 승인 가이드 테이블
	public int updateDetailAcceptGuide1(String guide_id) {
		return sqlSession.update("guideMapper.updateDetailAcceptGuide1", guide_id);
	}
	//관리자 가이드 신청 승인 멤버 테이블
	public int updateDetailAcceptGuide2(String guide_id) {
		return sqlSession.update("memberMapper.updateDetailAcceptGuide2", guide_id);
	}

	public int updateDetailForcedExitGuide(String guide_id) {
		return sqlSession.delete("guideMapper.updateDetailForcedExitGuide", guide_id);
	}

	public int insertWordGuide(Guide guide) {
		return sqlSession.insert("guideMapper.insertWordGuide", guide);
	}
}
