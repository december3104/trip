package com.a2b.trip.chat.controller;

import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.a2b.trip.chat.model.service.ChatService;
import com.a2b.trip.chat.model.vo.Chat;

@Controller
public class ChatController {

	@Autowired
	private ChatService chatService;

	// 로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	public ChatController() {
	}

	// 채팅 메인 연결
	@RequestMapping("selectAllChatRoom.do")
	public ModelAndView getChatViewPage(@RequestParam("member_id") String member_id, ModelAndView mav) {
		
		ArrayList<Chat> chatList = chatService.selectAllChatRoom(member_id);
		logger.info("사이즈"+chatList.size());

		//내가 참여한 방에 마지막글들 조회
		ArrayList<Chat> lastContent = chatService.selectLastContent(member_id);
		
		mav.setViewName("chat/chatRoomList");
		mav.addObject("chatList", chatList);
		mav.addObject("lastContent", lastContent);
		return mav;
	}

	@RequestMapping("openChat.do")
	public String openChat(Chat chat, Model model) {
		// 방 글들 조회해서 저장
		ArrayList<Chat> contentList = chatService.selectRoonNoContent(chat);
		
		// 방 정보 조회
		Chat roomInfo = chatService.selectOneRoom(chat);
		
		model.addAttribute("contentList", contentList);
		model.addAttribute("roomInfo", roomInfo);
		return "chat/openChat";
	}

}
