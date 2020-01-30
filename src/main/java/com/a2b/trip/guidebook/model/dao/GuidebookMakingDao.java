package com.a2b.trip.guidebook.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.guidebook.model.vo.GuidebookMaking;

@Repository("guidebookMakingDao")
public class GuidebookMakingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public GuidebookMakingDao() {}

	public int insertBookpage(GuidebookMaking gbmaking) {
		return sqlSession.insert("guidebookMapper.insertBookpage", gbmaking);
	}
}
