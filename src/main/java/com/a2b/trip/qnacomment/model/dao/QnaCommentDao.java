package com.a2b.trip.qnacomment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("qnaCommentDao")
public class QnaCommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public QnaCommentDao() {}
}
