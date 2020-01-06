package com.a2b.trip.fellow.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("fellowBoardDao")
public class FellowBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public FellowBoardDao() {}
}
