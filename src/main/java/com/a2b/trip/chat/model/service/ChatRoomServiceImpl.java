package com.a2b.trip.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.chat.model.dao.ChatRoomDao;

@Service("chatRoomService")
public class ChatRoomServiceImpl implements ChatRoomService {

	@Autowired
	private ChatRoomDao chatRoomDao;
	
	public ChatRoomServiceImpl() {}
}
