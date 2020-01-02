package com.a2b.trip.qna.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.common.Page;
import com.a2b.trip.qna.model.vo.Qna;

@Repository("qnaDao")
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public QnaDao() {}
	
	public ArrayList<Qna> selectAllQna(Page page) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList", page);
	}

	public int selectTotal() {
		return sqlSession.selectOne("qnaMapper.selectTotal");
	}
}
