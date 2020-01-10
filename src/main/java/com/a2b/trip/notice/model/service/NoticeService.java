package com.a2b.trip.notice.model.service;

import java.util.ArrayList;

import com.a2b.trip.common.Page;
import com.a2b.trip.member.model.vo.Member;
import com.a2b.trip.notice.model.vo.Notice;

public interface NoticeService {

	ArrayList<Notice> selectListAllNotice(Page page);

	Notice selectDetailViewNotice(int notice_no);

	int deleteDetailNotice(int notice_no);

	int insertNotice(Notice notice);

	int selectTotal();

	int updateDetailNotice(Notice notice);

	Member selectOneMember(String notice_id);

	

}
