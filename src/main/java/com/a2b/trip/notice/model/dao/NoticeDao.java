package com.a2b.trip.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.common.Page;
import com.a2b.trip.member.model.vo.Member;
import com.a2b.trip.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public NoticeDao() {}
	
	//관리자 공지사항 전체 목록 조회
	public ArrayList<Notice> selectListAllNotice(Page page) {
		List<Notice> list = sqlSession.selectList("noticeMapper.selectListAllNotice", page);
		return (ArrayList<Notice>)list;
	}
	//관리자 공지사항 상세보기
	public Notice selectDetailViewNotice(int notice_no) {
		return sqlSession.selectOne("noticeMapper.selectDetailViewNotice", notice_no);
	}

	//관리자 공지사항 글 삭제
	public int deleteDetailNotice(int notice_no) {
		return sqlSession.delete("noticeMapper.deleteDetailNotice", notice_no);
	}

	//관리자 공지사항 글쓰기
	public int insertNotice(Notice notice) {
		return sqlSession.insert("noticeMapper.insertNotice", notice);
	}

	//게시글 전체 갯수 조회
	public int selectTotal() {
		return sqlSession.selectOne("noticeMapper.selectTotal");
	}

	public int updateDetailNotice(Notice notice) {
		return sqlSession.update("noticeMapper.updateDetailNotice", notice);
	}

	public Member selectOneMember(String notice_id) {
		return sqlSession.selectOne("noticeMapper.selectOneMember", notice_id);
	}
}
