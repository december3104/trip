package com.a2b.trip.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chatContentDao")
public class ChatContentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ChatContentDao() {}
}
