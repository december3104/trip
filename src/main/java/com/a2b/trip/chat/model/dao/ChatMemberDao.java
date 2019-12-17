package com.a2b.trip.chat.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chatMemberDao")
public class ChatMemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ChatMemberDao() {}
}
