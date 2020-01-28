package com.a2b.trip.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.chat.model.dao.ChatDao;
import com.a2b.trip.chat.model.vo.Chat;

@Service("chatService")
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	public ChatServiceImpl() {}

	@Override
	public ArrayList<Chat> selectAllChatRoom(String member_id) {
		return chatDao.selectAllChatRoom(member_id);
	}

	@Override
	public Chat selectChatRoom(String chatNo) {
		return chatDao.selectChatRoom(chatNo);
	}

	@Override
	public int insertChatRoom(Chat chat) {
		return chatDao.insertChatRoom(chat);
	}

	@Override
	public int insertChatMember(Chat chat) {
		return chatDao.insertChatMember(chat);
	}

	@Override
	public ArrayList<Chat> selectRoonNoContent(Chat chat) {
		return chatDao.selectRoomNoContent(chat);
	}

	@Override
	public Chat selectOneRoom(Chat chat) {
		return chatDao.selectOneRoom(chat);
	}

	@Override
	public ArrayList<Chat> selectMember(String roomNo) {
		return chatDao.selectMember(roomNo);
	}

	@Override
	public int insertChatContent(Chat chatContent) {
		return chatDao.insertChatContent(chatContent);
	}

	@Override
	public ArrayList<Chat> selectLastContent(String member_id) {
		return chatDao.selectLastContent(member_id);
	}

	@Override
	public int updateNewContent(Chat chat) {
		return chatDao.updateNewContent(chat);
	}

	@Override
	public int updateNewContent2(Chat chat) {
		return chatDao.updateNewContent2(chat);
	}

	@Override
	public int updateCLogin(Chat chat) {
		return chatDao.updateCLogin(chat);
	}

	@Override
	public Chat selectCNew(Chat chat) {
		return chatDao.selectCNew(chat);
	}

}
