package com.a2b.trip.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.common.Page;
import com.a2b.trip.guide.model.vo.Guide;
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
	
	// 이메일 주소 중복 확인
	@Override
	public int selectSearchMemberEmail(String member_email) {
		return memberDao.selectSearchMemberEmail(member_email);
	}

	// 전화번호 중복 확인
	@Override
	public int selectSearchMemberPhone(String member_phone) {
		return memberDao.selectSearchMemberPhone(member_phone);
	}

	//관리자 회원 전체 조회
	@Override
	public ArrayList<Member> selectListAllMember(Page page) {
		return memberDao.selectListAllMember(page);
	}
	//관리자 가이드 전체 조회
	@Override
	public ArrayList<Member> selectListAllGuide(Page page) {
		return memberDao.selectListAllGuide(page);
	}
	//관리자 가이드 신청 회원 전체 조회
	@Override
	public ArrayList<Member> selectListApplyGuide(Page page) {
		return memberDao.selectListApplyGuide(page);
	}
	//관리자 일반회원 관리 상세보기
	@Override
	public Member selectDetailViewMember(String member_id) {
		return memberDao.selectDetailViewMember(member_id);
	}
	//일반 회원 전체 수 조회
	@Override
	public int selectTotal() {
		return memberDao.selectTotal();
	}
	//가이드 회원 전체 수 조회
	@Override
	public int selectTotalGuide() {
		return memberDao.selectTotalGuide();
	}
	//가이드 신청 회원 전체 수
	@Override
	public int selectTotalApplyGuide() {
		return memberDao.selectTotalApplyGuide();
	}
	//일반 회원 강제 탈퇴
	@Override
	public int deleteDetailForcedExitMember(String member_id) {
		return memberDao.deleteDetailForcedExitMember(member_id);
	}
	//가이드 자격 박탈
	@Override
	public int updateDetailForcedExitGuide(String guide_id) {
		return memberDao.updateDetailForcedExitGuide(guide_id);
	}
	//가이드 신청 시 member GUIDE_QUALIFICATION 업데이트
	@Override
	public int updateWordGuide(String guide_id) {
		return memberDao.updateWordGuide(guide_id);
	}

	// 가이드 탈퇴
	@Override
	public int updateGuideQualification(String member_id) {
		return memberDao.updateGuideQualification(member_id);
	}
	
	

	
	

	
}
