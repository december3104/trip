package com.a2b.trip.guidematching.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("guideMatchingDao")
public class GuideMatchingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public GuideMatchingDao() {}
}
