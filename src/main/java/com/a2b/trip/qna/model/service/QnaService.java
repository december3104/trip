package com.a2b.trip.qna.model.service;

import java.util.ArrayList;

import com.a2b.trip.common.Page;
import com.a2b.trip.qna.model.vo.Qna;
import com.a2b.trip.qna.model.vo.QnaComment;

public interface QnaService {

	ArrayList<Qna> selectAllQna(Page page);
	int selectTotal();
	int insertQna(Qna qna);
	Qna selectDetailViewQna(int qna_no);
	int updateQna(Qna qna);
	ArrayList<Qna> selectListMyQna(Page page);
	int selectMyTotal(String qna_id);
	int deleteQna(int qna_no);
	ArrayList<Qna> selectListQna(Page page);
	int selectSearchTotal(String search);
	QnaComment selectQnaComment(int qna_no);
	int insertReplyQnA(QnaComment qc);
	int updateReplyQnA(QnaComment qc);
	int deleteReplyQnA(int qna_no);

}
