package com.a2b.trip.guidematching.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("guideBoardDao")
public class GuideBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public GuideBoardDao() {}
}
