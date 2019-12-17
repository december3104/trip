package com.a2b.trip.place.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("placeDao")
public class PlaceDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public PlaceDao() {}
}
