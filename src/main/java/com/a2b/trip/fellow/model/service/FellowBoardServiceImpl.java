package com.a2b.trip.fellow.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.common.Page;
import com.a2b.trip.fellow.model.dao.FellowBoardDao;
import com.a2b.trip.fellow.model.vo.FellowBoard;

@Service("fellowBoardService")
public class FellowBoardServiceImpl implements FellowBoardService {

	@Autowired
	private FellowBoardDao fellowBoardDao;
	
	public FellowBoardServiceImpl() {}

	@Override
	public int selectTotal() {
		return fellowBoardDao.selectTotal();
	}

	@Override
	public ArrayList<FellowBoard> selectAllFellowBoard(Page page) {
		return fellowBoardDao.selectAllFellowBoard(page);
	}
}
