package com.a2b.trip.qna.model.service;

import java.util.ArrayList;

import com.a2b.trip.common.Page;
import com.a2b.trip.qna.model.vo.Qna;

public interface QnaService {

	ArrayList<Qna> selectAllQna(Page page);
	int selectTotal();
}
