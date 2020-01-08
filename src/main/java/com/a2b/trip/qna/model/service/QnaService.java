package com.a2b.trip.qna.model.service;

import java.util.ArrayList;

import com.a2b.trip.common.Page;
import com.a2b.trip.qna.model.vo.Qna;

public interface QnaService {

	ArrayList<Qna> selectAllQna(Page page);
	int selectTotal();
	int insertQna(Qna qna);
	Qna selectDetailViewQna(int qna_no);
	int updateQna(Qna qna);
	ArrayList<Qna> selectListMyQna(Page page);
	int selectMyTotal(String qna_id);
	int deleteQna(int qna_no);
	
}
