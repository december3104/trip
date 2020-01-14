package com.a2b.trip.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.chat.model.vo.Chat;

@Repository("chatDao")
public class ChatDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ChatDao() {}

	//채팅방 전체 조회
	public ArrayList<Chat> selectAllChatRoom(String member_id) {
		List<Chat> list = sqlSession.selectList("chatMapper.selectAllChatRoom", member_id); 
		return (ArrayList<Chat>)list;
	}
}
