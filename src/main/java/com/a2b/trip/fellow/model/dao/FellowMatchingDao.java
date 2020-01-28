package com.a2b.trip.fellow.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.fellow.model.vo.Fellow;
import com.a2b.trip.fellow.model.vo.FellowMatching;

@Repository("fellowMatchingDao")
public class FellowMatchingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public FellowMatchingDao() {}

	public ArrayList<Fellow> selectMyFellowMatching(String fm_id) {
		List<Fellow> list = sqlSession.selectList("fellowMapper.selectMyFellowMatching", fm_id);
		return (ArrayList<Fellow>)list;
	}
	
	public Fellow selectMyFellowMatchingOne(String fb_id) {
		return sqlSession.selectOne("fellowMapper.selectMyFellowMatchingOne", fb_id);
	}

	// 신고 처리 후 컬럼값 변경
	public int updateFellowMatchingReport(int fb_no) {
		return sqlSession.update("fellowMapper.updateFellowMatchingReport", fb_no);
	}

	public int insertFellowMatching(FellowMatching fm) {
		return sqlSession.insert("fellowMapper.insertFellowMatching", fm);
	}

	public int updateFellowMatching(Fellow fellow) {
		return sqlSession.update("fellowMapper.updateFellowMatching", fellow);
	}
}
