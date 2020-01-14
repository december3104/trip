package com.a2b.trip.member.model.service;

import java.util.ArrayList;

import com.a2b.trip.common.Page;
import com.a2b.trip.guide.model.vo.Guide;
import com.a2b.trip.member.model.vo.Member;

public interface MemberService {
	
	Member selectOneMember(String member_id);
	Member loginChkMember(Member member);
	int insertMember(Member member);
	int updateMember(Member member);
	int updateGuideMember(String member_id);
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
	
}
