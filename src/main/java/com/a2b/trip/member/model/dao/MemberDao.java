package com.a2b.trip.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.common.Page;
import com.a2b.trip.member.model.vo.Member;

@Repository("memberDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MemberDao() {}
	
	// 회원 정보 조회
	public Member selectOneMember(String member_id) {
		return sqlSession.selectOne("memberMapper.selectOneMember", member_id);
	}

	// 로그인
	public Member loginChkMember(Member member) {
		return sqlSession.selectOne("memberMapper.loginChkMember", member);
	}
	
	// 회원 가입
	public int insertMember(Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	// 회원 정보 수정
	public int updateMember(Member member) {
		return sqlSession.update("memberMapper.updateMember", member);
	}

	// 회원 탈퇴
	public int deleteMember(String member_id) {
		return sqlSession.delete("memberMapper.deleteMember", member_id);
	}

	// 아이디 중복 확인
	public int selectSearchMemberId(String member_id) {
		return sqlSession.selectOne("memberMapper.selectSearchMemberId", member_id);
	}
	
	// 이메일 주소 중복 확인
	public int selectSearchMemberEmail(String member_email) {
		return sqlSession.selectOne("memberMapper.selectSearchMemberEmail", member_email);
	}

	// 전화번호 중복 확인
	public int selectSearchMemberPhone(String member_phone) {
		return sqlSession.selectOne("memberMapper.selectSearchMemberPhone", member_phone);
	}
	
	// 일반 회원 조회
	public ArrayList<Member> selectListAllMember(Page page) {
		List<Member> list = sqlSession.selectList("memberMapper.selectListAllMember", page);
		return (ArrayList<Member>)list;
		
	}
	// 가이드 회원 조회
	public ArrayList<Member> selectListAllGuide(Page page) {
		List<Member> list = sqlSession.selectList("memberMapper.selectListAllGuide",page);
		return (ArrayList<Member>)list;
	}
	// 가이드 신청 회원 조회
	public ArrayList<Member> selectListApplyGuide(Page page) {
		List<Member> list = sqlSession.selectList("memberMapper.selectListApplyGuide",page);		
		return (ArrayList<Member>)list;
	}
	//관리자 일반회원 관리 상세보기
	public Member selectDetailViewMember(String member_id) {
		return sqlSession.selectOne("memberMapper.selectDetailViewMember", member_id);
	}
	//전체 회원 수 조회
	public int selectTotal() {
		return sqlSession.selectOne("memberMapper.selectTotal");
	}
	//전체 가이드 수 조회
	public int selectTotalGuide() {
		return sqlSession.selectOne("memberMapper.selectTotalGuide");
	}
	//전체 가이드 신청자 수 조회
	public int selectTotalApplyGuide() {
		return sqlSession.selectOne("memberMapper.selectTotalApplyGuide");
	}
	//일반 회원 강제 탈퇴
	public int deleteDetailForcedExitMember(String member_id) {
		return sqlSession.delete("memberMapper.deleteDetailForcedExitMember", member_id);
	}
	//가이드 회원 자격박탈
	public int updateDetailForcedExitGuide(String guide_id) {
		return sqlSession.update("memberMapper.updateDetailForcedExitGuide", guide_id);
	}

	public int updateWordGuide(String guide_id) {
		return sqlSession.update("memberMapper.updateWordGuide", guide_id);
	}

	// 가이드 탈퇴
	public int updateGuideQualification(String member_id) {
		return sqlSession.update("memberMapper.updateGuideQualification", member_id);
	}




}
