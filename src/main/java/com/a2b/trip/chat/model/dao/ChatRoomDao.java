package com.a2b.trip.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chatRoomDao")
public class ChatRoomDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ChatRoomDao() {}
}
