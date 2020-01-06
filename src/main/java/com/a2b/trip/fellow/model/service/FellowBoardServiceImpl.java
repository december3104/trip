package com.a2b.trip.fellow.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.fellow.model.dao.FellowBoardDao;

@Service("fellowBoardService")
public class FellowBoardServiceImpl implements FellowBoardService {

	@Autowired
	private FellowBoardDao fellowBoardDao;
	
	public FellowBoardServiceImpl() {}
}
