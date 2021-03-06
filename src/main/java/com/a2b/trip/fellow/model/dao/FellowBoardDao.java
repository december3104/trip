package com.a2b.trip.fellow.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.vo.Fellow;
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

	// 동행 찾기 기록
	public ArrayList<Fellow> selectMyFellowBoard(String fb_id) {
		List<Fellow> list = sqlSession.selectList("fellowMapper.selectMyFellowBoard", fb_id);
		return (ArrayList<Fellow>)list;
	}

	// 한명 조회
	public Fellow selectMyFellowBoardOne(String fm_id) {
		return sqlSession.selectOne("fellowMapper.selectMyFellowBoardOne", fm_id);
	}
	
	public int insertFellowBoard(FellowBoard fb) {
		return sqlSession.insert("fellowMapper.insertFellowBoard", fb);

	}

	// 신고 처리 후 컬럼값 변경
	public int updateFellowBoardReport(int fb_no) {
		return sqlSession.update("fellowMapper.updateFellowBoardReport", fb_no);
	}

	public int selectMyTotal(String qna_id) {
		return sqlSession.selectOne("fellowMapper.selectMyTotal", qna_id);
	}

	public ArrayList<FellowBoard> selectListMyFellowBoard(Page page) {
		List<FellowBoard> list = sqlSession.selectList("fellowMapper.selectListMyFellowBoard", page); 
		return (ArrayList<FellowBoard>)list;
	}

	public int selectSearchTotal(String search) {
		return sqlSession.selectOne("fellowMapper.selectSearchTotal", search);
	}

	public ArrayList<FellowBoard> selectListFellowBoard(Page page) {
		List<FellowBoard> list = sqlSession.selectList("fellowMapper.selectListFellowBoard", page);
		return (ArrayList<FellowBoard>)list;
	}

	public int updateFellowBoard(FellowBoard fb) {
		return sqlSession.update("fellowMapper.updateFellowBoard", fb);
	}

	public int deleteFellowBoard(int fb_no) {
		return sqlSession.delete("fellowMapper.deleteFellowBoard", fb_no);
	}
}
