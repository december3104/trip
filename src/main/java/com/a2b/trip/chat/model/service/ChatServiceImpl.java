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

}
