package com.a2b.trip.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.member.model.dao.MemberDao;
import com.a2b.trip.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public MemberServiceImpl() {}

	// 회원 정보 조회
	@Override
	public Member selectOneMember(String member_id) {
		return memberDao.selectOneMember(member_id);
	}

	// 로그인
	@Override
	public Member loginChkMember(Member member) {
		return memberDao.loginChkMember(member);
	}

	// 회원 가입
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	// 회원 정보 수정
	@Override
	public int updateMember(Member member) {
		return memberDao.updateMember(member);
	}

	// 가이드 탈퇴
	@Override
	public int updateGuideMember(String member_id) {
		return memberDao.updateGuideMember(member_id);
	}

	// 회원 탈퇴
	@Override
	public int deleteMember(String member_id) {
		return memberDao.deleteMember(member_id);
	}

	// 아이디 중복 확인
	@Override
	public int selectSearchMemberId(String member_id) {
		return memberDao.selectSearchMemberId(member_id);
	}

	@Override
	public ArrayList<Member> selectListAllMember() {
		return memberDao.selectListAllMember();
	}

	@Override
	public ArrayList<Member> selectListAllGuide() {
		return memberDao.selectListAllGuide();
	}

	
}
