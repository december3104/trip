package com.a2b.trip.fellowmatching.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("fellowMatchingDao")
public class FellowMatchingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public FellowMatchingDao() {}
}
