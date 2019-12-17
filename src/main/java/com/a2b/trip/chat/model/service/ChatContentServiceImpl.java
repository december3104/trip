package com.a2b.trip.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.chat.model.dao.ChatContentDao;

@Service("chatContentService")
public class ChatContentServiceImpl implements ChatContentService {

	@Autowired
	private ChatContentDao chatContentDao;
	
	public ChatContentServiceImpl() {}
}
