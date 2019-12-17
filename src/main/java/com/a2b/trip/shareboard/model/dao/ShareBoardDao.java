package com.a2b.trip.shareboard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("shareBoardDao")
public class ShareBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ShareBoardDao() {}
}
