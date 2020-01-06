package com.a2b.trip.fellow.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.fellow.model.vo.FellowMatching;

@Repository("fellowMatchingDao")
public class FellowMatchingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public FellowMatchingDao() {}

	public ArrayList<FellowMatching> selectMyFellowMatching(String fm_id) {
		List<FellowMatching> list = sqlSession.selectList("fellowMapper.selectMyFellowMatching", fm_id);
		return (ArrayList<FellowMatching>)list;
	}
}
