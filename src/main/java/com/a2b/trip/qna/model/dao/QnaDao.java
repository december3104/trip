package com.a2b.trip.qna.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("qnaDao")
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public QnaDao() {}
}
