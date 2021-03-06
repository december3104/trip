package com.a2b.trip.qna.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.a2b.trip.common.Page;
import com.a2b.trip.qna.model.vo.Qna;
import com.a2b.trip.qna.model.vo.QnaComment;

@Repository("qnaDao")
public class QnaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public QnaDao() {}
	
	public ArrayList<Qna> selectAllQna(Page page) {
		List<Qna> list = sqlSession.selectList("qnaMapper.selectList", page);
		return (ArrayList<Qna>)list;
	}

	public int selectTotal() {
		return sqlSession.selectOne("qnaMapper.selectTotal");
	}

	public int insertQna(Qna qna) {
		return sqlSession.insert("qnaMapper.insertQna", qna);
	}

	public Qna selectDetailViewQna(int qna_no) {
		return sqlSession.selectOne("qnaMapper.selectOne", qna_no);
	}

	public int updateQna(Qna qna) {
		return sqlSession.update("qnaMapper.updateQna", qna);
	}

	public ArrayList<Qna> selectListMyQna(Page page) {
		List<Qna>list = sqlSession.selectList("qnaMapper.selectListMyQna", page);
		return (ArrayList<Qna>)list;
	}

	public int selectMyTotal(String qna_id) {
		return sqlSession.selectOne("qnaMapper.selectMyTotal", qna_id);
	}

	public int deleteQna(int qna_no) {
		return sqlSession.delete("qnaMapper.deleteQna", qna_no);
	}


	public ArrayList<Qna> selectListQna(Page page) {
		List<Qna> list = sqlSession.selectList("qnaMapper.selectListQna", page);
		return (ArrayList<Qna>)list;
	}

	public int selectSearchTotal(String search) {
		return sqlSession.selectOne("qnaMapper.selectSearchTotal", search);
	}

	public QnaComment selectQnaComment(int qna_no) {
		return sqlSession.selectOne("qnaMapper.selectQnaComment",qna_no);
	}

	public int insertReplyQnA(QnaComment qc) {
		return sqlSession.insert("qnaMapper.insertReplyQnA", qc);
	}

	public int updateReplyQnA(QnaComment qc) {
		return sqlSession.update("qnaMapper.updateReplyQnA", qc);

	}

	public int deleteReplyQnA(int qna_no) {
		return sqlSession.delete("qnaMapper.deleteReplyQnA", qna_no);
	}

	public int updateQnaAlarm(int qna_no) {
		return sqlSession.update("qnaMapper.updateQnaAlarm", qna_no);
	}

}
