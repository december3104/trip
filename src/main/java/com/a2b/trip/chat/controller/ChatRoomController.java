package com.a2b.trip.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.chat.model.service.ChatRoomService;

@Controller
public class ChatRoomController {

	@Autowired
	private ChatRoomService chatRoomService;
	
	public ChatRoomController() {}
}
