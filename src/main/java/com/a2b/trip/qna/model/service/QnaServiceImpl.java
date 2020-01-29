package com.a2b.trip.qna.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.common.Page;
import com.a2b.trip.qna.model.dao.QnaDao;
import com.a2b.trip.qna.model.vo.Qna;
import com.a2b.trip.qna.model.vo.QnaComment;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDao qnaDao;
	
	public QnaServiceImpl() {}

	@Override
	public ArrayList<Qna> selectAllQna(Page page) {
		return qnaDao.selectAllQna(page);
	}

	@Override
	public int selectTotal() {
		return qnaDao.selectTotal();
	}

	@Override
	public int insertQna(Qna qna) {
		return qnaDao.insertQna(qna);
	}

	@Override
	public Qna selectDetailViewQna(int qna_no) {
		return qnaDao.selectDetailViewQna(qna_no);
	}

	@Override
	public int updateQna(Qna qna) {		
		return qnaDao.updateQna(qna);
	}

	@Override
	public ArrayList<Qna> selectListMyQna(Page page) {
		return qnaDao.selectListMyQna(page);
	}

	@Override
	public int selectMyTotal(String qna_id) {
		return qnaDao.selectMyTotal(qna_id);
	}

	@Override
	public int deleteQna(int qna_no) {
		return qnaDao.deleteQna(qna_no);
	}

	@Override
	public ArrayList<Qna> selectListQna(Page page) {
		return qnaDao.selectListQna(page);
	}

	@Override
	public int selectSearchTotal(String search) {
		return qnaDao.selectSearchTotal(search);
	}

	//2020_01_09 ssm
	
	//qnacomment 조회
	@Override
	public QnaComment selectQnaComment(int qna_no) {
		return qnaDao.selectQnaComment(qna_no);
	}
	//qnacomment 입력
	@Override
	public int insertReplyQnA(QnaComment qc) {
		return qnaDao.insertReplyQnA(qc);
	}
	//qnacomment 수정
	@Override
	public int updateReplyQnA(QnaComment qc) {
		return qnaDao.updateReplyQnA(qc);
	}
	//qnacomment 삭제
	@Override
	public int deleteReplyQnA(int qna_no) {
		return qnaDao.deleteReplyQnA(qna_no);
	}

	@Override
	public int updateQnaAlarm(int qna_no) {
		return qnaDao.updateQnaAlarm(qna_no);
	}
	
	
	
	
	
	
	
	
	
	//end

}
