package com.a2b.trip.notice.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public NoticeDao() {}
}
