package com.a2b.trip.qnacomment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.qnacomment.model.dao.QnaCommentDao;

@Service("qnaCommentService")
public class QnaCommentServiceImpl implements QnaCommentService {

	@Autowired
	private QnaCommentDao qnaCommentDao;
	
	public QnaCommentServiceImpl() {}
}
