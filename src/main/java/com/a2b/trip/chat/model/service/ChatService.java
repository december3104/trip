package com.a2b.trip.chat.model.service;

import java.util.ArrayList;

import com.a2b.trip.chat.model.vo.Chat;

public interface ChatService {

	ArrayList<Chat> selectAllChatRoom(String member_id);

	Chat selectChatRoom(String chatNo);

	int insertChatRoom(Chat chat);

	int insertChatMember(Chat chat);

	ArrayList<Chat> selectRoonNoContent(Chat chat);

	Chat selectOneRoom(Chat chat);

	ArrayList<Chat> selectMember(String roomNo);

	int insertChatContent(Chat chatContent);

	ArrayList<Chat> selectLastContent(String member_id);

	int updateNewContent(Chat chat);

	int updateNewContent2(Chat chat);

	int updateCLogin(Chat chat);

	Chat selectCNew(Chat chat);

}
