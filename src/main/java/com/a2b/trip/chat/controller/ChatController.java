package com.a2b.trip.chat.controller;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ServerEndpoint(value="/echo.do")
public class ChatController {
	
	//로그 처리용 객체 의존성 주입 처리함(종속 객체 주입)
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	private static final List<Session> sessionList=new ArrayList<Session>();

	public ChatController() {}
	
	@RequestMapping(value="selectAllChatRoom.do")
    public ModelAndView getChatViewPage(ModelAndView mav) {
        mav.setViewName("chat/chatRoomList");
        return mav;
    }
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("Connection Established");
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param message
     */
    private void sendAllSessionToMessage(Session self,String message) {
        try {
            for(Session session : ChatController.sessionList) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(message.split(",")[1]+" : "+message);
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    @OnMessage
    public void onMessage(String message,Session session) {
        logger.info("Message From "+message.split(",")[1] + ": "+message.split(",")[0]);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("to : "+message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, message);
    }
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }


}
