package com.a2b.trip.location.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.location.model.vo.Location;

@Repository("locationDao")
public class LocationDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public LocationDao() {}

	public ArrayList<Location> selectAll() {
		List<Location> list = sqlSession.selectList("locationMapper.selectAll");
		return (ArrayList<Location>)list;
	}
}
