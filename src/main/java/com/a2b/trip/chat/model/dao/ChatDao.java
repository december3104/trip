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

	public Chat selectChatRoom(String chatNo) {
		return sqlSession.selectOne("chatMapper.selectChatRoom", chatNo);
	}

	public int insertChatRoom(Chat chat) {
		return sqlSession.insert("chatMapper.insertChatRoom", chat);
	}

	public int insertChatMember(Chat chat) {
		return sqlSession.insert("chatMapper.insertChatMember", chat);
	}

	public ArrayList<Chat> selectRoomNoContent(Chat chat) {
		List<Chat> list = sqlSession.selectList("chatMapper.selectRoomNoContent", chat);
		return (ArrayList<Chat>)list;
	}

	public Chat selectOneRoom(Chat chat) {
		return sqlSession.selectOne("chatMapper.selectOneRoom", chat);
	}

	public ArrayList<Chat> selectMember(String roomNo) {
		List<Chat> list = sqlSession.selectList("chatMapper.selectMember", roomNo); 
		return (ArrayList<Chat>)list;
	}

	public int insertChatContent(Chat chatContent) {
		return sqlSession.insert("chatMapper.insertChatContent", chatContent);
	}

	public ArrayList<Chat> selectLastContent(String member_id) {
		List<Chat> list = sqlSession.selectList("chatMapper.selectLastContent", member_id); 
		return (ArrayList<Chat>)list;
	}

	public int updateNewContent(Chat chat) {
		return sqlSession.update("chatMapper.updateNewContent", chat);
	}

	public int updateNewContent2(Chat chat) {
		return sqlSession.update("chatMapper.updateNewContent2", chat);
	}

	public int updateCLogin(Chat chat) {
		return sqlSession.update("chatMapper.updateCLogin", chat);
	}

	public Chat selectCNew(Chat chat) {
		return sqlSession.selectOne("chatMapper.selectCNew", chat);
	}

}
