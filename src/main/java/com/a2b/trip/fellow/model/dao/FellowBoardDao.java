package com.a2b.trip.fellow.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.vo.FellowBoard;
import com.a2b.trip.fellow.model.vo.FellowMatching;
import com.a2b.trip.location.model.vo.Location;

@Repository("fellowBoardDao")
public class FellowBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public FellowBoardDao() {}

	public int selectTotal() {
		return sqlSession.selectOne("fellowMapper.selectTotal");
	}
	
	public ArrayList<FellowBoard> selectAllFellowBoard(Page page) {
		List<FellowBoard> list = sqlSession.selectList("fellowMapper.selectAllFellowBoard", page);
		return (ArrayList<FellowBoard>)list;
	}

	public FellowBoard selectOneFellowBoard(int fb_no) {
		return sqlSession.selectOne("fellowMapper.selectOneFellowBoard", fb_no);
	}

	public ArrayList<Location> selectAllLocation() {
		List<Location> list = sqlSession.selectList("fellowMapper.selectAllLocation");
		return (ArrayList<Location>)list;
	}

	public ArrayList<FellowMatching> selectAllFellowmatching(int fb_no) {
		List<FellowMatching> list = sqlSession.selectList("fellowMapper.selectAllFellowMatching", fb_no);
		return (ArrayList<FellowMatching>)list;
	}
}