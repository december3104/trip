package com.a2b.trip.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.a2b.trip.chat.model.service.ChatService;
import com.a2b.trip.chat.model.vo.Chat;
import com.a2b.trip.member.model.vo.Member;

public class ChatServer extends TextWebSocketHandler{

	@Autowired
	private ChatService chatService;
	
	// 로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(ChatServer.class);

	// 사번 저장용
	private static Map<WebSocketSession, String> memberIdSession = Collections.synchronizedMap(new HashMap<WebSocketSession, String>());
	
	// 방 저장용
	private static Map<WebSocketSession, String> roomSession = Collections.synchronizedMap(new HashMap<WebSocketSession, String>());

	public ChatServer() {
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("채팅방 연결 성공");
		
		Map<String, Object> list = session.getAttributes();
		Member member = (Member)list.get("loginMember");
		
		String member_id = member.getMember_id();
		int count = 0;
		
		//동기화 해서 다른 접속 막아줌
		synchronized (memberIdSession) {
			for(WebSocketSession mapkey : memberIdSession.keySet()) {  //먼저 기본방 다 조사해서 같은방 있는지 확인
				String cUser = memberIdSession.get(mapkey);  //기존방에 방번호와 유저들
				
				//서버에 이미 저장된 같은 아이디가 있으면 카운트 갯수가 올라감
				if(member_id.equals(cUser)){
					count++;
				}
			}
			if(count == 0) {
				saveMemberId(session, member_id);
			}
		}
	}
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> list = session.getAttributes();
		Member member = (Member)list.get("loginMember");
		
		String member_id = member.getMember_id();
		
		synchronized (roomSession) {
			for(WebSocketSession mapkey : roomSession.keySet()) {
				if(mapkey == session) {
					Chat chat = new Chat();
					String roomNo = roomSession.get(mapkey);
					chat.setCm_id(member_id);
					chat.setCr_no(roomNo);
					
					chatService.updateCLogin(chat);
					roomSession.remove(session);
					break;
				}
			}
		}
		
		memberIdSession.remove(session);
		logger.info("memberSession 저장인원 : "+memberIdSession.size());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String info = message.getPayload();
		String one = info.substring(0, info.indexOf(":"));
		String two = info.substring(info.indexOf(":")+1, info.length());
		
		
		if(one.equals("room")) {
			//세션과 방정보 맵에 저장
			saveRoomNo(session, two);
			sendMyList(session, two);
			
			Chat chat = new Chat();
			
			Map<String, Object> mList = session.getAttributes();
			Member member = (Member)mList.get("loginMember");
			//보낸사람 아이디
			String member_id = member.getMember_id();
			
			
			chat.setCr_no(two);
			chat.setCm_id(member_id);
			
			chatService.updateNewContent2(chat);
		}else if(one.equals("rChat")) {
			//채팅 보내기
			sendContent(session, two);
		}
	}
	
	//웹소켓 접속시 세션과 아이디 맵에 저장
	private void saveMemberId(WebSocketSession session, String member_id) {
		memberIdSession.put(session, member_id);
		logger.info("저장됐나확인"+memberIdSession.get(session));
		logger.info("memberSession 저장인원 : "+memberIdSession.size());
	}
	
	//방 오픈시 세션과 방번호 맵에 저장
	private void saveRoomNo(WebSocketSession session, String roomNo) {
		roomSession.put(session, roomNo);
		logger.info("방번호 저장됐나확인"+roomSession.get(session));
	}
	
	private void sendContent(WebSocketSession session, String message) throws IOException {
		Map<String, Object> mList = session.getAttributes();
		Member member = (Member)mList.get("loginMember");
		//보낸사람 아이디
		String member_id = member.getMember_id();
				
		logger.info("메시지 보내기 메소드 작동");
		Chat chatContent = new Chat();
		
		String roomAndText[] = message.split(":");
		String roomNo = roomAndText[0];
		String title = roomAndText[1];
		String contry = roomAndText[2];
		String city = roomAndText[3].split("=")[0];
		String send1 = roomNo+":"+title+":"+contry+":"+city;
		String text = message.substring(message.indexOf("=")+1, message.length());
		String id_text = member_id + ":" + text;
		
		//룸 넘버로 아이디 조회
		ArrayList<Chat> list = chatService.selectMember(roomNo);
		
		for(Chat chat : list) {
	    	if(chat.getCm_login().equals("N")) {
	    		chatService.updateNewContent(chat);
	    	}
		}
		
		synchronized (roomSession) { // 방을 열고 있는 유저한테 보내는 for
			for (WebSocketSession mapkey : roomSession.keySet()) {
				String room = roomSession.get(mapkey);
				if (room.equals(roomNo)) {
					if(session != mapkey) {
						mapkey.sendMessage(new TextMessage(id_text));
					}
				}
			}
		
			//대화 db에 저장
			chatContent.setCc_cr_no(roomNo);
			chatContent.setCc_id(member_id);
			chatContent.setCc_content(text);
			
			int result = chatService.insertChatContent(chatContent);
			
		} // 동기화
	
		synchronized (memberIdSession) {	//채팅 목록 열고 있는 사람에게 보내는 for
			for(WebSocketSession mapkey : memberIdSession.keySet()) {
				String memberId = memberIdSession.get(mapkey);
			    for(Chat chat : list) {
					if(chat.getCm_id().equals(memberId)) {
						//이 아이디로 카운트 갯수 조회
						Chat chat1 = chatService.selectCNew(chat);
						
						mapkey.sendMessage(new TextMessage(send1+":"+chat1.getCm_new()+"="+text));
						break;
					}
				}
			}
		}
	}
	
	private void sendMyList(WebSocketSession session, String roomNo) throws IOException {
		Map<String, Object> list = session.getAttributes();
		Member member = (Member)list.get("loginMember");
		
		String member_id = member.getMember_id();
		
		synchronized (memberIdSession) {
			for(WebSocketSession mapkey : memberIdSession.keySet()) {
				String id = memberIdSession.get(mapkey);
				if(id.equals(member_id)) {
					mapkey.sendMessage(new TextMessage("clear:"+roomNo));
				}
			}
		}
		
	}
}
