package com.a2b.trip.qnacomment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.qnacomment.model.service.QnaCommentService;

@Controller
public class QnaCommentController {

	@Autowired
	private QnaCommentService qnaCommentService;
	
	public QnaCommentController() {}
}
