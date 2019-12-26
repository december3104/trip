package com.a2b.trip.guidebook.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("guidebookMakingDao")
public class GuidebookMakingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public GuidebookMakingDao() {}
}
