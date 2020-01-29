package com.a2b.trip.member.model.service;

import java.util.ArrayList;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.vo.Fellow;
import com.a2b.trip.fellow.model.vo.FellowMatching;
import com.a2b.trip.guidematching.model.vo.MyGuideMatching;
import com.a2b.trip.member.model.vo.Member;
import com.a2b.trip.qna.model.vo.Qna;

public interface MemberService {
	
	Member selectOneMember(String member_id);
	Member loginChkMember(Member member);
	int insertMember(Member member);
	int updateMember(Member member);
	int deleteMember(String member_id);
	int selectSearchMemberId(String member_id);
	int selectSearchMemberEmail(String member_email);
	int selectSearchMemberPhone(String member_phone);
	ArrayList<Member> selectListAllMember(Page page);
	ArrayList<Member> selectListAllGuide(Page page);
	ArrayList<Member> selectListApplyGuide(Page page);
	Member selectDetailViewMember(String member_id);
	int selectTotal();
	int selectTotalGuide();
	int selectTotalApplyGuide();
	int deleteDetailForcedExitMember(String member_id);
	int updateDetailForcedExitGuide(String guide_id);
	int updateWordGuide(String guide_id);
	int updateGuideQualification(String member_id);
	String selectMissingMemberId(Member member);
	int updateMissingMemberPwd(Member member);
	ArrayList<Fellow> selectFbAlarmCount(String fb_id);
	ArrayList<Fellow> selectFmAlarmCount(String fm_id);
	ArrayList<Qna> selectQnaAlarmCount(String qna_id);
	int selectGuideApplyAlarmCount(String member_id);
	ArrayList<MyGuideMatching> selectGbAlarmCount(String gb_id);
	int updateFbAlarm(Fellow fellow);
	int updateFmAlarm(Fellow fellow);
	int updateGbAlarm(MyGuideMatching myGuideMatching);
	int updateGuideApplyAlarm(String member_id);
	int updateQnaAlarm(Qna qna);
}
