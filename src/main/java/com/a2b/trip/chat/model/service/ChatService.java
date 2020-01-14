package com.a2b.trip.chat.model.service;

import java.util.ArrayList;

import com.a2b.trip.chat.model.vo.Chat;

public interface ChatService {

	ArrayList<Chat> selectAllChatRoom(String member_id);

}
