package com.a2b.trip.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.a2b.trip.qna.model.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	public QnaController() {}
}
