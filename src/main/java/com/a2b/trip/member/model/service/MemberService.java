package com.a2b.trip.member.model.service;

import java.util.ArrayList;

import com.a2b.trip.member.model.vo.Member;

public interface MemberService {
	
	Member selectOneMember(String member_id);
	Member loginChkMember(Member member);
	int insertMember(Member member);
	int updateMember(Member member);
	int updateGuideMember(String member_id);
	int deleteMember(String member_id);
	int selectSearchMemberId(String member_id);
	
}
