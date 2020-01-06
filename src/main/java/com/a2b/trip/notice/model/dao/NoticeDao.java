package com.a2b.trip.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.member.model.vo.Member;
import com.a2b.trip.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public NoticeDao() {}
	

	public ArrayList<Notice> selectListAllNotice() {
		List<Notice> list = sqlSession.selectList("noticeMapper.selectListAllNotice");
		return (ArrayList<Notice>)list;
	}

	public Notice selectDetailViewNotice(int notice_no) {
		return sqlSession.selectOne("noticeMapper.selectDetailViewNotice", notice_no);
	}


	public int deleteDetailNotice(int notice_no) {
		return sqlSession.delete("noticeMapper.deleteDetailNotice", notice_no);
	}
}
