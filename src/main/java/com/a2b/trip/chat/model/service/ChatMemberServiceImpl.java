package com.a2b.trip.chat.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.chat.model.dao.ChatMemberDao;

@Service("chatMemberService")
public class ChatMemberServiceImpl implements ChatMemberService {

	@Autowired
	private ChatMemberDao chatMemberDao;
	
	public ChatMemberServiceImpl() {}
}
