package com.a2b.trip.shareboard.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.a2b.trip.shareboard.model.dao.ShareBoardDao;

@Service("shareBoardService")
public class ShareBoardServiceImpl implements ShareBoardService {

	@Autowired
	private ShareBoardDao shareBoardDao;
	
	public ShareBoardServiceImpl() {}
}
