package com.a2b.trip.guidebook.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.guidebook.model.vo.Guidebook;

@Repository("guidebookDao")
public class GuidebookDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public GuidebookDao() {}

	public int insertGuidebook(Guidebook guidebook) {
		return sqlSession.insert("guidebookMapper.insertGuidebook", guidebook);
	}
	
	public int updateGuidebook(Guidebook guidebook) {
		return sqlSession.update("guidebookMapper.updateGuidebook", guidebook);
	}

	// 내 가이드북 보기
	public ArrayList<Guidebook> selectGuidebookMyList(String book_id) {
		List<Guidebook> list = sqlSession.selectList("guidebookMapper.selectGuidebookMyList", book_id);
		return (ArrayList<Guidebook>)list;
	}

	// 가이드북 삭제
	public int deleteGuidebook(String book_no) {
		return sqlSession.delete("guidebookMapper.deleteGuidebook", book_no);
	}

	// 가이드북 상세보기
	public Guidebook selectMyGuidebookOne(String book_no) {
		return sqlSession.selectOne("guidebookMapper.selectMyGuidebookOne", book_no);
	}
}
