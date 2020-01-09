package com.a2b.trip.guidebook.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.guidebook.model.vo.Guidebook;

@Repository("guidebookDao")
public class GuidebookDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public GuidebookDao() {}

	public int insertGuidebook(Guidebook guidebook) {
		return sqlSession.insert("guidebookMapper.insertGuidebook", guidebook);
	}
}
