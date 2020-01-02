package com.a2b.trip.qna.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.common.Page;
import com.a2b.trip.qna.model.dao.QnaDao;
import com.a2b.trip.qna.model.vo.Qna;

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
}
