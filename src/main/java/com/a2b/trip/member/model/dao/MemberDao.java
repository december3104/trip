package com.a2b.trip.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	// 가이드 탈퇴
	public int updateGuideMember(String member_id) {
		return sqlSession.update("memberMapper.updateGuideMember", member_id);
	}

	// 회원 탈퇴
	public int deleteMember(String member_id) {
		return sqlSession.delete("memberMapper.deleteMember", member_id);
	}

	// 아이디 중복 확인
	public int selectSearchMemberId(String member_id) {
		return sqlSession.selectOne("memberMapper.selectSearchMemberId", member_id);
	}


}
